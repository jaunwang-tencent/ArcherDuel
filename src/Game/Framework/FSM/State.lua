--状态
local State = UGCS.RTTI.Class("State")

--- 构造函数
---@param FSM 宿主有限状态机
function State:OnCreate(FSM)
    self.FSM = FSM
end

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function State:Switch(Args)
    local StateTypeName = UGCS.RTTI.TypeName(self)
    if self:OnSwitch(Args) then
        Log:PrintLog("TXSwitchState(Success)", StateTypeName)
        return true
    else
        Log:PrintWarning("TXSwitchState(Failed)", StateTypeName)
        return false
    end
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function State:Enter(Previous, Args)
    self:OnEnter(Previous, Args)
end

--- 重置状态
---@param Args 参数列表
function State:Reset(Args)
    self:OnReset(Args)
end

--- 更新状态
---@param DeltaTime 时间戳
function State:Update(DeltaTime)
    self:OnUpdate(DeltaTime)
end

--- 退出
---@param Next 下一状态
function State:Exit(Next)
    self:OnExit(Next)
end

--- 暂停
function State:Suspend()
    self:OnSuspend()
end

--- 恢复
function State:Resume()
    self:OnResume()
end

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function State:OnSwitch(Args)
    --默认允许切换成功
    return true
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function State:OnEnter(Previous, Args)

end

--- 重置状态
---@param Args 参数列表
function State:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function State:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function State:OnExit(Next)

end

--- 暂停
function State:OnSuspend()

end

--- 恢复
function State:OnResume()

end

return State