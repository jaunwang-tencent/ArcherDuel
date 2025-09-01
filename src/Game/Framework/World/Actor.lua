--角色
local Actor = UGCS.RTTI.Class("Actor")

--- 构造
---@param Context 上下文
function Actor:OnCreate(Context)
    --分配坐标系
    self.Transform = {
        --位置
        Location = Context and Context.Location or Engine.Vector(0, 0, 0),
        --旋转
        Rotation = Context and Context.Rotation or Engine.Rotator(0, 0, 0),
        --缩放
        Scale = Context and Context.Scale or Engine.Vector(1, 1, 1),
    }

    --分配物理量
    self.Physics = {
        --线速率【单位：米每秒】
        LinearVelocity = 0,
        --角速率【单位：角度每秒】
        AngularVelocity = 0,
        --质量【单位：千克】
        Mass = 1,
    }

    --宿主场景
    self.OwnerScene = Context and Context.OwnerScene
end

--销毁
function Actor:OnDestroy()
    self.Transform = nil
    self.Physics = nil
end

function Actor:SetLocation(Location)
    self.Transform.Location = Location
end

function Actor:GetLocation()
    return self.Transform.Location
end

function Actor:SetRotation(Rotation)
    self.Transform.Rotation = Rotation
end

function Actor:GetRotation()
    return self.Transform.Rotation
end

function Actor:SetScale(Scale)
    self.Transform.Scale = Scale
end

function Actor:GetScale()
    return self.Transform.Scale
end

function Actor:SetMass(Mass)
    self.Physics.Mass = Mass
end

--- 刷新
---@param DeltaTime 时间戳
function Actor:Update(DeltaTime)
    
end

return Actor