local DiamondRankManager = {}

local MatchConfig = require("Match.MatchConfig")

local dailyScoreHours = {6, 18} -- 积分时间点

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

-- 计算星期几，周一=1，周日=7，2000-01-01是周六，偏移5调整
local function getWeekDay(ts)
    local days = getDaysSinceEpoch(ts)
    return ((days + 5) % 7) + 1
end

-- 根据时间戳获取对应周的周一零点时间戳
local function getMondayZeroTs(ts)
    local zeroTs = dateStrToZeroTime(timeToDateStr(ts))
    local wday = getWeekDay(ts)
    local oneDay = 24 * 3600
    return zeroTs - (wday - 1) * oneDay
end

-- 计算积分累计起点
local function getAccumStartTimestamp(last_update_ts, cur_ts)
    local lastMonday = getMondayZeroTs(last_update_ts)
    local curMonday = getMondayZeroTs(cur_ts)
    if lastMonday < curMonday then
        -- 起点取较大者，防止积分倒退
        if last_update_ts > curMonday then
            return last_update_ts
        else
            return curMonday
        end
    else
        return last_update_ts
    end
end

-- 获取某天的积分时间点列表
local function getDayScoreTimestamps(dayStr)
    local list = {}
    for _, h in ipairs(dailyScoreHours) do
        table.insert(list, MiscService:DateYMDHMSToTime(string.format("%s %02d:00:00", dayStr, h)))
    end
    return list
end

-- 获取所有需要累计积分的时间点
local function getPendingScoreTimepoints(start_ts, cur_ts)
    local points = {}
    local startZeroTs = dateStrToZeroTime(timeToDateStr(start_ts))
    local curZeroTs = dateStrToZeroTime(timeToDateStr(cur_ts))
    local dayCount = math.floor((curZeroTs - startZeroTs) / (24*3600))
    for i = 0, dayCount do
        local dayTs = startZeroTs + i*24*3600
        local dayStr = timeToDateStr(dayTs)
        for _, tsPoint in ipairs(getDayScoreTimestamps(dayStr)) do
            if tsPoint > start_ts and tsPoint <= cur_ts then
                table.insert(points, tsPoint)
            end
        end
    end
    return points
end

-- 权重分布示例
local results = {
    {name = "胜利", weight = 30, score = 16},
    {name = "失败", weight = 50, score = 8},
    {name = "放弃", weight = 20, score = 0},
}
local totalWeight = 0
for _, r in ipairs(results) do
    totalWeight = totalWeight + r.weight
end

local function randomResult()
    local rand = math.random(totalWeight)
    local accum = 0
    for _, r in ipairs(results) do
        accum = accum + r.weight
        if rand <= accum then return r end
    end
end

-- 模拟积分累积
local function accumulateScore(pending_points)
    local add = 0
    for _, _ in ipairs(pending_points) do
        local r = randomResult()
        add = add + r.score
    end
    return add
end

local function isCrossWeek(ts1, ts2)
    return getMondayZeroTs(ts1) ~= getMondayZeroTs(ts2)
end

local function sample_unique(n, k)
    assert(k <= n, "k must be <= n")
    local t = {}
    for i = 1, n do t[i] = i end
    -- 部分 Fisher-Yates：只打乱前 k 个位置
    for i = 1, k do
        local j = math.random(i, n)
        t[i], t[j] = t[j], t[i]
    end
    local res = {}
    for i = 1, k do res[i] = t[i] end
    return res
end

DiamondRankManager.last_update_ts = 0
DiamondRankManager.PlayerNum = 50

