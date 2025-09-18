
local TaskPool = {}
local TaskManager = UGCS.Target.ArcherDuel.Task.TaskManager
local TaskClass = TaskManager.Task
local TaskEvents = UGCS.Target.ArcherDuel.Task.TaskEvents
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter

--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils

TaskPool.taskcfg = {
    { id = 1, taskType = TaskClass.TaskType.Daily, taskName = "登录游戏", taskDes = "登录游戏", condition = {type = TaskEvents.LoginGame , param = {1} },  rewards = {DailyExp = 10}, column = 1 },

    { id = 2, taskType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得1场比赛", taskDes = "使用弓箭赢得1场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {1} },  rewards = {DailyExp = 15}, column = 2 },
    { id = 3, taskType = TaskClass.TaskType.Daily, taskName = "使用投矛赢得1场比赛", taskDes = "使用投矛赢得1场比赛", condition = {type = TaskEvents.BattleWinUseSpear , param = {1} },  rewards = {DailyExp = 15}, column = 2 },
    { id = 4, taskType = TaskClass.TaskType.Daily, taskName = "使用投斧赢得1场比赛", taskDes = "使用投斧赢得1场比赛", condition = {type = TaskEvents.BattleWinUseAxe , param = {1} },  rewards = {DailyExp = 15}, column = 2 },

    { id = 5, taskType = TaskClass.TaskType.Daily, taskName = "赢得3场比赛", taskDes = "赢得3场比赛", condition = {type = TaskEvents.BattleWin , param = {3} },  rewards = {DailyExp = 15}, column = 3 },
    { id = 6, taskType = TaskClass.TaskType.Daily, taskName = "完成5场比赛", taskDes = "完成5场比赛", condition = {type = TaskEvents.BattleComplete , param = {5} },  rewards = {DailyExp = 15}, column = 3 },

    { id = 7, taskType = TaskClass.TaskType.Daily, taskName = "赢得500金币", taskDes = "赢得500金币", condition = {type = TaskEvents.GainCoin , param = {500} },  rewards = {DailyExp = 20}, column = 4 },
    { id = 8, taskType = TaskClass.TaskType.Daily, taskName = "命中头部1次", taskDes = "命中头部1次", condition = {type = TaskEvents.HeadShot , param = {1} },  rewards = {DailyExp = 20}, column = 4 },

    { id = 9, taskType = TaskClass.TaskType.Daily, taskName = "领取免费的金币", taskDes = "领取免费的金币", condition = {type = TaskEvents.AdCoin , param = {1} },  rewards = {DailyExp = 20}, column = 5 },
    { id = 10, taskType = TaskClass.TaskType.Daily, taskName = "领取免费的钻石", taskDes = "领取免费的钻石", condition = {type = TaskEvents.AdDiamond , param = {1} },  rewards = {DailyExp = 20}, column = 5 },

    { id = 11, taskType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得3场比赛", taskDes = "使用弓箭赢得3场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {3} },  rewards = {DailyExp = 20}, column = 6 },
    { id = 12, taskType = TaskClass.TaskType.Daily, taskName = "使用投矛赢得3场比赛", taskDes = "使用投矛赢得3场比赛", condition = {type = TaskEvents.BattleWinUseSpear , param = {3} },  rewards = {DailyExp = 20}, column = 6 },
    { id = 13, taskType = TaskClass.TaskType.Daily, taskName = "使用投斧赢得3场比赛", taskDes = "使用投斧赢得3场比赛", condition = {type = TaskEvents.BattleWinUseAxe , param = {3} },  rewards = {DailyExp = 20}, column = 6 },

    { id = 14, taskType = TaskClass.TaskType.Daily, taskName = "赢得5场比赛", taskDes = "赢得5场比赛", condition = {type = TaskEvents.BattleWin , param = {5} },  rewards = {DailyExp = 20}, column = 7 },
    { id = 15, taskType = TaskClass.TaskType.Daily, taskName = "完成10场比赛", taskDes = "完成10场比赛", condition = {type = TaskEvents.BattleComplete , param = {10} },  rewards = {DailyExp = 20}, column = 7 },

    { id = 16, taskType = TaskClass.TaskType.Daily, taskName = "升级1次角色", taskDes = "升级1次角色", condition = {type = TaskEvents.UpdateCharacter , param = {1} },  rewards = {DailyExp = 20}, column = 8 },
    { id = 17, taskType = TaskClass.TaskType.Daily, taskName = "升级1次上装", taskDes = "升级1次上装", condition = {type = TaskEvents.UpdateTop , param = {1} },  rewards = {DailyExp = 20}, column = 8 },
    { id = 18, taskType = TaskClass.TaskType.Daily, taskName = "升级1次下装", taskDes = "升级1次下装", condition = {type = TaskEvents.UpdateBottoms , param = {1} },  rewards = {DailyExp = 20}, column = 8 },

    { id = 19, taskType = TaskClass.TaskType.Daily, taskName = "升级1次弓箭", taskDes = "升级1次弓箭", condition = {type = TaskEvents.UpdateBow , param = {1} },  rewards = {DailyExp = 20}, column = 9 },
    { id = 20, taskType = TaskClass.TaskType.Daily, taskName = "升级1次投矛", taskDes = "升级1次投矛", condition = {type = TaskEvents.UpdateSpear , param = {1} },  rewards = {DailyExp = 20}, column = 9 },
    { id = 21, taskType = TaskClass.TaskType.Daily, taskName = "升级1次投斧", taskDes = "升级1次投斧", condition = {type = TaskEvents.UpdateAxe , param = {1} },  rewards = {DailyExp = 20}, column = 9 },

    { id = 22, taskType = TaskClass.TaskType.Daily, taskName = "以60%或更高血量获胜", taskDes = "以60%或更高血量获胜", condition = {type = TaskEvents.WinBloodline60 , param = {1} },  rewards = {DailyExp = 20}, column = 10 },
    { id = 23, taskType = TaskClass.TaskType.Daily, taskName = "赢得1000金币", taskDes = "赢得1000金币", condition = {type = TaskEvents.GainCoin , param = {1000} },  rewards = {DailyExp = 20}, column = 10 },

    { id = 24, taskType = TaskClass.TaskType.Daily, taskName = "以80%或更高血量获胜", taskDes = "以80%或更高血量获胜", condition = {type = TaskEvents.WinBloodline80 , param = {1} },  rewards = {DailyExp = 20}, column = 11 },
    { id = 25, taskType = TaskClass.TaskType.Daily, taskName = "命中头部3次", taskDes = "命中头部3次", condition = {type = TaskEvents.HeadShot , param = {3} },  rewards = {DailyExp = 20}, column = 11 },

    { id = 26, taskType = TaskClass.TaskType.Daily, taskName = "在不受伤情况下赢得比赛", taskDes = "在不受伤情况下赢得比赛", condition = {type = TaskEvents.WinBloodline100 , param = {1} },  rewards = {DailyExp = 25}, column = 12 },
    { id = 27, taskType = TaskClass.TaskType.Daily, taskName = "赢得1500金币", taskDes = "赢得1500金币", condition = {type = TaskEvents.GainCoin , param = {1500} },  rewards = {DailyExp = 25}, column = 12 },

    { id = 28, taskType = TaskClass.TaskType.Daily, taskName = "使用弓箭赢得5场比赛", taskDes = "使用弓箭赢得5场比赛", condition = {type = TaskEvents.BattleWinUseBow , param = {5} },  rewards = {DailyExp = 25}, column = 13 },
    { id = 29, taskType = TaskClass.TaskType.Daily, taskName = "使用投矛赢得5场比赛", taskDes = "使用投矛赢得5场比赛", condition = {type = TaskEvents.BattleWinUseSpear , param = {5} },  rewards = {DailyExp = 25}, column = 13 },
    { id = 30, taskType = TaskClass.TaskType.Daily, taskName = "使用投斧赢得5场比赛", taskDes = "使用投斧赢得5场比赛", condition = {type = TaskEvents.BattleWinUseAxe , param = {5} },  rewards = {DailyExp = 25}, column = 13 },

    { id = 31, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得5场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {5} , wday = 1},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                           --周一任务
    { id = 32, taskType = TaskClass.TaskType.Weekly, taskName = "累积开启1次宝箱", taskDes = "", condition = {type = TaskEvents.OpenBox , param = {1} , wday = 1},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 1000} },                           --周一任务
    { id = 33, taskType = TaskClass.TaskType.Weekly, taskName = "累积参加1次黄金大奖赛", taskDes = "", condition = {type = TaskEvents.GoldBattle , param = {1} , wday = 1},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 60} },                           --周一任务

    { id = 34, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得10场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {10} , wday = 2},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                           --周二任务
    { id = 35, taskType = TaskClass.TaskType.Weekly, taskName = "累积参加2次黄金大奖赛", taskDes = "", condition = {type = TaskEvents.GoldBattle , param = {2} , wday = 2},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 60} },                           --周二任务
    { id = 36, taskType = TaskClass.TaskType.Weekly, taskName = "领取1次免费金币", taskDes = "", condition = {type = TaskEvents.AdCoin , param = {1} , wday = 2},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 2000} },                           --周二任务

    { id = 37, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得15场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {15} , wday = 3},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                          --周三任务
    { id = 38, taskType = TaskClass.TaskType.Weekly, taskName = "领取1次免费钻石", taskDes = "", condition = {type = TaskEvents.AdDiamond , param = {1} , wday = 3},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 80} },                          --周三任务
    { id = 39, taskType = TaskClass.TaskType.Weekly, taskName = "累计在线10分钟", taskDes = "", condition = {type = TaskEvents.PlayDuration , param = {10} , wday = 3},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 3000} },                          --周三任务

    { id = 40, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得20场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {20} , wday = 4},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                          --周四任务
    { id = 41, taskType = TaskClass.TaskType.Weekly, taskName = "累积开启3次宝箱", taskDes = "", condition = {type = TaskEvents.OpenBox , param = {3} , wday = 4},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 3000} },                          --周四任务
    { id = 42, taskType = TaskClass.TaskType.Weekly, taskName = "累积参加3次黄金大奖赛", taskDes = "", condition = {type = TaskEvents.GoldBattle , param = {3} , wday = 4},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 80} },                          --周四任务

    { id = 43, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得20场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {20} , wday = 5},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                          --周五任务
    { id = 44, taskType = TaskClass.TaskType.Weekly, taskName = "累积参加2次钻石联赛", taskDes = "", condition = {type = TaskEvents.DiamondBattle , param = {2} , wday = 5},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 60} },                          --周五任务
    { id = 45, taskType = TaskClass.TaskType.Weekly, taskName = "领取3次免费金币", taskDes = "", condition = {type = TaskEvents.AdCoin , param = {3} , wday = 5},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 5000} },                          --周五任务

    { id = 46, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得25场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {25} , wday = 6},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                          --周六任务
    { id = 47, taskType = TaskClass.TaskType.Weekly, taskName = "累积参加3次黄金大奖赛", taskDes = "", condition = {type = TaskEvents.GoldBattle , param = {3} , wday = 6},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 80} },                          --周六任务
    { id = 48, taskType = TaskClass.TaskType.Weekly, taskName = "累计在线20分钟", taskDes = "", condition = {type = TaskEvents.PlayDuration , param = {20} , wday = 6},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 5000} },                          --周六任务

    { id = 49, taskType = TaskClass.TaskType.Weekly, taskName = "累积赢得25场排位赛", taskDes = "", condition = {type = TaskEvents.BattleWin , param = {25} , wday = 7},  rewards = {WeeklyExp = 1, RewardId = 200002, RewardCount = 1} },                          --周日任务
    { id = 50, taskType = TaskClass.TaskType.Weekly, taskName = "领取3次免费钻石", taskDes = "", condition = {type = TaskEvents.AdDiamond , param = {3} , wday = 7},  rewards = {WeeklyExp = 1, RewardId = 100002, RewardCount = 80} },                          --周日任务
    { id = 51, taskType = TaskClass.TaskType.Weekly, taskName = "累计在线30分钟", taskDes = "", condition = {type = TaskEvents.PlayDuration , param = {30} , wday = 7},  rewards = {WeeklyExp = 1, RewardId = 100001, RewardCount = 5000} },                          --周日任务
}

