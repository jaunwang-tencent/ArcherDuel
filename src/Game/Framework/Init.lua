--在这里做一些前期初始化工作
UGCS = UGCS or {}

--运行时类型【反射系统】
UGCS.RTTI = UGCS.RTTI or {}
--类型表
UGCS.RTTI.TypeMap = UGCS.RTTI.TypeMap or {}

--框架【持续迭代共性能力】
UGCS.Framework = UGCS.Framework or {}
--应用【一个目标小游戏】
UGCS.Target = UGCS.Target or {}

---类型转换
---@param object 对象实例
---@param class 对象类型
---@return 指定类型实例
function UGCS.RTTI.CastTo(object, class)
    if object and class then
        local target = object
        while target and target.__cname do
            if target.__cname == class.__cname then
                return object
            end
            target = target.super
        end
    end
    return nil
end

--- 类型判定
---@param object 对象实例
---@param class 对象类型
---@return 是否为指定类型
function UGCS.RTTI.IsA(object, class)
    if UGCS.RTTI.CastTo(object, class) == nil then
        return false
    else
        return true
    end
end

--- 获取实例类型
---@param object 对象实例
---@return 类型
function UGCS.RTTI.TypeOf(object)
    if object then
        return object.class
    end
end

--- 获取类型名称
---@param object 对象实例
---@return 类型名称
function UGCS.RTTI.TypeName(object)
    if object then
        return object.__cname
    end
end

--- 获取类型
---@param TypeName 类型名称
---@return 类型
function UGCS.RTTI.GetType(TypeName)
    return UGCS.RTTI.TypeMap[TypeName]
end

--- 通过类型名称创建类型实例
---@param TypeName 类型名称
---@return 类型实例
function UGCS.RTTI.CreateInstanceByTypeName(TypeName, ...)
    local Type = UGCS.RTTI.GetType(TypeName)
    if Type then
        return Type.Create(...)
    end
end

--- 通过类型创建类型实例
---@param TypeName 类型名称
---@return 类型实例
function UGCS.RTTI.CreateInstanceByType(Type, ...)
    if Type then
        return Type.Create(...)
    end
end

--类型
UGCS.RTTI.Class = require "Game.Framework.RTTI.Class"

--内核代码
UGCS.Framework.Application = require "Game.Framework.Application.Application"
UGCS.Framework.FSM = require "Game.Framework.FSM.FSM"
UGCS.Framework.State = require "Game.Framework.FSM.State"
UGCS.Framework.Executor = require "Game.Framework.Helper.Executor"
UGCS.Framework.Updator = require "Game.Framework.Helper.Updator"
UGCS.Framework.TimeAxis = require "Game.Framework.Time.TimeAxis"
UGCS.Framework.Actor = require "Game.Framework.World.Actor"
UGCS.Framework.Scene = require "Game.Framework.World.Scene"