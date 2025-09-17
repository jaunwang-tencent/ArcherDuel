--斧
local Axe = UGCS.RTTI.Class("Axe", UGCS.Target.ArcherDuel.World.Actor.Weapon)

function Axe:OnCreate(Context)
    Axe.super.OnCreate(self, Context)
end

function Axe:OnDestroy()
    Axe.super.OnDestroy(self)
    --在此销毁武器

    --清除累加旋转量
    self.AccumulationRotation = nil
end

--- 武器外观加载完毕
---@param ElementID 外观元件
function Axe:OnLoadAppearanceCompleted(ElementID)
    --斧头进行偏移【这里在场景中偏移武器手持点即可】
    Element:SetPosition(ElementID, Engine.Vector(0, -50, 30), Element.COORDINATE.Part)
end

--- 调整武器方向
---@param Velocity 当前武器速度
function Axe:AdjustForward(Velocity)
    --投掷物实例
    local ProjectileInstanceID = self.ProjectileInstance.ElementID
    local WeaponResource = self:GetResource()
    local ProjectileData = WeaponResource and WeaponResource.Projectile
    local RotationalSpeed = ProjectileData and ProjectileData.RotationalSpeed or 0
    if self.AccumulationRotation then
        self.AccumulationRotation = self.AccumulationRotation + Engine.Rotator(0, RotationalSpeed, 0)
        Element:SetRotation(ProjectileInstanceID, self.AccumulationRotation, Element.COORDINATE.World)
    else
        Element:SetForward(ProjectileInstanceID, Velocity)
        self.AccumulationRotation = Element:GetRotation(ProjectileInstanceID)
    end
end

function Axe:SetProjectilePosition(ProjectileInstanceID, CurrentPosition)
    --设置位置【只有在管理器中的实例才允许更新位置】
    if self.Projectiles[ProjectileInstanceID] then
        -- 斧子抬高一点，不然容易表现上穿过人体
        Element:SetPosition(ProjectileInstanceID, CurrentPosition+Engine.Vector(0, 0, 10), Element.COORDINATE.World)
    end
end

return Axe