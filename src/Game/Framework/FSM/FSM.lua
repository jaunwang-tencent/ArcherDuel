--有限状态机
local FSM = UGCS.RTTI.Class("FSM")

--- 创建
---@param Context 上下文
function FSM:OnCreate(Context)
    --<状态类型名称, 状态实例>
    self.StateMap = {}
    self.CurrentState = nil
end

--- 销毁
function FSM:OnDestroy()
    if self.CurrentState then
        self.CurrentState:OnExit()
    end
    self.CurrentState = nil
    self.StateMap = nil
end

--- 挂起
function FSM:Suspend()
    if self.CurrentState then
        self.CurrentState:Suspend()
    end
end

--- 恢复
function FSM:Resume()
    if self.CurrentState then
        self.CurrentState:Resume()
    end
end

--- 刷新状态机
---@param DeltaTime 时间戳
function FSM:Update(DeltaTime)
    if self.CurrentState then
        self.CurrentState:Update(DeltaTime)
    end
end

--- 获取状态
---@param StateType 状态类型
---@param IsForce 是否强制获取
---@return 状态实例
function FSM:GetState(StateType, IsForce)
    if self.StateMap then
        local StateTypeName = UGCS.RTTI.TypeName(StateType)
        local TargetState = self.StateMap[StateTypeName]
        if not TargetState and IsForce then
            TargetState = UGCS.RTTI.CreateInstanceByType(StateType, self)
            self.StateMap[StateTypeName] = TargetState
        end
        return TargetState
    end
end

--- 判定当前状态
---@param StateType 状态类型
---@return 是否为目标状态
function FSM:IsState(StateType)
    if self.CurrentState and StateType then
        return UGCS.RTTI.IsA(self.CurrentState, StateType)
    end
    return false
end

--- 切换状态
---@param StateType 状态类型
---@param StateArgs 状态参数列表
---@return 是否切换成功
function FSM:SwitchState(StateType, StateArgs)
    --后期改为非强制获取，由状态机预分配
    local NextState = self:GetState(StateType, true)
    if self.CurrentState == NextState and self.CurrentState then
        --状态重置
        self.CurrentState:Reset(StateArgs)
    else
        --只有在下一状态进入成功时才退出当状态
        if NextState and NextState:Switch(StateArgs) then
            if self.CurrentState then
                --退出当前状态
                self.CurrentState:Exit(NextState)
            end
            --进入下一状态
            NextState:Enter(self.CurrentState, StateArgs)
            --切换到下一状态
            self.CurrentState = NextState
        else
            return false
        end
    end
    return true
end

--- 刷新状态机时
---@param DeltaTime 时间戳
function FSM:OnUpdate(DeltaTime)

end

return FSM