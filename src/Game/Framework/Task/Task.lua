-- 条件基类
local Condition = {}
Condition.__index = Condition
function Condition:new(type, params)
    local obj = {
        type = type,
        target = params.target,
        requiredAmount = params.requiredAmount or 1,
        currentAmount = 0,
        completed = false
    }
    setmetatable(obj, self)
    return obj
end

function Condition:check(params)
    -- 基础条件默认返回false，应由子类实现
    return false, 0
end

function Condition:isCompleted()
    return self.completed
end

function Condition:getProgress()
    return self.currentAmount, self.requiredAmount
end

-- 击杀条件
local KillCondition = setmetatable({}, {__index = Condition})

function KillCondition:new(params)
    local obj = Condition.new(self, "KILL", params)
    return obj
end

function KillCondition:check(params)
    if params.event == "MONSTER_KILLED" and params.monsterId == self.target then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end

-- 收集条件
local CollectCondition = setmetatable({}, {__index = Condition})

function CollectCondition:new(params)
    local obj = Condition.new(self, "COLLECT", params)
    return obj
end

function CollectCondition:check(params)
    if params.items and params.items[self.target] then
        self.currentAmount = params.items[self.target]
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end

-- 对话条件
local TalkCondition = setmetatable({}, {__index = Condition})

function TalkCondition:new(params)
    local obj = Condition.new(self, "TALK", params)
    return obj
end

function TalkCondition:check(params)
    if params.event == "NPC_TALK" and params.npcId == self.target then
        self.currentAmount = 1
        self.completed = true
        return true, 1
    end
    return false, 0
end

-- 复合条件
local CompositeCondition = setmetatable({}, {__index = Condition})

function CompositeCondition:new(operator, subConditions)
    local obj = {
        isComposite = true,
        operator = operator,
        subConditions = subConditions,
        completed = false
    }
    setmetatable(obj, self)
    return obj
end

function CompositeCondition:check(params)
    if self.operator == "AND" then
        local allCompleted = true
        for _, condition in ipairs(self.subConditions) do
            if not condition:check(params) then
                allCompleted = false
            end
        end
        self.completed = allCompleted
        return allCompleted, allCompleted and 1 or 0
    elseif self.operator == "OR" then
        local anyCompleted = false
        for _, condition in ipairs(self.subConditions) do
            if condition:check(params) then
                anyCompleted = true
            end
        end
        self.completed = anyCompleted
        return anyCompleted, anyCompleted and 1 or 0
    elseif self.operator == "NOT" then
        local result = not self.subConditions[1]:check(params)
        self.completed = result
        return result, result and 1 or 0
    end
    return false, 0
end

-- 任务类
local Task = {}
Task.__index = Task

Task.State = {
    NOT_ACCEPTED = "NOT_ACCEPTED",
    IN_PROGRESS = "IN_PROGRESS",
    COMPLETED = "COMPLETED",
    FAILED = "FAILED"
}

function Task:new(id, name, description, conditions, rewards)
    local obj = {
        id = id,
        name = name,
        description = description,
        conditions = conditions,
        rewards = rewards,
        state = Task.State.NOT_ACCEPTED,
        onAcceptCallbacks = {},
        onCompleteCallbacks = {}
    }
    setmetatable(obj, self)
    return obj
end

function Task:accept()
    if self.state ~= Task.State.NOT_ACCEPTED then
        return false
    end

    self.state = Task.State.IN_PROGRESS

    -- 执行接受任务回调
    for _, callback in ipairs(self.onAcceptCallbacks) do
        callback()
    end

    return true
end

function Task:abandon()
    if self.state ~= Task.State.IN_PROGRESS then
        return false
    end

    self.state = Task.State.NOT_ACCEPTED
    -- 重置条件进度
    for _, condition in ipairs(self.conditions) do
        condition.currentAmount = 0
        condition.completed = false
    end

    return true
end

function Task:checkCompletion(params)
    if self.state ~= Task.State.IN_PROGRESS then
        return false
    end

    local allCompleted = true
    for _, condition in ipairs(self.conditions) do
        if not condition:check(params) then
            allCompleted = false
        end
    end

    if allCompleted then
        self.state = Task.State.COMPLETED
        -- 执行完成任务回调
        for _, callback in ipairs(self.onCompleteCallbacks) do
            callback()
        end
        return true
    end

    return false
