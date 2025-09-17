local RankInfoConfig = require "Game.Target.ArcherDuel.Config.RankInfoConfig"
local TaskEvents = require("Game.Framework.Task.TaskEvents")

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

-- 根据阶段获取等级
function GameUtils.GetRankLevelByTitleLv(titleLv)
    for _, v in ipairs(RankInfoConfig) do
        if v.titleLv == titleLv and v.resetTag == true then
            return v
        end
    end

    return RankInfoConfig[1]
end

-- 是否抵达黄金段位
function GameUtils.IsReachGoldRank(score)
    local level = GameUtils.GetRankLevelByScore(score)
    if level and level.id >= 7 then
        return true
    end

    return false
end

-- 是否抵达钻石段位
function GameUtils.IsReachDiamondRank(score)
    local level = GameUtils.GetRankLevelByScore(score)
    if level and level.id >= 12 then
        return true
    end

    return false
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
function GameUtils.AddPlayerReward(rewardId, addRewardCount)
    local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[rewardId]
    if cfg and cfg.archive then
        local playerId = Character:GetLocalPlayerId()
        --加积分
        local Reward_Num = Archive:GetPlayerData(playerId, Archive.TYPE.Number, cfg.archive)
        Reward_Num = (Reward_Num or 0) + addRewardCount
        Archive:SetPlayerData(playerId, Archive.TYPE.Number, cfg.archive, Reward_Num)
    end
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
    else
        return
    end

    System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.OpenBox) -- 打开宝箱

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
                    return v.EquipIds[math.random(1, #v.EquipIds)]
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

local function getYMD(timestamp)
    local year = MiscService:TimeStampToTime(timestamp, MiscService.ETimeUnit.Year)
    local month = MiscService:TimeStampToTime(timestamp, MiscService.ETimeUnit.Month)
    local day = MiscService:TimeStampToTime(timestamp, MiscService.ETimeUnit.Day)
    return year, month, day
end

-- 蔡勒公式算星期几，返回1-7，1代表周一，7代表周日
local function dayOfWeek(year, month, day)
    if month < 3 then
        month = month + 12
        year = year - 1
    end
    local K = year % 100
    local J = math.floor(year / 100)
    local h = (day + math.floor(13*(month+1)/5) + K + math.floor(K/4) + math.floor(J/4) + 5*J) % 7
    local d = ((h + 5) % 7) + 1
    return d
end

-- 获取 ts 所在周一的时间戳
local function getMondayTimestamp(ts)
    local y,m,d = getYMD(ts)
    local dow = dayOfWeek(y,m,d) -- 获取当日星期几，周一=1

    -- 计算周一日期 = 当前日期 - (dow-1)
    local mondayDay = d - (dow - 1)

    -- 注意月日边界，假设你们有接口能直接根据年月日生成时间戳，这里示范用字符串形式调用
    -- 注意月日可能越界，比如deduct到上个月，此处简单代码可能不支持跨月减日，需要根据你们接口完善
    -- 理想是有接口：DateYMDToTime(year, month, day)
    -- 下面示范拼时间字符串，day可能小于1需要业务改造

    -- 简单的处理示范（不处理跨月，仅示例演示）
    if mondayDay < 1 then
        -- 这里我们简单减一个月
        local prevMonth = m - 1
        local prevYear = y
        if prevMonth < 1 then
            prevMonth = 12
            prevYear = y - 1
        end

        -- 获取上个月天数
        local daysInMonth = {31,28,31,30,31,30,31,31,30,31,30,31}
        local function isLeapYear(yr)
            return (yr % 400 == 0) or (yr % 4 == 0 and yr % 100 ~= 0)
        end
        if isLeapYear(prevYear) then daysInMonth[2] = 29 end

        mondayDay = mondayDay + daysInMonth[prevMonth]
        y = prevYear
        m = prevMonth
    else
        -- 还是原年月日
    end

    local mondayTimeStr = string.format("%04d-%02d-%02d 00:00:00", y, m, mondayDay)
    local mondayTs = MiscService:DateYMDHMSToTime(mondayTimeStr)
    return mondayTs
end

--获取当前是星期几
function GameUtils.GetWeekDay()
    local year = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Year)
    local month= MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Month)
    local day  = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Day)
    local weekDay = dayOfWeek(year, month, day)
    return weekDay
end

-- 跨天判断
function GameUtils.isCrossDay(lastLoginTs)
    if not lastLoginTs then return true end

    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    local lastYear, lastMonth, lastDay = getYMD(lastLoginTs)
    local nowYear, nowMonth, nowDay = getYMD(nowTs)

    return lastYear ~= nowYear or lastMonth ~= nowMonth or lastDay ~= nowDay
end

function GameUtils.isCrossWeek(lastLoginTs)
    if not lastLoginTs then return true end

    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    local lastMonday = getMondayTimestamp(lastLoginTs)
    local nowMonday = getMondayTimestamp(nowTs)

    return lastMonday ~= nowMonday
end

-- 设置玩家金币
function GameUtils.SetPlayerCoin(coin)
    Log:PrintLog("[GameUtils.SetPlayerCoin] coin" .. coin)
    local playerId = Character:GetLocalPlayerId()
    Archive:SetPlayerData(playerId, Archive.TYPE.Number, "Coin", coin)
end

-- 获取玩家金币
function GameUtils.GetPlayerCoin()
    local playerId = Character:GetLocalPlayerId()
    local Coin = Archive:GetPlayerData(playerId, Archive.TYPE.Number, "Coin")
    if Coin then
        return Coin
    else
        return 0
    end
end

-- 判断金币是否足够打排位赛
function GameUtils.CanEnterRankBattle()
    local score = GameUtils.GetPlayerRankScore()
    local curLevel = GameUtils.GetRankLevelByScore(score)
    if curLevel then
        local coin = _GAME.GameUtils.GetPlayerCoin()
        if coin >= curLevel.cost then
            return true
        end
    end
    UI:ShowMessageTip("金币不足，无法进入排位赛")
    return false
end

-- 判断能否进入黄金赛
function GameUtils.CanEnterGoldBattle()
    local score = GameUtils.GetPlayerRankScore()
    local curLevel = GameUtils.GetRankLevelByScore(score)
    if curLevel and curLevel.id >= 7 then -- 进入黄金段位
        local count = GameUtils.GetGoldBattleCount()
        if count > 0 then
            return true
        else
            UI:ShowMessageTip("当日黄金赛次数已经用完")
        end
    else
        UI:ShowMessageTip("达到黄金段位，才能进入黄金赛")
    end
    return false
end

-- 设置黄金赛次数
function GameUtils.SetGoldBattleCount(count)
    Log:PrintLog("[GameUtils.SetGoldBattleCount] count" .. count)
    local playerId = Character:GetLocalPlayerId()
    Archive:SetPlayerData(playerId, Archive.TYPE.Number, "GoldBattleCount", count)

    UI:SetText({106557}, string.format("剩余次数：%d/3", count))
end

-- 获取黄金赛次数
function GameUtils.GetGoldBattleCount()
    local playerId = Character:GetLocalPlayerId()
    local count = Archive:GetPlayerData(playerId, Archive.TYPE.Number, "GoldBattleCount")
    if count then
        return count
    else
        return 0
    end
end

return GameUtils