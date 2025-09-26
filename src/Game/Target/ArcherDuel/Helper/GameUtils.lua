--游戏工具，在这里实现一些通用性算法，以供游戏业务侧使用
local GameUtils = {}

--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
--排行榜配置
local RankInfoConfig = UGCS.Target.ArcherDuel.Config.RankInfoConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--宝箱配置
local OpenBoxConfig = UGCS.Target.ArcherDuel.Config.OpenBoxConfig

--- 根据水平距离和俯仰角算出L处的高度
---@param V 初速率
---@param G 重力加速度
---@param L 水平距离
---@param P 俯仰角
---@return 距离L处的高度
function GameUtils.ComputeHeight(V, G, L, P)
    local r = UMath:DegToRad(P)
    local t = L / (V * math.cos(r))
    local h = V * math.sin(r) * t - 0.5 * G * t * t
    return h
end

--- 根据水平距离和垂直高度算出俯仰角
---@param V 初速率
---@param G 重力加速度
---@param L 水平距离
---@param H 垂直高度
---@return P1 低拋俯仰角
---@return P2 高拋俯仰角
function GameUtils.ComputePitch(V, G, L, H)
    local k = L / V
    local a = 0.5 * G * k * k
    local b = -L
    local c = a + H
    local f = b * b - 4 * a * c
    local d = math.sqrt(math.abs(f))
    if f < 0 then
        local x2 = 0.5 * (-b + d) / a
        return UMath:RadToDeg(math.atan(x2))    --低拋轨迹
    else
        local x1 = 0.5 * (-b - d) / a
        return UMath:RadToDeg(math.atan(x1))    --高拋轨迹
    end
end

--- 根据水平距离和垂直高度以及俯仰角算出初速度速度
---@param P 俯仰角度
---@param G 重力加速度
---@param L 水平距离
---@param H 垂直高度
function GameUtils.ComputeVelocity(P, G, L, H)
    local T = math.tan(UMath:DegToRad(P))
    local D = L * T - H
    if D < 0 then
        D = -D
    elseif D == 0 then
        D = 1
    end
    local K = 0.5 * (T * T + 1) * G / D
    local V = math.sqrt(K) * L
    return V
end

--- 通过样条曲线配置参数和位移重新计算命中区域
---@param AimSetting 瞄准设置
---@param Displacement 两者之间位移
function GameUtils.ComputeHitRange(AimSetting, Displacement)
    local Coefficient = AimSetting.Coefficient
    --计算垂直偏差
    local OffsetZ = Displacement.Z * 0.01
    --重新计算角度区间
    local LowerDegree = AimSetting.LowerDegree + OffsetZ * Coefficient.K1
    local UpperDegree = AimSetting.UpperDegree + OffsetZ * Coefficient.K1
    local XY = math.sqrt(Displacement.X * Displacement.X + Displacement.Y * Displacement.Y) * 0.01
    --计算水平偏差
    local OffsetXY = XY - AimSetting.StandardDistance
    --先上移
    LowerDegree = LowerDegree + OffsetXY * Coefficient.K2
    UpperDegree = UpperDegree + OffsetXY * Coefficient.K2
    --再缩放
    local K = math.max(0.01, 1 - OffsetXY * Coefficient.S)
    LowerDegree = LowerDegree * K
    UpperDegree = UpperDegree * K
    return LowerDegree, UpperDegree
end

--- 递归访问子节点
---@param ElementID 元件ID
---@param ChildCall 子节点访问
function GameUtils.TraversalChildrenFromElement(ElementID, ChildCall)
    if ChildCall then
        --1、先访问自己
        if not ChildCall(ElementID) then
            --2、访问失败后再访问子节点
            local Children = Element:GetChildElementsFromElement(ElementID)
            for _, Child in pairs(Children) do
                GameUtils.TraversalChildrenFromElement(Child, ChildCall)
            end
        end
    end
end

--- 夹逼
---@param value 值
---@param min 最小值
---@param max 最大值
function GameUtils.Clamp(value, min, max)
    if value < min then
        value = min
    elseif value > max then
        value = max
    end
    return value
end

---@private 计算贝塞尔曲线点
local function CalculateQuadraticBezierPoint(p0, p1, p2, t)
    local oneMinusT = 1 - t
    local oneMinusTSquared = oneMinusT * oneMinusT
    local tSquared = t * t
    local l1 = p0 * oneMinusTSquared
    local l2 = p1 * 2 * oneMinusT * t
    local l3 = p2 * tSquared
    return l1 + l2 + l3
