--时间轴，时统，记录时刻，测量时间等
local TimeAxis = UGCS.RTTI.Class("TimeAxis")

---创建动时间轴
function TimeAxis:OnCreate()
    --记录启动时刻
    self.StartTimestamp = TimerManager:GetTimeSeconds()

    --相对时刻
    self.RelationTimestamp = 0
end

--- 销毁时间轴
function TimeAxis:OnDestroy()
    self.StartTimestamp = nil
    self.RelationTimestamp = nil
end

--- 刷新时间轴
---@return 本次刷新的时间戳
function TimeAxis:Update()
    if self.StartTimestamp then
        local CurrentTimestamp = TimerManager:GetTimeSeconds()
        local RelationTimestamp = CurrentTimestamp - self.StartTimestamp
        local DeltaTime = RelationTimestamp - self.RelationTimestamp
        self.RelationTimestamp = RelationTimestamp
        return DeltaTime
    end
end

--- 查看时间轴
---@return 相对时刻，距离时间轴启动时刻【单位：秒】
function TimeAxis:Watch()
    if self.StartTimestamp then
        return self.RelationTimestamp
    else
        return 0
    end
end

return TimeAxis