function TaskPool.BuildTask()
    local TaskManagerInstance = TaskManager:GetInsatnce()
    local playerId = Character:GetLocalPlayerId()
    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    local lastTaskRefreshTime = DataCenter.GetNumber("Player_LastTaskRefreshTime_Num", true)
    if lastTaskRefreshTime == nil or lastTaskRefreshTime == 0 or lastTaskRefreshTime > nowTs then
        lastTaskRefreshTime = nowTs - (7 * 24 * 60 * 60)
        DataCenter.SetNumber("Player_LastTaskRefreshTime_Num", lastTaskRefreshTime)
    end

    --加载存档中任务数据
    local saveDataKV
    local savedData = DataCenter.GetTable("TaskDataTable", true)
    if savedData then
        saveDataKV = {}
        for _, v in pairs(savedData) do
            saveDataKV[v.id] = v
        end
    end

    --如果存在任务存档数据则直接加载对应配置
    for _, v in pairs(TaskPool.taskcfg) do
        if saveDataKV and saveDataKV[v.id] then
            local condition
            if v.taskType == TaskClass.TaskType.Weekly then
                condition = TaskManagerInstance:createCondition(v.condition.type, {
                    requiredAmount = v.condition.param[1],
                    wday = v.condition.wday
                })
            else
                condition = TaskManagerInstance:createCondition(v.condition.type, {
                    requiredAmount = v.condition.param[1],
                })
            end

            local Quest = TaskClass:new(v.id, v.taskType, v.taskName, v.taskDes, {condition}, v.rewards)
            TaskManagerInstance:addTask(Quest)
            TaskManagerInstance:acceptTask(Quest.id)
        end
    end

    if saveDataKV then
        TaskManagerInstance:LoadSavedTaskData()
    else
        lastTaskRefreshTime = nowTs - (7 * 24 * 60 * 60)
    end

    if GameUtils.isCrossDay(lastTaskRefreshTime) then
        --跨天登录了
        TaskPool.RefreshDailyTask(saveDataKV)
    end
    if GameUtils.isCrossWeek(lastTaskRefreshTime) then
        --跨周登录了
        TaskPool.RefreshWeeklyTask(saveDataKV)
    end

    DataCenter.SetNumber("Player_LastTaskRefreshTime_Num", lastTaskRefreshTime)

    return TaskManagerInstance