--构建新的排行榜
function DiamondRankManager.BuildDiamondRank()
    
    local DiamondRankData = {}
    local headIcons = CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "avatar", CustomProperty.PROPERTY_TYPE.Image)
    -- 取 50 个不重复的整数
    local picks = sample_unique(#MatchConfig.PlayerName, DiamondRankManager.PlayerNum)
    for i = 1, DiamondRankManager.PlayerNum, 1 do
        local player = 
        {
            id = i, 
            name = MatchConfig.PlayerName[picks[i]], -- 名字
            headIcon = headIcons[math.random(1, #headIcons)], -- 头像
            DiamondScore = 0
        }
        table.insert(DiamondRankData, player)
    end

    return DiamondRankData
end

function DiamondRankManager.GetDiamondRank(PlayerID)
    local DiamondRank_Table
    if Archive:HasPlayerData(PlayerID, Archive.TYPE.String, "DiamondRank_Table") then
        local DiamondRank_Table_Str = Archive:GetPlayerData(PlayerID, Archive.TYPE.String, "DiamondRank_Table")
        DiamondRank_Table = MiscService:JsonStr2Table(DiamondRank_Table_Str)
    else
        DiamondRank_Table = DiamondRankManager.BuildDiamondRank()
    end

    DiamondRankManager.last_update_ts = Archive:GetPlayerData(PlayerID, Archive.TYPE.Number, "DiamondRank_LastUpdate")
    if DiamondRankManager.last_update_ts <= 0 then
        DiamondRankManager.last_update_ts = epochZeroTs
    end

    return DiamondRank_Table
end

function DiamondRankManager.GetPlayerDataDiamondRank(PlayerID)
    math.randomseed(TimerManager:GetClock())
    local DiamondRankData = DiamondRankManager.GetDiamondRank(PlayerID)

    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    local last_update_ts = DiamondRankManager.last_update_ts

    Log:PrintDebug("上次更新时间:", MiscService:TimeStampToDateYMDHMS(last_update_ts))
    Log:PrintDebug("当前时间:", nowStr)

    -- 计算积分起点
    local start_ts = getAccumStartTimestamp(last_update_ts, nowTs)
    Log:PrintDebug("积分累计起点:", MiscService:TimeStampToDateYMDHMS(start_ts))

    -- 获取本次待累计积分时间点
    local pending_points = getPendingScoreTimepoints(start_ts, nowTs)
    Log:PrintDebug("本次待累计积分时间点数:", #pending_points)
    if #pending_points == 0 then
        Log:PrintDebug("无新增积分点，结束")
        return DiamondRankData
    end

    if isCrossWeek(last_update_ts, nowTs) then
        DiamondRankData = DiamondRankManager.BuildDiamondRank()
        Archive:SetPlayerData(PlayerID, Archive.TYPE.Number, "Rank_DiamondScore_Num", 0)
    end

    for _, player in ipairs(DiamondRankData) do
        player.DiamondScore = accumulateScore(pending_points)
    end

    DiamondRankManager.DiamondRankData = DiamondRankData
    DiamondRankManager.last_update_ts = nowTs

    table.sort(DiamondRankData, function(a,b) return a.DiamondScore > b.DiamondScore end)

    local DiamondRank_Table_Str = MiscService:Table2JsonStr(DiamondRankData)
    Archive:SetPlayerData(PlayerID, Archive.TYPE.String, "DiamondRank_Table", DiamondRank_Table_Str)
    Archive:SetPlayerData(PlayerID, Archive.TYPE.Number, "DiamondRank_LastUpdate", nowTs)

    return DiamondRankData
end

function DiamondRankManager.GetLastWeekDiamondRank(PlayerID)
    local DiamondRank_Table
    if Archive:HasPlayerData(PlayerID, Archive.TYPE.String, "DiamondRank_Table") then
        local DiamondRank_Table_Str = Archive:GetPlayerData(PlayerID, Archive.TYPE.String, "DiamondRank_Table")
        DiamondRank_Table = MiscService:JsonStr2Table(DiamondRank_Table_Str)
    else
        DiamondRank_Table = DiamondRankManager.BuildDiamondRank()
    end

    DiamondRankManager.last_update_ts = Archive:GetPlayerData(PlayerID, Archive.TYPE.Number, "DiamondRank_LastUpdate")
    if DiamondRankManager.last_update_ts <= 0 then
        DiamondRankManager.last_update_ts = epochZeroTs
    end

    return DiamondRank_Table
end

function DiamondRankManager.GetLastWeekPlayerDataDiamondRank(PlayerID)
    math.randomseed(TimerManager:GetClock())
    local DiamondRankData = DiamondRankManager.GetLastWeekDiamondRank(PlayerID)

    local last_update_ts = DiamondRankManager.last_update_ts

    local lastwday = getWeekDay(last_update_ts)
    local daysToSunday = 7 - lastwday
    local dayZeroTimestamp = dateStrToZeroTime(timeToDateStr(last_update_ts))
    local sundayZeroTimestamp = dayZeroTimestamp + daysToSunday * 24 * 3600
    local weekEndTimestamp = sundayZeroTimestamp + 86399

    Log:PrintDebug("上次更新时间:", MiscService:TimeStampToDateYMDHMS(last_update_ts))
    Log:PrintDebug("上周最后一天时间:", MiscService:TimeStampToDateYMDHMS(weekEndTimestamp))

    -- 计算积分起点
    local start_ts = getAccumStartTimestamp(last_update_ts, weekEndTimestamp)
    Log:PrintDebug("上周积分累计起点:", MiscService:TimeStampToDateYMDHMS(start_ts))

    -- 获取本次待累计积分时间点
    local pending_points = getPendingScoreTimepoints(start_ts, weekEndTimestamp)
    Log:PrintDebug("上周待累计积分时间点数:", #pending_points)
    if #pending_points == 0 then
        Log:PrintDebug("上周无新增积分点，结束")
        return DiamondRankData
    end

    for _, player in ipairs(DiamondRankData) do
        player.DiamondScore = accumulateScore(pending_points)
    end

    table.sort(DiamondRankData, function(a,b) return a.DiamondScore > b.DiamondScore end)

    return DiamondRankData
end

-- 主示范
function DiamondRankManager.exampleRun(PlayerID)
    -- 初始化模拟排行榜
    local leaderboard = DiamondRankManager.GetPlayerDataDiamondRank(PlayerID)
    if leaderboard == nil then
        Log:PrintDebug("排行榜为空")
        return
    end

    Log:PrintDebug("积分榜排名(前10):")
    for i=1,10 do
        local p = leaderboard[i]
        Log:PrintDebug(string.format("%d. %s 头像:%s 积分:%d", i, p.name, p.headIcon, p.DiamondScore))
    end
end

return DiamondRankManager