end

---@private 计算三个点之间的二次贝塞尔曲线
local function GenerateBezierCurve(p0, p1, p2, numPoints, extraCount)
    local curvePoints = {}
    extraCount = extraCount or 0
    for i = 0, numPoints + extraCount do
        local t = i / numPoints
        table.insert(curvePoints, CalculateQuadraticBezierPoint(p0, p1, p2, t))
    end
    return curvePoints
end

---@public 计算三个点的两段贝塞尔曲线，曲线必经过中间点
---@param p0, p1, p2 Vector
---@param segment 分段
---@param curvature float(0, 1) 控制曲线曲率
---@return list Vector
function GameUtils.GenerateCurve(p0, p1, p2, segment, curvature, extraRate)
    if not curvature then
        curvature = 0.4
    end
    extraRate = extraRate or 0
    curvature = GameUtils.Clamp(curvature, 0, 1)

    local numPoints1 = math.floor(UMath:GetVectorLength(p1- p0) / segment + 1)
    local numPoints2 = math.floor(UMath:GetVectorLength(p1- p2) / segment + 1)
  
    local Tangent = UMath:GetNormalize(p2 - p0)
    local ControlPointDistance = Tangent * UMath:GetVectorLength(p1- p0) * curvature
    local q0 = p1 - ControlPointDistance
    local q1 = p1 + ControlPointDistance
    local curve1 = GenerateBezierCurve(p0, q0, p1, numPoints1)
    local curve2 = GenerateBezierCurve(p1, q1, p2, numPoints2, numPoints2 * extraRate)
    for i = 1, #curve2 do
        table.insert(curve1, curve2[i])
    end
    return curve1
end

--- 刷新图标
---@param IconUI 图标资源
---@param EquipmentData 装备数据
function GameUtils.SetImageWithAsset(IconUI, AssetName, AssetIndex)
    local ElementId = System:GetScriptParentID()
    local IconIdArray = CustomProperty:GetCustomPropertyArray(ElementId, AssetName, CustomProperty.PROPERTY_TYPE.Image)
    local IconId = IconIdArray[AssetIndex]
    UI:SetImage({IconUI}, IconId, true)
end

--- 刷新图标
---@param IconUI 图标资源
---@param Index 图标索引
function GameUtils.SetImageWithEquipment(IconUI, Equipment)
    --装备配置
    if Equipment then
        local EquipmentData = EquipmentConfig[Equipment.ID]
        local AssetName = EquipmentData.AssetName or "weapon_icon"
        local AssetIndex = EquipmentData.AssetIndex or EquipmentData.ID
        GameUtils.SetImageWithAsset(IconUI, AssetName, AssetIndex)
    end
end

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
    DataCenter.SetNumber("Player_BattlePoints_Num", score)
end

-- 保存玩家排位积分
function GameUtils.GetPlayerRankScore()
    --加积分
    local Player_BattlePoints_Num = DataCenter.GetNumber("Player_BattlePoints_Num", true)
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
        --加积分
        local Reward_Num = DataCenter.GetNumber(cfg.archive, true)
        Reward_Num = (Reward_Num or 0) + addRewardCount
        DataCenter.SetNumber(cfg.archive, Reward_Num)

        System:FireGameEvent(_GAME.Events.RefreshData, "GeneralResource")
    end
end

-- 获取玩家拥有的物品数量
function GameUtils.GetPlayerReward(rewardId)
    local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[rewardId]
    if cfg and cfg.archive then
        local Reward_Num = DataCenter.GetNumber(cfg.archive, true)
        Reward_Num = (Reward_Num or 0)
        return Reward_Num
    end
    return 0
end

function GameUtils.GetEquipmentMap()
    if GameUtils.EquipmentMap then
        return GameUtils.EquipmentMap
    end

    GameUtils.EquipmentMap = {}
    for i, v in pairs(EquipmentConfig) do
        local Grade = v.Attributes.Grade
        GameUtils.EquipmentMap[Grade] = GameUtils.EquipmentMap[Grade] or {}
        table.insert(GameUtils.EquipmentMap[Grade], i)
    end
    return GameUtils.EquipmentMap
end

