--矛
local Spear = UGCS.RTTI.Class("Spear", UGCS.Target.ArcherDuel.World.Actor.Weapon)

function Spear:OnCreate(Context)
    Spear.super.OnCreate(self, Context)
end

function Spear:OnDestroy()
    Spear.super.OnDestroy(self)
    --在此销毁武器
end

--- 投掷物创建
---@param ProjectileInstance 投掷物实例
function Spear:OnSpawnProjectile(ProjectileInstance)
    --ProjectileInstance.EffectID2 = self:PlayEffectOnElement(ProjectileInstance.ElementID, "Projectile2")
end

--- 投掷物销毁
---@param ProjectileInstance 投掷物实例
function Spear:OnDestroyProjectile(ProjectileInstance)
    --Particle:StopParticle(ProjectileInstance.EffectID2)
end

return Spear