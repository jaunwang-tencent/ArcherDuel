--弓
local Bow = UGCS.RTTI.Class("Bow", UGCS.Target.ArcherDuel.World.Actor.Weapon)
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils

function Bow:OnCreate(Context)
    Bow.super.OnCreate(self, Context)

end

function Bow:OnDestroy()
    Bow.super.OnDestroy(self)

    --在此销毁武器
    --[[
    UGCS.Framework.Updator.Free(self.UpdatorID)
    --[[]]
    if self.UpdatorID then
        TimerManager:RemoveTimer(self.UpdatorID)
    end
    --]]
    self.UpdatorID = nil
    self:RefreshBowString()

    if self.String then
        Particle:StopParticle(self.String.First)
        Particle:StopParticle(self.String.Second)
    end
end

--- 武器外观加载完毕
---@param ElementID 外观元件
function Bow:OnLoadAppearanceCompleted(ElementID)
    --在此找到指定骨骼，创建弓弦
    local IncrementMask = (1 << 18) - 1
    local WeaponResource = self:GetResource()
    local HeldItemConfig = WeaponResource and WeaponResource.HeldItem
    self.Dummys = {}
    GameUtils.TraversalChildrenFromElement(ElementID, function(ChildElement)
        local Increment = ChildElement & IncrementMask
        if HeldItemConfig.Root == Increment then
            self.Dummys.Root = ChildElement
        end
        if HeldItemConfig.Up == Increment then
            self.Dummys.Up = ChildElement
        end
        if HeldItemConfig.Down == Increment then
            self.Dummys.Down = ChildElement
        end
        if self.Dummys.Root and self.Dummys.Up and self.Dummys.Down then
            return true
        else
            return false
        end
    end)
    --分配定时刷新Buff
    self:Perform()
end

--- 武器表演【目前只有瞄准阶段】
---@param DurationTime 持续时间，0表示一直持续
function Bow:Perform(DurationTime)
    DurationTime = DurationTime or 0
    --[[
    UGCS.Framework.Updator.Free(self.UpdatorID)
    --分配定时刷新Buff
    self.UpdatorID = UGCS.Framework.Updator.Alloc(DurationTime, function()
        self:RefreshBowString(0)
    end, function(Progress)
        --刷新弓弦
        self:RefreshBowString(Progress)
    end, function()
        --拉满之后继续刷新
        --self:Perform()
    end)
    --]]
    if self.UpdatorID then
        TimerManager:RemoveTimer(self.UpdatorID)
    end
    if DurationTime > 0 then
        local startTime = TimerManager:GetTimeSeconds()
        self.UpdatorID = TimerManager:AddLoopFrame(1, function()
            local Progress = 1
            local rt = DurationTime - (TimerManager:GetTimeSeconds() - startTime)
            if rt > 0 then
                Progress = 1- rt/DurationTime
            end
            self:RefreshBowString(Progress)
        end)
    else
        self.UpdatorID = TimerManager:AddLoopFrame(1, function()
            self:RefreshBowString(0)
        end)
    end
    --[[]]
end

--- 刷新弓弦
---@param Progress 拉弦比例
function Bow:RefreshBowString(Progress)
    local WeaponResource = self:GetResource()
    if WeaponResource then
        if Progress and self.Dummys then
            local Root = Element:GetPosition(self.Dummys.Root)
            local P1 = Element:GetPosition(self.Dummys.Up)
            local P3 = Element:GetPosition(self.Dummys.Down)
            local P2 = (P1 + P3) * 0.5
            local Offset = UMath:GetNormalize(P2 - Root)
            P2 = P2 + Offset * Progress * 80
            if self.String then
                Particle:UpdateChainParticle(self.String.First, P1, P2)
                Particle:UpdateChainParticle(self.String.Second, P2, P3)

                if Progress > 0 then
                    -- 将箭搭在弓上
                    if not self.bBindArrow then
                        local instanceId = WeaponResource.Projectile.Root -- 将场景的中的箭借用
                        Element:SetForward(instanceId,Element:GetForward(self.UID))
                        Element:BindingToElement(instanceId,self.UID)
                        Element:SetPosition(instanceId, Engine.Vector(200, 30, -50), Element.COORDINATE.Part)
                        Element:SetRotation(instanceId, Engine.Rotator(90, 0, 0), Element.COORDINATE.Part)
                        self.bBindArrow = true
                    end
                else
                    if self.bBindArrow then
                        local instanceId = WeaponResource.Projectile.Root -- 将场景的中的箭还回去
                        Element:SetPosition(instanceId,Engine.Vector(-100000, -100000, -100000), Element.COORDINATE.World)
                        Element:UnBinding(instanceId)
                        self.bBindArrow = false
                    end
                end
            else
                local HeldItemConfig = WeaponResource.HeldItem
                self.String = {
                    First = Particle:CreateChainParticle(HeldItemConfig.Spring, P1, P2),
                    Second = Particle:CreateChainParticle(HeldItemConfig.Spring, P2, P3)
                }
            end
        else
            if self.String then
                Particle:StopParticle(self.String.First)
                Particle:StopParticle(self.String.Second)
                self.String = nil

                if self.bBindArrow then
                    local instanceId = WeaponResource.Projectile.Root -- 将场景的中的箭还回去
                    Element:SetPosition(instanceId,Engine.Vector(-100000, -100000, -100000),Element.COORDINATE.World)
                    Element:UnBinding(instanceId)
                    self.bBindArrow = false
                end
            end
        end
    end
end

return Bow