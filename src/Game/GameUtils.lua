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
    return GameUtils.EquipmentMap
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

    math.randomseed(TimerManager:GetClock())
    local function getReward()
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


function GameUtils.DefaultEquipmentData()
    --没有则初始化
    local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
    local AllEquipment = {}
    local InitEquippedID = { [1] = true, [15] = true, [38] = true, [61] = true, [77] = true, [93] = true }
    for ID, Data in pairs(EquipmentConfig) do
        local HasInit = InitEquippedID[ID]
        local Equipment = {
            ID = ID,                        --装备编号ID
            Level = 1,                      --装备等级
            Piece = 0,                      --碎片数量
            Category = Data.Category,       --装备类别
            Unlock = HasInit,               --是否解锁
            Equipped = HasInit,             --是否装备
        }
        if HasInit then
            Equipment.Piece = 50
            Equipment.Level = 3
        end
        AllEquipment[ID] = Equipment
    end
    return AllEquipment
end

-- 战斗胜利时获取奖励
function GameUtils.GetRewardsByWin()
    local OpenBoxConfig = require "Game.Target.ArcherDuel.Config.OpenBoxConfig"
    local Weight = 0
    for i, v in ipairs(OpenBoxConfig.BattleBox) do
        Weight = Weight + v.Weight
    end

    math.randomseed(TimerManager:GetClock())

    local function GetOneReward()
        -- 先随品阶
        -- 再随装备
        local random = math.random(1, Weight)
        local tempWeight = 0
        for i, v in ipairs(OpenBoxConfig.BattleBox) do
            tempWeight = tempWeight + v.Weight
            if random <= tempWeight then
                local equipmap = GameUtils.GetEquipmentMap()
                local equipIds = equipmap[v.Grade]
                if equipIds then
                    return equipIds[math.random(1, #equipIds)]
                end
            end
        end
    end

    local rewards = {}
    for i = 1, 2 do -- 取2次
        table.insert(rewards, GetOneReward())
    end
    return rewards
end

--获取当前是星期几
function GameUtils.GetWeekDay()
    -- 设定2000-01-01 00:00:00的时间戳作为epoch零点
    local epochZeroTs = MiscService:DateYMDHMSToTime("2000-01-01 00:00:00")

    -- 日期字符串转零点时间戳: "YYYY-MM-DD" -> 当天零点时间戳
    local function dateStrToZeroTime(dateStr)
        return MiscService:DateYMDHMSToTime(dateStr .. " 00:00:00")
    end

    -- 时间戳转日期字符串 "YYYY-MM-DD"
    local function timeToDateStr(ts)
        return string.sub(MiscService:TimeStampToDateYMDHMS(ts), 1, 10)
    end

    -- 计算距离2000-01-01零点的天数
    local function getDaysSinceEpoch(ts)
        local zeroTs = dateStrToZeroTime(timeToDateStr(ts))
        return math.floor((zeroTs - epochZeroTs) / (24*3600))
    end

    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    -- 计算星期几，周一=1，周日=7，2000-01-01是周六，偏移5调整
    local days = getDaysSinceEpoch(nowTs)
    return ((days + 5) % 7) + 1
end

return GameUtils