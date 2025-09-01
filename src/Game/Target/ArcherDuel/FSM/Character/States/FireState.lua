--箭矢发射
local FireState = UGCS.RTTI.Class("FireState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function FireState:OnSwitch(Args)
    local AimState = UGCS.Target.ArcherDuel.Character.States.AimState
    if self.FSM:IsState(AimState) and Args and Args.PitchDegree then
        --只有瞄准【Aim】后才能发射
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function FireState:OnEnter(Previous, Args)
    --表演设置
    self.OwnerPlayer = self.FSM.OwnerPlayer
    self.Weapon = self.OwnerPlayer.Weapon

    --进入状态时使用武器发射投掷物
    self.OwnerPlayer:FireProjectile(Args.PitchDegree)

    --动作表演
    self.OwnerPlayer:PerformFire()
end

--- 重置状态
---@param Args 参数列表
function FireState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function FireState:OnUpdate(DeltaTime)
    --刷新武器
    self.Weapon:Update(DeltaTime)
end

--- 退出
---@param Next 下一状态
function FireState:OnExit(Next)
    self.OwnerPlayer = nil
    self.Weapon = nil
end

return FireState