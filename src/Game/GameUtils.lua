local RankInfoConfig = require "Game.Target.ArcherDuel.Config.RankInfoConfig"

local GameUtils = {}

-- 根据分数获取等级
function GameUtils.GetRankLevelByScore(score)
    -- 假设 levels 已按照 base_score 升序排列
    local prev_level = RankInfoConfig[1]
    for i = 2, #RankInfoConfig do
        local level = RankInfoConfig[i]
        if score < level.base_score then
            -- 之前的等级就是当前等级
            return prev_level, level
        end
        prev_level = level
    end
    -- 积分超过所有等级基础积分，返回最高等级
    return RankInfoConfig[#RankInfoConfig]
end

-- 设置玩家排位积分
function GameUtils.SetPlayerRankScore(score)
    Log:PrintLog("[GameUtils.SetPlayerRankScore] score：" .. score)
    if score < 0 then
        score = 0
    end
    local playerId = Character:GetLocalPlayerId()
    Archive:SetPlayerData(playerId, Archive.TYPE.Number, "Player_BattlePoints_Num", score)
end

-- 保存玩家排位积分
function GameUtils.GetPlayerRankScore()
    local playerId = Character:GetLocalPlayerId()
    --加积分
    local Player_BattlePoints_Num = Archive:GetPlayerData(playerId, Archive.TYPE.Number, "Player_BattlePoints_Num")
    if Player_BattlePoints_Num then
        return Player_BattlePoints_Num
    else
        return 0
    end
end

-- 给玩家添加奖励物品
function GameUtils.AddPlayerReward(rewardArchive, addRewardCount)
    local playerId = Character:GetLocalPlayerId()
    --加积分
    local Reward_Num = Archive:GetPlayerData(playerId, Archive.TYPE.Number, rewardArchive)
    Reward_Num = (Reward_Num or 0) + addRewardCount
    Archive:SetPlayerData(playerId, Archive.TYPE.Number, rewardArchive, Reward_Num)
end

function GameUtils.GetEquipmentMap()
    if GameUtils.EquipmentMap then
        return GameUtils.EquipmentMap
    end

    GameUtils.EquipmentMap = {}
    local EquipmentConfig = require "Game.Target.ArcherDuel.Config.EquipmentConfig"
    for i, v in pairs(EquipmentConfig) do
        local Grade = v.Attributes.Grade
        GameUtils.EquipmentMap[Grade] = GameUtils.EquipmentMap[Grade] or {}
        table.insert(GameUtils.EquipmentMap[Grade], i)
    end
end

-- 开宝箱获取奖励物品
function GameUtils.OpenBoxReward(boxId)
    local OpenBoxConfig = require "Game.Target.ArcherDuel.Config.OpenBoxConfig"
    local BoxConfig
    if boxId == 200002 then -- 高级宝箱
        BoxConfig = OpenBoxConfig.SilverBox
    elseif boxId == 200003 then -- 极品宝箱
        BoxConfig = OpenBoxConfig.GoldBox
    end

    local Weight = 0
    for i, v in ipairs(BoxConfig) do
        Weight = Weight + v.Weight
    end

    local function getReward()
        math.randomseed(TimerManager:GetClock())
        local random = math.random(1, Weight)
        for i, v in ipairs(BoxConfig) do
            Weight = Weight + v.Weight
            if random <= Weight then
                if v.EquipIds then -- 有指认装备，直接从指认装备中取
                    return v.EquipIds[math.random(1, v.EquipIds)]
                else -- 没有指认装备，从装备池中取
                    local equipmap = GameUtils.GetEquipmentMap()
                    local equipIds = equipmap[v.Grade]
                    if equipIds then
                        return equipIds[math.random(1, #equipIds)]
                    end
                end
            end
        end
    end

    local rewards = {}
    for i = 1, 3 do -- 取3次
        table.insert(rewards, getReward())
    end
    return rewards
end

return GameUtils