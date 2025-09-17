local TaskEvents = require("Game.Framework.Task.TaskEvents")

-- 条件基类
local Condition = {}
Condition.__index = Condition
function Condition:new(type, params)
    local obj = {
        type = type,
        target = params.target,
        requiredAmount = params.requiredAmount or 1,
        wday = params.wday or 0,
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

-- 普通进度任务
local GeneralProgressCondition = setmetatable({}, {__index = Condition})
GeneralProgressCondition.__index = GeneralProgressCondition

function GeneralProgressCondition:new(taskEvents, params)
    local obj = Condition.new(self, taskEvents, params)
    return obj
end

function GeneralProgressCondition:check(params)
    if params.event == self.type then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end

-- 击杀条件
local KillCondition = setmetatable({}, {__index = Condition})
KillCondition.__index = KillCondition

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
CollectCondition.__index = CollectCondition

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
TalkCondition.__index = TalkCondition

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
CompositeCondition.__index = CompositeCondition

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
BattleCondition.__index = BattleCondition

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
BattleWinCondition.__index = BattleWinCondition


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

-- 使用弓箭胜利
local BattleWinUseBowCondition = setmetatable({}, {__index = Condition})
BattleWinUseBowCondition.__index = BattleWinUseBowCondition

function BattleWinUseBowCondition:new(params)
    local obj = Condition.new(self, TaskEvents.BattleWinUseBow, params)
    return obj
end

function BattleWinUseBowCondition:check(params)
    if params.event == TaskEvents.BattleWinUseBow then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end


local LoginGameCondition = setmetatable({}, {__index = Condition})
LoginGameCondition.__index = LoginGameCondition

function LoginGameCondition:new(params)
    local obj = Condition.new(self, TaskEvents.LoginGame, params)
    return obj
end

function LoginGameCondition:check(params)
    if params.event == TaskEvents.LoginGame then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
        return true, self.currentAmount
    end
    return false, self.currentAmount
end


local HeadShotCondition = setmetatable({}, {__index = Condition})
HeadShotCondition.__index = HeadShotCondition

function HeadShotCondition:new(params)
    local obj = Condition.new(self, TaskEvents.HeadShot, params)
    return obj
end

function HeadShotCondition:check(params)
    if params.event == TaskEvents.HeadShot then
        self.currentAmount = self.currentAmount + 1
        self.completed = self.currentAmount >= self.requiredAmount
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

Task.TaskType = {
    -- 每日任务
    Daily = "Daily",
    -- 每周任务
    Weekly = "Weekly",
}

function Task:new(id, type, name, description, conditions, rewards)
    local obj = {
        id = id,
        type = type,
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
    local day = _GAME.GameUtils.GetWeekDay()
    for _, condition in ipairs(self.conditions) do
        if self.type == Task.TaskType.Weekly then
            if condition.wday and condition.wday <= day then
                if not condition:check(params) or not condition:isCompleted() then
                    allCompleted = false
                end
            else
                allCompleted = false
            end
        else
            if not condition:check(params) or not condition:isCompleted() then
                allCompleted = false
            end
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


function Task:getProgressNumer()
    local total = 0
    local completed = 0
    for _, condition in ipairs(self.conditions) do
        local current, required = condition:getProgress()
        total = total + (required or 1)
        completed = completed + (current or 0)
    end

    if self.state == Task.State.COMPLETED then
        return 1.0, completed, total
    elseif self.state == Task.State.NOT_ACCEPTED then
        return 0.0, completed, total
    end
 
    return total > 0 and (completed / total) or 0, completed, total
end


-- 任务管理器类
local TaskManager = {}
TaskManager.__index = TaskManager
TaskManager.Instance = nil
TaskManager.Task = Task
TaskManager.Condition = Condition
function TaskManager:GetInsatnce()
    if TaskManager.Instance then
        return TaskManager.Instance
    end
    local obj = {
        tasks = {},
        activeTasks = {},
        conditionFactories = {},
    }

    obj.conditionFactories[TaskEvents.LoginGame] = function(params) return LoginGameCondition:new(params) end
    obj.conditionFactories[TaskEvents.BattleWinUseBow] = function(params) return GeneralProgressCondition:new(TaskEvents.BattleWinUseBow, params) end
    obj.conditionFactories[TaskEvents.BattleWinUseAxe] = function(params) return GeneralProgressCondition:new(TaskEvents.BattleWinUseAxe, params) end
    obj.conditionFactories[TaskEvents.BattleWinUseSpear] = function(params) return GeneralProgressCondition:new(TaskEvents.BattleWinUseSpear, params) end
    obj.conditionFactories[TaskEvents.BattleWin] = function(params) return GeneralProgressCondition:new(TaskEvents.BattleWin, params) end
    obj.conditionFactories[TaskEvents.BattleComplete] = function(params) return GeneralProgressCondition:new(TaskEvents.BattleComplete, params) end
    obj.conditionFactories[TaskEvents.HeadShot] = function(params) return GeneralProgressCondition:new(TaskEvents.HeadShot, params) end
    obj.conditionFactories[TaskEvents.UpdateAxe] = function(params) return GeneralProgressCondition:new(TaskEvents.UpdateAxe, params) end
    obj.conditionFactories[TaskEvents.UpdateSpear] = function(params) return GeneralProgressCondition:new(TaskEvents.UpdateSpear, params) end
    obj.conditionFactories[TaskEvents.UpdateBow] = function(params) return GeneralProgressCondition:new(TaskEvents.UpdateBow, params) end
    obj.conditionFactories[TaskEvents.UpdateBottoms] = function(params) return GeneralProgressCondition:new(TaskEvents.UpdateBottoms, params) end
    obj.conditionFactories[TaskEvents.UpdateTop] = function(params) return GeneralProgressCondition:new(TaskEvents.UpdateTop, params) end
    obj.conditionFactories[TaskEvents.UpdateCharacter] = function(params) return GeneralProgressCondition:new(TaskEvents.UpdateCharacter, params) end
    obj.conditionFactories[TaskEvents.WinBloodline60] = function(params) return GeneralProgressCondition:new(TaskEvents.WinBloodline60, params) end
    obj.conditionFactories[TaskEvents.WinBloodline80] = function(params) return GeneralProgressCondition:new(TaskEvents.WinBloodline80, params) end
    obj.conditionFactories[TaskEvents.WinBloodline100] = function(params) return GeneralProgressCondition:new(TaskEvents.WinBloodline100, params) end
    obj.conditionFactories[TaskEvents.AdCoin] = function(params) return GeneralProgressCondition:new(TaskEvents.AdCoin, params) end
    obj.conditionFactories[TaskEvents.AdDiamond] = function(params) return GeneralProgressCondition:new(TaskEvents.AdDiamond, params) end

    setmetatable(obj, self)
    TaskManager.Instance = obj
    Log:PrintDebug("System:RegisterGameEvent")
    System:RegisterGameEvent(_GAME.Events.ExecuteTask, self.OnExecuteTask, self)

    local _time = MiscService:DateYMDHMSToTime(MiscService:GetServerTimeToTime())

    obj.TaskIintTime = _time
    local day = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Day) --2023
    obj.TaskIintTimeDay = day

    return obj
end

function TaskManager:OnExecuteTask(EventName, params)
    Log:PrintDebug("eventType:", EventName)
    TaskManager.Instance:handleEvent(EventName, params)
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
    if task and task.id then
        self.tasks[task.id] = task
    end
end

function TaskManager:delTask(task)
    if task and task.id then
        self.tasks[task.id] = nil
        if self.activeTasks and self.activeTasks[task.id] then
            self.activeTasks[task.id] = nil
        end
    end
end

function TaskManager:getTask(taskId)
    return self.tasks[taskId]
end

function TaskManager:getAllTaskByDaily()
    local daily = {}
    if self.tasks then
        for _, task in pairs(self.tasks) do
            if task.type == Task.TaskType.Daily then
                daily[task.id] = task
            end
        end
    end
    return daily
end

function TaskManager:getAllTaskByWeekly()
    local weekly = {}
    if self.tasks then
        for _, task in pairs(self.tasks) do
            if task.type == Task.TaskType.Weekly then
                weekly[task.id] = task
            end
        end
    end
    return weekly
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

    if not task.state == Task.State.COMPLETED then
        return false
    end
    
    task.state = Task.State.FINISH
    self:SaveTaskData()
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
    self:SaveTaskData()
end

function TaskManager:getActiveTasks()
    local tasks = {}
    for taskId, _ in pairs(self.activeTasks) do
        table.insert(tasks, self.tasks[taskId])
    end
    return tasks
end

function TaskManager:LoadSavedTaskData()
    if not Archive:HasPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.String, "TaskDataTable") then
        return
    end

    local str = Archive:GetPlayerData(self.PlayerID, Archive.TYPE.String, "TaskDataTable")
    Log:PrintLog("LoadTaskData",str)
    local savedData = MiscService:JsonStr2Table(str)
    if savedData == nil then
       return
    end
    local TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    for _, v in pairs (savedData) do
        local task = TaskManagerInstance:getTask(v.id)
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
    local TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    local tasks = TaskManagerInstance:getActiveTasks()
    for _, v in pairs (tasks) do
        local data = {}
        data.id = v.id
        data.state = v.state
        data.conditions = {}
        for _, condition in ipairs(v.conditions) do
            local cond = {}
            cond.currentAmount = condition.currentAmount
            cond.completed = condition.completed
            table.insert(data.conditions, cond)
        end
        table.insert(saveData, data)
    end
    local str = MiscService:Table2JsonStr(saveData)
    Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.String, "TaskDataTable", str)
end

function TaskManager:Init()
    local TaskPool = require("Game.Framework.Task.TaskPool")
    local TaskManagerInstance = TaskPool.BuildTask()
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