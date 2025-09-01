--游戏工具，在这里实现一些通用性算法，以供游戏业务侧使用
local GameUtils = {}

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

--- 通过样条曲线配置参数和位移重新计算命中区域
---@param SplineConfig 命中曲线配置参数
---@param Displacement 两者之间位移
function GameUtils.ComputeHitRange(SplineConfig, Displacement)
    --计算垂直偏差
    local OffsetZ = -Displacement.Z * 0.01
    --重新计算角度区间
    local LowerDegree = SplineConfig.LowerDegree + OffsetZ * SplineConfig.K1
    local UpperDegree = SplineConfig.UpperDegree + OffsetZ * SplineConfig.K1
    local XY = math.sqrt(Displacement.X * Displacement.X + Displacement.Y * Displacement.Y) * 0.01
    --计算水平偏差
    local OffsetXY = XY - SplineConfig.L
    --先上移
    LowerDegree = LowerDegree + OffsetXY * SplineConfig.K2
    UpperDegree = UpperDegree + OffsetXY * SplineConfig.K2
    --再缩放
    local K = math.max(0.01, 1 - OffsetXY * SplineConfig.S)
    LowerDegree = LowerDegree * K
    UpperDegree = UpperDegree * K
    local Message = string.format("ComputeHitRange(LowerDegree=%f->%f, UpperDegree=%f->%f)", SplineConfig.LowerDegree, LowerDegree, SplineConfig.UpperDegree, UpperDegree)
    Log:PrintLog(Message)
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

return GameUtils