end

function Task:addOnAcceptCallback(callback)
    table.insert(self.onAcceptCallbacks, callback)
end

function Task:addOnCompleteCallback(callback)
    table.insert(self.onCompleteCallbacks, callback)
end

function Task:getProgress()
    if self.state == Task.State.COMPLETED then
        return 1.0
    elseif self.state == Task.State.NOT_ACCEPTED then
        return 0.0
    end

    local total = 0
    local completed = 0

    for _, condition in ipairs(self.conditions) do
        local current, required = condition:getProgress()
        total = total + (required or 1)
        completed = completed + (current or 0)
    end

    return total > 0 and (completed / total) or 0
end

-- 任务管理器类
local TaskManager = {}
TaskManager.__index = TaskManager

function TaskManager:new()
    local obj = {
        tasks = {},
        activeTasks = {},
        conditionFactories = {
            KILL = function(params) return KillCondition:new(params) end,
            COLLECT = function(params) return CollectCondition:new(params) end,
            TALK = function(params) return TalkCondition:new(params) end
        }
    }
    setmetatable(obj, self)
    return obj
end

function TaskManager:registerConditionFactory(type, factory)
    self.conditionFactories[type] = factory
end

function TaskManager:createCondition(type, params)
    local factory = self.conditionFactories[type]
    if factory then
        return factory(params)
    end
    return nil
end

function TaskManager:createCompositeCondition(operator, subConditions)
    return CompositeCondition:new(operator, subConditions)
end

function TaskManager:addTask(task)
    self.tasks[task.id] = task
end

function TaskManager:getTask(taskId)
    return self.tasks[taskId]
end

function TaskManager:acceptTask(taskId)
    local task = self.tasks[taskId]
    if not task then return false end

    if task:accept() then
        self.activeTasks[taskId] = true
        return true
    end
    return false
end

function TaskManager:abandonTask(taskId)
    local task = self.tasks[taskId]
    if not task then return false end

    if task:abandon() then
        self.activeTasks[taskId] = nil
        return true
    end
    return false
end

function TaskManager:handleEvent(eventType, params)
    params = params or {}
    params.event = eventType

    for taskId, _ in pairs(self.activeTasks) do
        local task = self.tasks[taskId]
        if task then
            task:checkCompletion(params)
        end
    end
end

function TaskManager:getActiveTasks()
    local tasks = {}
    for taskId, _ in pairs(self.activeTasks) do
        table.insert(tasks, self.tasks[taskId])
    end
    return tasks
end

return TaskManager

--[[
-- 示例使用
local manager = TaskManager:new()

-- 创建条件
local killCondition = manager:createCondition("KILL", {
        target = "goblin",
        requiredAmount = 5
    })

local collectCondition = manager:createCondition("COLLECT", {
        target = "herb",
        requiredAmount = 3
    })

-- 创建复合条件
local mainCondition = manager:createCompositeCondition("AND", {
        killCondition,
        collectCondition
    })

-- 创建任务
local quest = Task:new(
    "quest1",
    "新手任务",
    "击杀5个哥布林并收集3个草药",
    {mainCondition},
    {gold = 100, exp = 200}
)

quest:addOnAcceptCallback(function()
    Log:PrintLog("你接受了新手任务!")
    end)

quest:addOnCompleteCallback(function()
    Log:PrintLog("恭喜你完成了新手任务!")
    end)

-- 添加任务到管理器
manager:addTask(quest)

-- 接受任务
manager:acceptTask("quest1")

-- 模拟游戏事件
Log:PrintLog("\n玩家击杀1个哥布林:")
manager:handleEvent("MONSTER_KILLED", {monsterId = "goblin"})

Log:PrintLog("\n玩家获得1个草药:")
manager:handleEvent("ITEM_OBTAINED", {items = {herb = 1}})

Log:PrintLog("\n玩家击杀4个哥布林:")
for i = 1, 4 do
    manager:handleEvent("MONSTER_KILLED", {monsterId = "goblin"})
end

Log:PrintLog("\n玩家再获得2个草药:")
for i = 1, 2 do
    manager:handleEvent("ITEM_OBTAINED", {items = {herb = 1}})
end

-- 检查任务进度
Log:PrintLog("\n任务进度:", quest:getProgress() * 100 .. "%")

]]