-- 开宝箱获取奖励物品
function GameUtils.OpenBoxReward(boxId)
    local BoxConfig
    if boxId == 200002 then -- 高级宝箱
        BoxConfig = OpenBoxConfig.SilverBox
    elseif boxId == 200003 then -- 极品宝箱
        BoxConfig = OpenBoxConfig.GoldBox
    else
        return
    end

    System:FireGameEvent(_GAME.Events.ExecuteTask, UGCS.Target.ArcherDuel.Task.TaskEvents.OpenBox) -- 打开宝箱

    local Weight = 0
    for i, v in ipairs(BoxConfig) do
        Weight = Weight + v.Weight
    end

    math.randomseed(TimerManager:GetClock())
    local function getReward()
        local random = math.random(1, Weight)
        local _Weight = 0
        for i, v in ipairs(BoxConfig) do
            _Weight = _Weight + v.Weight
            if random <= _Weight then
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

----------------------------------时间相关----------------------------------
local function getYMD(timestamp)
    local year = MiscService:TimeStampToTime(timestamp, MiscService.ETimeUnit.Year)
    local month = MiscService:TimeStampToTime(timestamp, MiscService.ETimeUnit.Month)
    local day = MiscService:TimeStampToTime(timestamp, MiscService.ETimeUnit.Day)
    return year, month, day
end

local function getDate()
    local year = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Year)
    local month= MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Month)
    local day  = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Day)
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
    local year, month, day = getDate()
    local weekDay = dayOfWeek(year, month, day)
    return weekDay
end

--- 获取当前时刻
function GameUtils.GetNowTimestamp()
    local ServerTimeToTime = MiscService:GetServerTimeToTime()
    local NowTimestamp = MiscService:DateYMDHMSToTime(ServerTimeToTime)
    return NowTimestamp
end

--- 获取当日零点时刻
function GameUtils.GetTodayZeroTimestamp()
    -- 当前年月日
    local year, month, day = getDate()

    -- 当日0点时间戳
    local ZeroTimestamp = MiscService:DateYMDHMSToTime(string.format("%04d-%02d-%02d 00:00:00", year, month, day))
    return ZeroTimestamp
end

--- 获取本周一零点时刻
function GameUtils.GetMondayZeroTimestamp()
    local NowTimestamp = GameUtils.GetNowTimestamp()
    local MondayTimestamp = getMondayTimestamp(NowTimestamp)
    return MondayTimestamp
end

-- 跨天判断
function GameUtils.IsCrossDay(lastLoginTs)
    if not lastLoginTs then return true end

    local NowTimestamp = GameUtils.GetNowTimestamp()
    local lastYear, lastMonth, lastDay = getYMD(lastLoginTs)
    local nowYear, nowMonth, nowDay = getYMD(NowTimestamp)

    return lastYear ~= nowYear or lastMonth ~= nowMonth or lastDay ~= nowDay
end

--- 跨周判断
---@param lastLoginTs any
function GameUtils.IsCrossWeek(lastLoginTs)
    if not lastLoginTs then return true end

    local NowTimestamp = GameUtils.GetNowTimestamp()
    local lastMonday = getMondayTimestamp(lastLoginTs)
    local nowMonday = getMondayTimestamp(NowTimestamp)

    return lastMonday ~= nowMonday
end

--- 获取格式化时间差
---@param DeltaTime 时间戳【分辨率：秒级】
function GameUtils.GetFormatTime(DeltaTime)
    if DeltaTime and DeltaTime > 0 then
        -- 格式化当天剩余时间时分秒
        local LeftDays = math.floor(DeltaTime / (24 * 3600))
        local LeftHour = math.floor(DeltaTime / 3600)
        local FormatTime
        if LeftDays > 0 then
            FormatTime = string.format("%d天 %02d时", LeftDays, LeftHour)
        else
            local LeftMin = math.floor((DeltaTime % 3600) / 60)
            if LeftHour > 0 then
                FormatTime = string.format("%02d时%02d分", LeftHour, LeftMin)
            else
                local LeftSec = math.floor(DeltaTime % 60)
                if LeftMin > 0 then
                    FormatTime = string.format("%02d分%02d秒", LeftMin, LeftSec)
                else
                    FormatTime = string.format("%02d秒", LeftSec)
                end
            end
        end
        return FormatTime
    end
end

