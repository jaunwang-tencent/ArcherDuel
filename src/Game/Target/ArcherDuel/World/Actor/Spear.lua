--矛
local Spear = UGCS.RTTI.Class("Spear", UGCS.Target.ArcherDuel.World.Actor.Weapon)

function Spear:OnCreate(Context)
    Spear.super.OnCreate(self, Context)
end

function Spear:OnDestroy()
    Spear.super.OnDestroy(self)
    --在此销毁武器
end

return Spear