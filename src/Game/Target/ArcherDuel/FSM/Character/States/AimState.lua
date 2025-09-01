--角色瞄准
local AimState = UGCS.RTTI.Class("AimState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function AimState:OnSwitch(Args)
    local IdleState = UGCS.Target.ArcherDuel.Character.States.IdleState
    if (self.FSM:IsState(IdleState) or self.FSM:IsState(AimState)) and Args and Args.PitchDegree then
        --只有站稳了或者在此瞄准【Idle】才能瞄准
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function AimState:OnEnter(Previous, Args)
    self.OwnerPlayer = self.FSM.OwnerPlayer

    --瞄准校正
    self.OwnerPlayer:AimAdjust(Args.PitchDegree)

    --表演瞄准
    self.OwnerPlayer:PerformAim()
end

--- 重置状态
---@param Args 参数列表
function AimState:OnReset(Args)
    --旋转身体
    self.OwnerPlayer:AimAdjust(Args.PitchDegree)
end

--- 更新状态
---@param DeltaTime 时间戳
function AimState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function AimState:OnExit(Next)
    self.OwnerPlayer = nil
end

return AimState