--- 获取格式化时间差
---@param DeltaTime 时间戳【分辨率：豪秒级】
function GameUtils.GetFormatTimeWithMilliseconds(DeltaTime)
    if DeltaTime and DeltaTime > 0 then
        local Seconds = math.floor(DeltaTime / 1000)
        -- 格式化当天剩余时间时分秒
        local LeftDays = math.floor(Seconds / (24 * 3600))
        local LeftHour = math.floor(Seconds / 3600)
        local LeftMin = math.floor((Seconds % 3600) / 60)
        local LeftSec = math.floor(Seconds % 60)
        local Milliseconds = DeltaTime % 1000
        local FormatTime
        if LeftDays > 0 then
            FormatTime = string.format("%d-%02d:%02d:%02d.%03d", LeftDays, LeftHour, LeftMin, LeftSec, Milliseconds)
        else
            if LeftHour > 0 then
                FormatTime = string.format("%02d:%02d:%02d.%03d", LeftHour, LeftMin, LeftSec, Milliseconds)
            else
                if LeftMin > 0 then
                    FormatTime = string.format("%02d:%02d.%03d", LeftMin, LeftSec, Milliseconds)
                else
                    if LeftSec > 0 then
                        FormatTime = string.format("%02d.%03d", LeftSec, Milliseconds)
                    else
                        FormatTime = string.format("%023d", Milliseconds)
                    end
                end
            end
        end
        return FormatTime
    end
end
----------------------------------时间相关----------------------------------

----------------------------------概率相关----------------------------------
--- 随机配置
---@param WeightConfig 带权重的配置
function GameUtils.RandomConfig(WeightConfig)
    local Weight = 0
    local ProbabilityTable = {}
    local ConfigIndex = 0
    if WeightConfig then
        for _, Config in ipairs(WeightConfig) do
            Weight = Weight + Config.Weight
            ConfigIndex = ConfigIndex + 1
            ProbabilityTable[ConfigIndex] = {
                Weight = Weight,
                Config = Config
            }
        end
    end
    --摇骰子
    local RandomValue = math.random(1, Weight)
    local TargetConfig
    local MinValue = 0
    local MaxValue
    for _, ProbabilityItem in ipairs(ProbabilityTable) do
        MaxValue = ProbabilityItem.Weight
        if RandomValue >= MinValue and RandomValue <= MaxValue then
            TargetConfig = ProbabilityItem.Config
            break
        end
        MinValue = MaxValue
    end
    return TargetConfig
end

