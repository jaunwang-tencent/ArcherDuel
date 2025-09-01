--待机状态
local IdleState = UGCS.RTTI.Class("IdleState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function IdleState:OnSwitch(Args)
    local DeathState = UGCS.Target.ArcherDuel.Character.States.DeathState
    if self.FSM:IsState(DeathState) then
        --死亡状态不允许直接待机
        return false
    end
    return true
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function IdleState:OnEnter(Previous, Args)
    self.OwnerPlayer = self.FSM.OwnerPlayer

    --死亡状态不允许直接待机
    self.OwnerPlayer:AimAdjust()
end

--- 重置状态
---@param Args 参数列表
function IdleState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function IdleState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function IdleState:OnExit(Next)
    self.OwnerPlayer = nil
end

return IdleState