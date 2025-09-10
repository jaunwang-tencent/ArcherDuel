local TaskEvents = require("Game.Framework.Task.TaskEvents")
local TaskPool = require("Game.Framework.Task.TaskPool")

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


-- 参加战斗
local BattleCondition = setmetatable({}, {__index = Condition})

function BattleCondition:new(params)
    local obj = Condition.new(self, TaskEvents.Battle, params)
    return obj
end

function BattleCondition:check(params)
    if params.event == TaskEvents.Battle then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end


-- 参加战斗
local BattleWinCondition = setmetatable({}, {__index = Condition})

function BattleWinCondition:new(params)
    local obj = Condition.new(self, TaskEvents.BattleWin, params)
    return obj
end

function BattleWinCondition:check(params)
    if params.event == TaskEvents.BattleWin then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end


local LoginGameCondition = setmetatable({}, {__index = Condition})

function LoginGameCondition:new(params)
    local obj = Condition.new(self, "Login", params)
    return obj
end

function LoginGameCondition:check(params)
    if params.event == "Login" then
        self.currentAmount = self.currentAmount + 1
        self.completed = true
        return true, self.currentAmount
    end
    return false, self.currentAmount
end


local HeadShotCondition = setmetatable({}, {__index = Condition})

function HeadShotCondition:new(params)
    local obj = Condition.new(self, TaskEvents.HeadShot, params)
    return obj
end

function HeadShotCondition:check(params)
    if params.event == TaskEvents.HeadShot then
        self.currentAmount = self.currentAmount + 1
        self.completed = true
        return true, self.currentAmount
    end
    return false, self.currentAmount
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
    FINISH = "FINISH",
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
TaskManager.Instance = nil
TaskManager.Task = Task
TaskManager.Condition = Condition
function TaskManager:GetInsatnce()
    if  TaskManager.Instance then
        return TaskManager.Instance
    end
    local obj = {
        tasks = {},
        activeTasks = {},
        conditionFactories = {},
    }

    obj.conditionFactories[TaskEvents.Battle] = function(params) return BattleCondition:new(params) end
    obj.conditionFactories[TaskEvents.BattleWin] = function(params) return BattleWinCondition:new(params) end
    obj.conditionFactories[TaskEvents.LoginGame] = function(params) return LoginGameCondition:new(params) end

    setmetatable(obj, self)
    TaskManager.Instance = obj
    System:RegisterGameEvent(_GAME.Events.ExecuteTask, function(EventName, params)
        TaskManager.Instance:handleEvent(EventName, params)
    end)

    local _time = MiscService:DateYMDHMSToTime(MiscService:GetServerTimeToTime())

    obj.TaskIintTime = _time
    local day = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.day) --2023
    obj.TaskIintTimeDay = day

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

function TaskManager:getAllTask()
    return self.tasks
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

function TaskManager:finishTask(taskId)
    local task = self.tasks[taskId]
    if not task then return false end

    if not task.State == Task.State.COMPLETED then
        return false
    end
    
    task.State = Task.State.FINISH
    return true
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

    local needsave = false
    for taskId, _ in pairs(self.activeTasks) do
        local task = self.tasks[taskId]
        if task then
            if task:checkCompletion(params) then
                needsave = true
            end
        end
    end
    if needsave then
        self:SaveTaskData()
    end
end

function TaskManager:getActiveTasks()
    local tasks = {}
    for taskId, _ in pairs(self.activeTasks) do
        table.insert(tasks, self.tasks[taskId])
    end
    return tasks
end

function TaskManager:IsTaskTimeOut()
    local day = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.day)
    if day == self.TaskIintTimeDay then
        local _time = MiscService:DateYMDHMSToTime(MiscService:GetServerTimeToTime())
        return  _time - self.TaskIintTime > 24 * 60 * 60
    end
    return true
end

function TaskManager:LoadSavedTaskData()
    if not Archive:HasPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.String, "TaskDataTable") then
        return
    end
   
    local str = Archive:GetplayerData(self.PlayerID, Archive.TYpE.String, "TaskDataTable"
    Log:PrintLog("LoadData",str)
    
    local savedData = MiscService:JsonStr2Table(str)
    if savedData == nil then
       return 
    end
    local  TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    for i, v in pairs (savedData) do
        local task = TaskManagerInstance:getTask(i)
        if task then
            task.state = v.state
            local conditions = v.conditions
            for k, condition in ipairs(task.conditions) do
                if condition and conditions and conditions[k] then
                    condition.currentAmount = conditions[k].currentAmount
                    condition.completed = conditions[k].completed
                end
            end
        end
    end
end

function TaskManager:SaveTaskData()
    local saveData = {}
    local  TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    local tasks = TaskManagerInstance:getActiveTasks()
    for i, v in pairs (tasks) do
        local data = {}
        data.state = v.state 
        data.conditions = {}
        for k, condition in ipairs(v.conditions) do
            local cond = {}
            cond.currentAmount = cond.currentAmount
            cond.completed = cond.completed
            table.insert( data.conditions, cond)
        end
        table.insert( saveData.conditions, data)
    end
    local str = MiscService:Table2JsonStr(saveData)
    Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYpE.String, "TaskDataTable", str)

end

function TaskManager:Init()

    local  TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    if TaskManagerInstance:IsTaskTimeOut() then
        TaskManager.Instance = nil
        TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    end

    TaskManagerInstance = TaskPool.BuildTask()
    
    return TaskManagerInstance
end


return TaskManager

--[[
-- 示例使用
local manager = TaskManager:GetInsatnce()

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