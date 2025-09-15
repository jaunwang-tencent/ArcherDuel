
local TaskPool = {}

local TaskClass = require("Game.Framework.Task.Task").Task

local TaskEvents = require("Game.Framework.Task.TaskEvents")

TaskPool.taskcfg = {
    { id = 1, takeType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得2场比赛", taskDes = "使用弓箭赢得2场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {2} },  rewards = {DailyExp = 5} },
    { id = 2, takeType = TaskClass.TaskType.Daily, taskName = "战斗爆头2次", taskDes = "战斗爆头2次", condition = {type = TaskEvents.HeadShot , param = {2} },  rewards = {DailyExp = 10} },
    { id = 3, takeType = TaskClass.TaskType.Daily, taskName = "登录游戏1次", taskDes = "登录游戏1次", condition = {type = TaskEvents.LoginGame , param = {1} },  rewards = {DailyExp = 15} },

    { id = 4, takeType = TaskClass.TaskType.Weekly, taskName = "周一登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 1},  rewards = {WeeklyExp = 1} },                           --周一任务
    { id = 5, takeType = TaskClass.TaskType.Weekly, taskName = "周一登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 1},  rewards = {WeeklyExp = 1} },                           --周一任务
    { id = 6, takeType = TaskClass.TaskType.Weekly, taskName = "周一登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 1},  rewards = {WeeklyExp = 1} },                           --周一任务

    { id = 7, takeType = TaskClass.TaskType.Weekly, taskName = "周二登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 2},  rewards = {WeeklyExp = 1} },                           --周二任务
    { id = 8, takeType = TaskClass.TaskType.Weekly, taskName = "周二登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 2},  rewards = {WeeklyExp = 1} },                           --周二任务
    { id = 9, takeType = TaskClass.TaskType.Weekly, taskName = "周二登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 2},  rewards = {WeeklyExp = 1} },                           --周二任务

    { id = 10, takeType = TaskClass.TaskType.Weekly, taskName = "周三登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 3},  rewards = {WeeklyExp = 1} },                          --周三任务
    { id = 11, takeType = TaskClass.TaskType.Weekly, taskName = "周三登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 3},  rewards = {WeeklyExp = 1} },                          --周三任务
    { id = 12, takeType = TaskClass.TaskType.Weekly, taskName = "周三登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 3},  rewards = {WeeklyExp = 1} },                          --周三任务

    { id = 13, takeType = TaskClass.TaskType.Weekly, taskName = "周四登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 4},  rewards = {WeeklyExp = 1} },                          --周四任务
    { id = 14, takeType = TaskClass.TaskType.Weekly, taskName = "周四登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 4},  rewards = {WeeklyExp = 1} },                          --周四任务
    { id = 15, takeType = TaskClass.TaskType.Weekly, taskName = "周四登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 4},  rewards = {WeeklyExp = 1} },                          --周四任务

    { id = 16, takeType = TaskClass.TaskType.Weekly, taskName = "周五登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 5},  rewards = {WeeklyExp = 1} },                          --周五任务
    { id = 17, takeType = TaskClass.TaskType.Weekly, taskName = "周五登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 5},  rewards = {WeeklyExp = 1} },                          --周五任务
    { id = 18, takeType = TaskClass.TaskType.Weekly, taskName = "周五登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 5},  rewards = {WeeklyExp = 1} },                          --周五任务

    { id = 19, takeType = TaskClass.TaskType.Weekly, taskName = "周六登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 6},  rewards = {WeeklyExp = 1} },                          --周六任务
    { id = 20, takeType = TaskClass.TaskType.Weekly, taskName = "周六登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 6},  rewards = {WeeklyExp = 1} },                          --周六任务
    { id = 21, takeType = TaskClass.TaskType.Weekly, taskName = "周六登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 6},  rewards = {WeeklyExp = 1} },                          --周六任务

    { id = 22, takeType = TaskClass.TaskType.Weekly, taskName = "周日登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 7},  rewards = {WeeklyExp = 1} },                          --周日任务
    { id = 23, takeType = TaskClass.TaskType.Weekly, taskName = "周日登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 7},  rewards = {WeeklyExp = 1} },                          --周日任务
    { id = 24, takeType = TaskClass.TaskType.Weekly, taskName = "周日登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 7},  rewards = {WeeklyExp = 1} },                          --周日任务
}

function TaskPool.BuildTask()

    local TaskManagerInstance = UGCS.Framework.TaskManager:GetInsatnce()
    for _, v in pairs(TaskPool.taskcfg) do
        local condition
        if v.takeType == TaskClass.TaskType.Weekly then
            condition = TaskManagerInstance:createCondition(v.condition.type, {
                requiredAmount = v.condition.param[1],
                wday = v.condition.wday
            })
        else
            condition = TaskManagerInstance:createCondition(v.condition.type, {
                requiredAmount = v.condition.param[1],
            })
        end

        local Quest = TaskClass:new(v.id, v.takeType, v.taskName, v.taskDes, {condition}, v.rewards)
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