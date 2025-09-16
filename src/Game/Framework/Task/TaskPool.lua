
local TaskPool = {}

local TaskClass = require("Game.Framework.Task.Task").Task

local TaskEvents = require("Game.Framework.Task.TaskEvents")

TaskPool.taskcfg = {
    { id = 1, takeType = TaskClass.TaskType.Daily, taskName = "登录游戏", taskDes = "登录游戏", condition = {type = TaskEvents.LoginGame , param = {1} },  rewards = {DailyExp = 10} },

    { id = 2, takeType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得1场比赛", taskDes = "使用弓箭赢得1场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {1} },  rewards = {DailyExp = 15} },
    { id = 3, takeType = TaskClass.TaskType.Daily, taskName = "使用投矛赢得1场比赛", taskDes = "使用投矛赢得1场比赛", condition = {type = TaskEvents.BattleWinUseSpear , param = {1} },  rewards = {DailyExp = 15} },
    { id = 4, takeType = TaskClass.TaskType.Daily, taskName = "使用投斧赢得1场比赛", taskDes = "使用投斧赢得1场比赛", condition = {type = TaskEvents.BattleWinUseAxe , param = {1} },  rewards = {DailyExp = 15} },

    { id = 5, takeType = TaskClass.TaskType.Daily, taskName = "赢得3场比赛", taskDes = "赢得3场比赛", condition = {type = TaskEvents.BattleWin , param = {3} },  rewards = {DailyExp = 15} },
    { id = 6, takeType = TaskClass.TaskType.Daily, taskName = "完成5场比赛", taskDes = "完成5场比赛", condition = {type = TaskEvents.BattleComplete , param = {5} },  rewards = {DailyExp = 15} },

    { id = 7, takeType = TaskClass.TaskType.Daily, taskName = "赢得500金币", taskDes = "赢得500金币", condition = {type = TaskEvents.GainCoin , param = {500} },  rewards = {DailyExp = 20} },
    { id = 8, takeType = TaskClass.TaskType.Daily, taskName = "命中头部1次", taskDes = "命中头部1次", condition = {type = TaskEvents.HeadShot , param = {1} },  rewards = {DailyExp = 20} },

    { id = 9, takeType = TaskClass.TaskType.Daily, taskName = "领取免费的金币", taskDes = "领取免费的金币", condition = {type = TaskEvents.AdCoin , param = {1} },  rewards = {DailyExp = 20} },
    { id = 10, takeType = TaskClass.TaskType.Daily, taskName = "领取免费的钻石", taskDes = "领取免费的钻石", condition = {type = TaskEvents.AdDiamond , param = {1} },  rewards = {DailyExp = 20} },

    { id = 11, takeType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得3场比赛", taskDes = "使用弓箭赢得3场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {3} },  rewards = {DailyExp = 20} },
    { id = 12, takeType = TaskClass.TaskType.Daily, taskName = "使用投矛赢得3场比赛", taskDes = "使用投矛赢得3场比赛", condition = {type = TaskEvents.BattleWinUseSpear , param = {3} },  rewards = {DailyExp = 20} },
    { id = 13, takeType = TaskClass.TaskType.Daily, taskName = "使用投斧赢得3场比赛", taskDes = "使用投斧赢得3场比赛", condition = {type = TaskEvents.BattleWinUseAxe , param = {3} },  rewards = {DailyExp = 20} },

    { id = 14, takeType = TaskClass.TaskType.Daily, taskName = "赢得5场比赛", taskDes = "赢得5场比赛", condition = {type = TaskEvents.BattleWin , param = {5} },  rewards = {DailyExp = 20} },
    { id = 15, takeType = TaskClass.TaskType.Daily, taskName = "完成10场比赛", taskDes = "完成10场比赛", condition = {type = TaskEvents.BattleComplete , param = {10} },  rewards = {DailyExp = 20} },

    { id = 16, takeType = TaskClass.TaskType.Daily, taskName = "升级1次角色", taskDes = "升级1次角色", condition = {type = TaskEvents.UpdateCharacter , param = {1} },  rewards = {DailyExp = 20} },
    { id = 17, takeType = TaskClass.TaskType.Daily, taskName = "升级1次上装", taskDes = "升级1次上装", condition = {type = TaskEvents.UpdateTop , param = {1} },  rewards = {DailyExp = 20} },
    { id = 18, takeType = TaskClass.TaskType.Daily, taskName = "升级1次下装", taskDes = "升级1次下装", condition = {type = TaskEvents.UpdateBottoms , param = {1} },  rewards = {DailyExp = 20} },

    { id = 19, takeType = TaskClass.TaskType.Daily, taskName = "升级1次弓箭", taskDes = "升级1次弓箭", condition = {type = TaskEvents.UpdateBow , param = {1} },  rewards = {DailyExp = 20} },
    { id = 20, takeType = TaskClass.TaskType.Daily, taskName = "升级1次投矛", taskDes = "升级1次投矛", condition = {type = TaskEvents.UpdateSpear , param = {1} },  rewards = {DailyExp = 20} },
    { id = 21, takeType = TaskClass.TaskType.Daily, taskName = "升级1次投斧", taskDes = "升级1次投斧", condition = {type = TaskEvents.UpdateAxe , param = {1} },  rewards = {DailyExp = 20} },

    { id = 22, takeType = TaskClass.TaskType.Daily, taskName = "以60%或更高血量获胜", taskDes = "以60%或更高血量获胜", condition = {type = TaskEvents.WinBloodline60 , param = {1} },  rewards = {DailyExp = 20} },
    { id = 23, takeType = TaskClass.TaskType.Daily, taskName = "赢得1000金币", taskDes = "赢得1000金币", condition = {type = TaskEvents.GainCoin , param = {1000} },  rewards = {DailyExp = 20} },

    { id = 24, takeType = TaskClass.TaskType.Daily, taskName = "以80%或更高血量获胜", taskDes = "以80%或更高血量获胜", condition = {type = TaskEvents.WinBloodline80 , param = {1} },  rewards = {DailyExp = 20} },
    { id = 25, takeType = TaskClass.TaskType.Daily, taskName = "命中头部3次", taskDes = "命中头部3次", condition = {type = TaskEvents.HeadShot , param = {3} },  rewards = {DailyExp = 20} },

    { id = 26, takeType = TaskClass.TaskType.Daily, taskName = "在不受伤情况下赢得比赛", taskDes = "在不受伤情况下赢得比赛", condition = {type = TaskEvents.WinBloodline100 , param = {1} },  rewards = {DailyExp = 25} },
    { id = 27, takeType = TaskClass.TaskType.Daily, taskName = "赢得1500金币", taskDes = "赢得1500金币", condition = {type = TaskEvents.GainCoin , param = {1500} },  rewards = {DailyExp = 25} },

    { id = 28, takeType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得5场比赛", taskDes = "使用弓箭赢得5场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {5} },  rewards = {DailyExp = 25} },
    { id = 29, takeType = TaskClass.TaskType.Daily, taskName = "使用投矛赢得5场比赛", taskDes = "使用投矛赢得5场比赛", condition = {type = TaskEvents.BattleWinUseSpear , param = {5} },  rewards = {DailyExp = 25} },
    { id = 30, takeType = TaskClass.TaskType.Daily, taskName = "使用投斧赢得5场比赛", taskDes = "使用投斧赢得5场比赛", condition = {type = TaskEvents.BattleWinUseAxe , param = {5} },  rewards = {DailyExp = 25} },

    { id = 31, takeType = TaskClass.TaskType.Weekly, taskName = "周一登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 1},  rewards = {WeeklyExp = 1} },                           --周一任务
    { id = 32, takeType = TaskClass.TaskType.Weekly, taskName = "周一登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 1},  rewards = {WeeklyExp = 1} },                           --周一任务
    { id = 33, takeType = TaskClass.TaskType.Weekly, taskName = "周一登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 1},  rewards = {WeeklyExp = 1} },                           --周一任务

    { id = 34, takeType = TaskClass.TaskType.Weekly, taskName = "周二登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 2},  rewards = {WeeklyExp = 1} },                           --周二任务
    { id = 35, takeType = TaskClass.TaskType.Weekly, taskName = "周二登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 2},  rewards = {WeeklyExp = 1} },                           --周二任务
    { id = 36, takeType = TaskClass.TaskType.Weekly, taskName = "周二登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 2},  rewards = {WeeklyExp = 1} },                           --周二任务

    { id = 37, takeType = TaskClass.TaskType.Weekly, taskName = "周三登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 3},  rewards = {WeeklyExp = 1} },                          --周三任务
    { id = 38, takeType = TaskClass.TaskType.Weekly, taskName = "周三登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 3},  rewards = {WeeklyExp = 1} },                          --周三任务
    { id = 39, takeType = TaskClass.TaskType.Weekly, taskName = "周三登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 3},  rewards = {WeeklyExp = 1} },                          --周三任务

    { id = 40, takeType = TaskClass.TaskType.Weekly, taskName = "周四登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 4},  rewards = {WeeklyExp = 1} },                          --周四任务
    { id = 41, takeType = TaskClass.TaskType.Weekly, taskName = "周四登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 4},  rewards = {WeeklyExp = 1} },                          --周四任务
    { id = 42, takeType = TaskClass.TaskType.Weekly, taskName = "周四登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 4},  rewards = {WeeklyExp = 1} },                          --周四任务

    { id = 43, takeType = TaskClass.TaskType.Weekly, taskName = "周五登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 5},  rewards = {WeeklyExp = 1} },                          --周五任务
    { id = 44, takeType = TaskClass.TaskType.Weekly, taskName = "周五登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 5},  rewards = {WeeklyExp = 1} },                          --周五任务
    { id = 45, takeType = TaskClass.TaskType.Weekly, taskName = "周五登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 5},  rewards = {WeeklyExp = 1} },                          --周五任务

    { id = 46, takeType = TaskClass.TaskType.Weekly, taskName = "周六登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 6},  rewards = {WeeklyExp = 1} },                          --周六任务
    { id = 47, takeType = TaskClass.TaskType.Weekly, taskName = "周六登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 6},  rewards = {WeeklyExp = 1} },                          --周六任务
    { id = 48, takeType = TaskClass.TaskType.Weekly, taskName = "周六登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 6},  rewards = {WeeklyExp = 1} },                          --周六任务

    { id = 49, takeType = TaskClass.TaskType.Weekly, taskName = "周日登录游戏1次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {1} , wday = 7},  rewards = {WeeklyExp = 1} },                          --周日任务
    { id = 50, takeType = TaskClass.TaskType.Weekly, taskName = "周日登录游戏2次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {2} , wday = 7},  rewards = {WeeklyExp = 1} },                          --周日任务
    { id = 51, takeType = TaskClass.TaskType.Weekly, taskName = "周日登录游戏3次", taskDes = "", condition = {type = TaskEvents.LoginGame , param = {3} , wday = 7},  rewards = {WeeklyExp = 1} },                          --周日任务
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