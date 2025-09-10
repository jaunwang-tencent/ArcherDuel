
local TaskPool = {}

local TaskClass = require("Game.Framework.Task.Task").Task

local TaskEvents = require("Game.Framework.Task.TaskEvents")

TaskPool.taskcfg = {
    { id = 1, taskName = "使用弓箭赢得2场比赛", taskDes = "使用弓箭赢得2场比赛",  condition = {type = TaskEvents.BattleWin , param = {2} },  rewards = {exp = 5} },
    { id = 2, taskName = "战斗爆头2次", taskDes = "战斗爆头2次",  condition =  {type = TaskEvents.HeadShot , param = {2} },  rewards = {exp = 10} },
    { id = 3, taskName = "登录游戏1次", taskDes = "登录游戏1次",  condition =  {type = TaskEvents.LoginGame , param = {} },  rewards = {exp = 15} }
}

function TaskPool.BuildTask()

    local  TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    for k, v in pairs(TaskPool.taskcfg) do

        local condition = TaskManagerInstance:createCondition(v.condition.type, {
            requiredAmount = v.condition.param[1]
        })

        local Quest = TaskClass:new(v.id, v.taskName, v.taskDes, {condition}, v.rewards)
        Quest:addOnCompleteCallback(function()
            -- Log:PrintLog("恭喜你完成了任务!")
        end)
        TaskManagerInstance:addTask(Quest)
        TaskManagerInstance:acceptTask(Quest.id)
    end
    TaskManagerInstance:LoadSavedTaskData()

    return TaskManagerInstance
end

return TaskPool