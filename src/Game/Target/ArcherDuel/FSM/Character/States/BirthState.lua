--出生状态
local BirthState = UGCS.RTTI.Class("BirthState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function BirthState:OnSwitch(Args)
    --默认允许切换成功
    return true
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function BirthState:OnEnter(Previous, Args)
    --TODO：出生后在此做一些事情
    --处理完之后模拟进入Idle状态
    UGCS.Framework.Executor.Delay(0.5, function()
        --匹配进入状态
        self.FSM:SwitchState(UGCS.Target.ArcherDuel.Character.States.IdleState)
    end)
end

--- 重置状态
---@param Args 参数列表
function BirthState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function BirthState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function BirthState:OnExit(Next)

end

return BirthState