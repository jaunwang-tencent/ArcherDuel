--角色受击
local HitState = UGCS.RTTI.Class("HitState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function HitState:OnSwitch(Args)
    if Args and Args.HitInfo then
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
    local CharacterUID = self.OwnerPlayer.UID
    local ProjectileID = Args.HitInfo.ProjectileID
    local HitBody = Args.HitInfo.HitBody

    --将投射物附加到角色身上
    Element:BindingToCharacterOrNPC(ProjectileID, CharacterUID, HitBody, Character.SOCKET_MODE.KeepWorld)

    --伤害计算
    local damage = Args.HitInfo.damage
    local equipData = self.OwnerPlayer:GetEquipData()
    if equipData then
        if HitBody == Character.SOCKET_NAME.Head then
            damage = damage * (1 + Args.HitInfo.head_damageRate or 0)
            damage = damage * (1 - equipData.head_protection or 0)
        else
            damage = damage * (1 + Args.HitInfo.body_damageRate or 0)
            damage = damage * (1 - equipData.body_protection or 0)
        end
    end

    self.OwnerPlayer:HitDamage(damage, HitBody)

    --开始表演
    self.OwnerPlayer:PerformHitStart(Args.HitInfo.HitImpulse, HitBody)
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