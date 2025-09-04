--角色受击
local HitState = UGCS.RTTI.Class("HitState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function HitState:OnSwitch(Args)
    if Args and Args.Attacker and Args.AttackImpulse and Args.BodyType then
        --需要有命中信息才能进入
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function HitState:OnEnter(Previous, Args)
    self.OwnerPlayer = self.FSM.OwnerPlayer

    --绑定到目标角色
    local Attacker, AttackImpulse, BodyType = Args.Attacker, Args.AttackImpulse, Args.BodyType

    --处理伤害
    self.OwnerPlayer:HandleDamage(Attacker, BodyType)

    --开始表演
    self.OwnerPlayer:PerformHitStart(AttackImpulse, BodyType)
end

--- 重置状态
---@param Args 参数列表
function HitState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function HitState:OnUpdate(DeltaTime)
    --命中后停留到底


end

--- 退出
---@param Next 下一状态
function HitState:OnExit(Next)
    self.OwnerPlayer = nil
end

return HitState