--- 随机宝箱
---@param BoxID 宝箱ID
---@param Count 装备数量
function GameUtils.RandomBox(BoxID, Count)
    local BoxConfig
    if BoxID == 200002 then -- 高级宝箱
        BoxConfig = OpenBoxConfig.SilverBox
    elseif BoxID == 200003 then -- 极品宝箱
        BoxConfig = OpenBoxConfig.GoldBox
    else
        return
    end
    --周
    local WeeklyTimeStamp = GameUtils.GetMondayZeroTimestamp()
    math.randomseed(WeeklyTimeStamp)
    local WeeklyIndex = math.random(1, 60)

    --装备
    local Seed = GameUtils.GetNowTimestamp()
    math.randomseed(Seed)
    local EquipmentIds = {}
    Count = Count or 1
    for _ = 1, Count do
        local TargetConfig= GameUtils.RandomConfig(BoxConfig)
        if TargetConfig then
            local BoxEquipmentIds
            --存在指定装备
            if TargetConfig.EquipIds then
                WeeklyIndex = (WeeklyIndex % #TargetConfig.EquipIds) + 1
                --找到指定周的装备ID
                BoxEquipmentIds = TargetConfig.EquipIds[WeeklyIndex]
            else
                --找到全部指定品质的装备
                local GroupByGrade = DataCenter.Get("GroupByGrade")
                local Equipments = GroupByGrade[TargetConfig.Grade]
                BoxEquipmentIds = {}
                for _, Equipment in pairs(Equipments) do
                    table.insert(BoxEquipmentIds, Equipment.ID)
                end
            end

            --在指定装备配置中随机出三个出来
            local TotalCount = #BoxEquipmentIds
            local RandomIndex = math.random(1, TotalCount)
            table.insert(EquipmentIds, BoxEquipmentIds[RandomIndex])
        end
    end
    return EquipmentIds
end
----------------------------------概率相关----------------------------------

----------------------------------广告相关----------------------------------
local AdFinishCallBack
--注册广告事件
function GameUtils.RegisterAdFinishEvent()
    --注册广告结束事件
    System:RegisterEvent(Events.ON_PLAYER_WATCH_IAA_AD_FINISH, function(mark, userId)
        local LocalPlayerId = Character:GetLocalPlayerId()
        if LocalPlayerId == userId then
            local CallBack = AdFinishCallBack[mark]
            if CallBack then
                --回调处理
                CallBack()
            end
        end
    end)
end

--- 观看广告
---@param AdTag 广告标签
---@param OnFinish 观看结束
function GameUtils.SeeAd(AdTag, OnFinish)
    if AdTag then
        --广告结束回调<AdTag, CallBack>
        if not AdFinishCallBack then
            AdFinishCallBack = {}
        end
        local CallBack = AdFinishCallBack[AdTag]
        if not CallBack then
            CallBack = function()
                if OnFinish then
                    --使用自定义结束事件
                    OnFinish()
                end
            end
            --加入回调
            AdFinishCallBack[AdTag] = CallBack
        end
        --广告观看
        IAA:LetPlayerWatchAds(AdTag)
        --PC端开发，可以打开这句话来模拟广告结束事件，已完成
        CallBack()
    end
end

--注销广告事件
function GameUtils.UnregisterAdFinishEvent()
    --注销广告完成事件
    System:UnregisterEvent(Events.ON_PLAYER_WATCH_IAA_AD_FINISH)
    AdFinishCallBack = nil
end
----------------------------------广告相关----------------------------------

-- 设置玩家金币
function GameUtils.SetPlayerCoin(coin)
    Log:PrintLog("[GameUtils.SetPlayerCoin] coin" .. coin)
    DataCenter.SetNumber("Coin", coin)
end

-- 获取玩家金币
function GameUtils.GetPlayerCoin()
    local Coin = DataCenter.GetNumber("Coin", true)
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
        local coin = GameUtils.GetPlayerCoin()
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
    DataCenter.SetNumber("GoldBattleCount", count)
end

-- 获取黄金赛次数
function GameUtils.GetGoldBattleCount()
    local count = DataCenter.GetNumber("GoldBattleCount", true)
    if count then
        return count
    else
        return 0
    end
end

function GameUtils.CanEnterDiamondRankBattle()
    if GameUtils.GetPlayerReward(100003) > 0 then
        return true
    end
    UI:ShowMessageTip("入场券不足，无法进入钻石联赛")
    return false
end

function GameUtils.ShowGainView(Goods, closeCallback)
    --UI配置
    local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
    local GainView = UIConfig.GainView
    UI:SetVisible({GainView.ID}, true)

    if Goods.Coin then
        --获得金钱，显示金钱
        GameUtils.AddPlayerReward(100001, Goods.Coin)
        GameUtils.SetImageWithAsset(GainView.GoodSlot.Icon, "Currency", 4)
        UI:SetText({UIConfig.StoreView.PurchasePopup.Text}, tostring(Goods.Coin))
        UI:SetVisible({UIConfig.StoreView.PurchasePopup.Text}, true)
    elseif Goods.Diamond then
        --获得砖石，显示砖石
        GameUtils.AddPlayerReward(100002, Goods.Diamond)
        GameUtils.SetImageWithAsset(GainView.GoodSlot.Icon, "Currency", 6)
        UI:SetText({UIConfig.StoreView.PurchasePopup.Text}, tostring(Goods.Diamond))
        UI:SetVisible({UIConfig.StoreView.PurchasePopup.Text}, true)
    elseif Goods.DiamondScore then
        local Rank_DiamondScore_Num = DataCenter.GetNumber("Rank_DiamondScore_Num", true) or 0
        if Rank_DiamondScore_Num then
            Rank_DiamondScore_Num = Rank_DiamondScore_Num + Goods.DiamondScore
            DataCenter.SetNumber("Rank_DiamondScore_Num", Rank_DiamondScore_Num)
        else
            DataCenter.SetNumber("Rank_DiamondScore_Num", Goods.DiamondScore)
        end
        GameUtils.SetImageWithAsset(GainView.GoodSlot.Icon, "Currency", 7)
        UI:SetText({UIConfig.StoreView.PurchasePopup.Text}, tostring(Goods.DiamondScore))
        UI:SetVisible({UIConfig.StoreView.PurchasePopup.Text}, true)
    end

    --设置物品图标
    UI:RegisterClicked(GainView.CloseButton, function()
        UI:SetVisible({GainView.ID}, false)
        UI:SetVisible({UIConfig.StoreView.PurchasePopup.Text}, false)
        if closeCallback then
            closeCallback()
        end
        --注销按钮事件
        UI:UnRegisterClicked(GainView.CloseButton)
    end)
end

function GameUtils.UnwindDegrees(A)
    while A > 180 do
        A = A - 360
    end
    while A < -180 do
        A = A + 360
    end
    return A
end

return GameUtils