end

function TaskPool.RefreshDailyTask(saveDataKV)
    math.randomseed(TimerManager:GetClock())
    local TaskManagerInstance = TaskManager:GetInsatnce()
    if saveDataKV then
        for _, v in pairs(saveDataKV) do
            local Quest = TaskManagerInstance:getTask(v.id)
            if Quest and Quest.type == TaskClass.TaskType.Daily then
                TaskManagerInstance:delTask(v.id)
            end
        end
    end

    local taskColumn = {}
    for _, v in pairs(TaskPool.taskcfg) do
        if v.taskType == TaskClass.TaskType.Daily then
            if taskColumn[v.column] then
                table.insert(taskColumn[v.column], v)
            else
                taskColumn[v.column] = {v}
            end
        end
    end
    for _, v in pairs(taskColumn) do
        local index = math.random(1, #v)
        local condition = TaskManagerInstance:createCondition(v[index].condition.type, {
            requiredAmount = v[index].condition.param[1],
        })
        local Quest = TaskClass:new(v[index].id, v[index].taskType, v[index].taskName, v[index].taskDes, {condition}, v[index].rewards)
        TaskManagerInstance:addTask(Quest)
        TaskManagerInstance:acceptTask(Quest.id)
    end

    TaskManagerInstance:SaveTaskData()
end

function TaskPool.RefreshWeeklyTask(saveDataKV)
    local TaskManagerInstance = TaskManager:GetInsatnce()
    if saveDataKV then
        for _, v in pairs(saveDataKV) do
            local Quest = TaskManagerInstance:getTask(v.id)
            if Quest and Quest.type == TaskClass.TaskType.Weekly then
                TaskManagerInstance:delTask(v.id)
            end
        end
    end

    for _, v in pairs(TaskPool.taskcfg) do
        if v.taskType == TaskClass.TaskType.Weekly then
            local condition = TaskManagerInstance:createCondition(v.condition.type, {
                requiredAmount = v.condition.param[1],
                wday = v.condition.wday
            })

            local Quest = TaskClass:new(v.id, v.taskType, v.taskName, v.taskDes, {condition}, v.rewards)
            TaskManagerInstance:addTask(Quest)
            TaskManagerInstance:acceptTask(Quest.id)
        end
    end

    TaskManagerInstance:SaveTaskData()
end

return TaskPool