--OOP实现
local OnSetMetatableIndex
OnSetMetatableIndex = function(t, index)
    local mt = getmetatable(t)
    if not mt then mt = {} end
    if not mt.__index then
        mt.__index = index
        setmetatable(t, mt)
    elseif mt.__index ~= index then
        OnSetMetatableIndex(mt, index)
    end
end

local SetMetatableIndex = OnSetMetatableIndex

local GetInheritanceStack = function(cls)
    local stack = {cls}
    local pc = 1
    while pc > 0 do
        local from = #stack - pc + 1
        pc = 0
        for i = from, #stack do
            local super = stack[i]
            if super.__supers then
                for _, grandSuper in ipairs(super.__supers) do
                    pc = pc + 1
                    table.insert(stack, grandSuper)
                end
            end
        end
    end
    return stack
end

local function Class(className, ...)
    local cls = {__cname = className, __type = "LuaClass"}

    local supers = {...}
    for _, super in ipairs(supers) do
        local superType = type(super)
        if superType == "function" then
            cls.__create = super
        elseif superType == "table" then
            if super[".isclass"] then
                cls.__create = function()
                    return super:Create()
                end
            else
                cls.__supers = cls.__supers or {}
                cls.__supers[#cls.__supers + 1] = super
                if not cls.super then
                    cls.super = super
                end
            end
        end
    end

    cls.__index = cls
    if not cls.__supers or #cls.__supers == 1 then
        setmetatable(cls, {__index = cls.super})
    else
        setmetatable(cls, {__index = function(_, key)
            local temp_supers = cls.__supers
            for i = 1, #temp_supers do
                local super = temp_supers[i]
                if super[key] then
                    return super[key]
                end
            end
        end})
    end

    --构造函数
    if not cls.OnCreate then
        cls.OnCreate = function() end
    end
    --析构函数
    if not cls.OnDestroy then
        cls.OnDestroy = function() end
    end

    cls.Create = function(...)
        local instance
        if cls.__create then
            instance = cls.__create(...)
        else
            instance = {}
        end
        SetMetatableIndex(instance, cls)
        instance.class = cls
        instance.className = className

        if cls[".superctor"] and cls.__supers then
            local stack = GetInheritanceStack(cls)
            for i = #stack, 1, -1 do
                local super = stack[i]
                super.OnCreate(instance, ...)
            end
        else
            instance:OnCreate(...)
        end

        --插入一个销毁函数
        instance.Destroy = function(self)
            if cls[".superdctr"] and cls.__supers then
                local stack = GetInheritanceStack(cls)
                for i = #stack, 1, -1 do
                    local super = stack[i]
                    super.OnDestroy(self)
                end
            else
                self:OnDestroy()
            end
            --无效实例
            instance.IsValid = false
        end

        --有效实例
        instance.IsValid = true
        return instance
    end

    --注册到类型表中
    UGCS.RTTI.TypeMap[className] = cls
    return cls
end

return Class