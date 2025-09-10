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

return GameUtils