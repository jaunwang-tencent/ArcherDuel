--场景
local Scene = UGCS.RTTI.Class("Scene")

--- 构造
---@param Context 上下文
function Scene:OnCreate(Context)
    --分配物理量
    self.Physics = {
        --重力加速度【单位：米每平方秒】
        Gravity = Context and Context.Gravity or 10,
        --摩擦系数【单位：1】
        FrictionFactor = Context and Context.FrictionFactor or 0.1,
    }

    --角色列表<ID>
    self.ActorMap = {}
    self.ActorGUID = 0
end

--- 销毁
function Scene:OnDestroy()
    self:Clean()
    self.ActorGUID = 0
end

--- 添加角色
---@param ActorType 角色类型
---@param Context 上下文
---@return 角色标识
function Scene:AddActor(ActorType, Context)
    self.ActorGUID = self.ActorGUID + 1
    Context = Context or {}
    Context.ID = self.ActorGUID
    Context.OwnerScene = self
    local ActorInstance = UGCS.RTTI.CreateInstanceByType(ActorType, Context)
    if ActorInstance then
        self.ActorMap[Context.ID] = ActorInstance
        return Context.ID
    end
end

--- 获取角色实例
---@param ActorID 数据标识
---@return 角色实例
function Scene:GetActor(ActorID)
    if ActorID then
        return self.ActorMap[ActorID]
    end
end

--- 移除角色实例
---@param ActorID 数据标识
---@return 是否成功删除
function Scene:RemoveActor(ActorID)
    if ActorID then
        local ActorInstance = self.ActorMap[ActorID]
        if ActorInstance then
            ActorInstance:Destroy()
            ActorInstance.OwnerScene = nil
            self.ActorMap[ActorID] = nil
            return true
        end
    end
    return false
end

--- 刷新
---@param DeltaTime 时间戳
function Scene:Update(DeltaTime)
    for _, ActorInstance in pairs(self.ActorMap) do
        ActorInstance:Update(DeltaTime)
    end
end

--- 清理
function Scene:Clean()
    for _, ActorInstance in pairs(self.ActorMap) do
        ActorInstance:Destroy()
    end
    self.ActorMap = {}
end

--- 获取重力加速度
---@return 重力加速度
function Scene:GetGravity()
    return self.Physics.Gravity
end

return Scene