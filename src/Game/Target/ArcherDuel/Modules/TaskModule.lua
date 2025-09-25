--任务模块
local TaskModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
--任务管理器
local TaskManager = UGCS.Target.ArcherDuel.Task.TaskManager

--- 打开
function TaskModule:Open(Context)
    self:LoadData()
end

function TaskModule:LoadData()
    local Task = {110369}
    UI:SetVisible(Task, true)

    self:RefreshTaskUI()

    UI:SetVisible(Task, false)
end

function TaskModule:RefreshTaskProcesUI()
    local TaskExp = DataCenter.GetNumber("Player_TaskDailyExp_Num")
    local CollectTask = DataCenter.GetNumber("Player_CollectTaskDaily_Num")
    local winningPoints = {40, 80, 120, 160, 200, 240}
    local TaskProcesID  = UIConfig.TaskView.TaskProcesView.TaskProces
    for index = 1, 6, 1 do
        local lockID = UIConfig.TaskView.TaskProcesView.Lock[index]
        local LightID = UIConfig.TaskView.TaskProcesView.Light[index]
        local CrossID = UIConfig.TaskView.TaskProcesView.Cross[index]
        local ButtonID = UIConfig.TaskView.TaskProcesView.Button[index]
        if TaskExp >= winningPoints[index] then
            UI:SetVisible({lockID}, false)
            if (CollectTask & (1 << (index - 1))) ~= 0 then
                --已经领取奖品
                UI:SetVisible({LightID}, false)
                UI:SetVisible({CrossID}, true)
                UI:SetVisible({ButtonID}, false)
            else
                UI:SetVisible({LightID}, true)
                UI:SetVisible({CrossID}, false)
                UI:SetVisible({ButtonID}, true)
                UI:UnRegisterClicked(ButtonID)
                UI:RegisterClicked(ButtonID, function (ButtonID)
                    DataCenter.SetNumber("Player_CollectTaskDaily_Num", CollectTask | (1 << (index - 1)))
                    if index == 1 then
                        GameUtils.AddPlayerReward(100002, 10)
                    elseif index == 2 then
                        GameUtils.AddPlayerReward(100002, 15)
                    elseif index == 3 then
                        GameUtils.AddPlayerReward(100002, 30)
                    elseif index == 4 then
                        GameUtils.AddPlayerReward(100002, 40)
                    elseif index == 5 then
                        GameUtils.AddPlayerReward(100002, 55)
                    elseif index == 6 then
                        GameUtils.AddPlayerReward(200003, 1)
                    end
                    self:RefreshTaskProcesUI()
                end)
            end
        else
            UI:SetVisible({lockID}, true)
            UI:SetVisible({LightID}, false)
            UI:SetVisible({CrossID}, false)
            UI:SetVisible({ButtonID}, true)
        end 
    end
    UI:SetText({UIConfig.TaskView.TaskProcesView.Text},tostring(TaskExp))
    UI:SetProgressMaxValue({TaskProcesID}, 100)
    UI:SetProgressCurrentValue({TaskProcesID}, TaskExp / 240 * 100)
end

function TaskModule:RefreshTaskUI()
    self:RefreshTaskProcesUI()
    local taskMgr = TaskManager:GetInsatnce()
    local ret = taskMgr:getAllTaskByDaily()
    local arr = {}
    for _, v in pairs(ret) do
        table.insert(arr, v)
    end
    
    -- 状态对应排序权重（数值越小越靠前）
    local state_sort_weight = {
        [taskMgr.Task.State.COMPLETED] = 1,
        [taskMgr.Task.State.NOT_ACCEPTED] = 2,
        [taskMgr.Task.State.IN_PROGRESS] = 3,
        [taskMgr.Task.State.FAILED] = 4,
        -- 完成的状态放到最后
        [taskMgr.Task.State.FINISH] = 5,
    }
    -- 以后对 arr 排序和使用
    table.sort(arr, function(a, b)
        -- 取优先级数值，没有定义的默认给个大数，放后面
        local wa = state_sort_weight[a.state] or 999
        local wb = state_sort_weight[b.state] or 999
    
        if wa == wb then
            -- 如果优先级相同，可以继续排其它规则，比如id、小到大
            return (a.id or 0) < (b.id or 0)
        else
            return wa < wb
        end
    end)

    local Task_Gap_All = {}
    if self.Task_Gap_All then
        Task_Gap_All = self.Task_Gap_All
    end
    for k, v in pairs(arr) do
        local NewUI
        if self.Task_Gap_All and self.Task_Gap_All[k] then
            NewUI =  self.Task_Gap_All[k]
        else
            NewUI =  UI:DuplicateWidget(110369, 0, 0)
        end
        local _, current, max = v:getProgressNumer()
        local Icon = UI:FindChildWithIndex(NewUI, 2) -- 已完成图标
        local TextID = UI:FindChildWithIndex(NewUI, 3)
        local BtnID1 = UI:FindChildWithIndex(NewUI, 4) -- 前往按钮
        local BtnID2 = UI:FindChildWithIndex(NewUI, 5) -- 领取按钮
        local ProgressText = UI:FindChildWithIndex(NewUI, 6) -- 进度文本
        local Progress = UI:FindChildWithIndex(NewUI, 7) -- 进度条
        local ExpText = UI:FindChildWithIndex(NewUI, 8) -- 奖励活跃文本
        UI:SetText({ProgressText}, math.floor(current) .. "/" .. math.floor(max))
        UI:SetText({ExpText}, tostring(v.rewards.DailyExp))
        UI:SetProgressMaxValue({Progress}, max)
        UI:SetProgressCurrentValue({Progress}, current)
        if v.state == taskMgr.Task.State.COMPLETED then
            UI:SetVisible({BtnID1}, false)
            UI:SetVisible({BtnID2}, true)
            UI:SetVisible({Icon}, false)
        elseif v.state == taskMgr.Task.State.FINISH then
            UI:SetVisible({BtnID1}, false)
            UI:SetVisible({BtnID2}, false)
            UI:SetVisible({Icon}, true)
        else
            UI:SetVisible({BtnID1}, true)
            UI:SetVisible({BtnID2}, false)
            UI:SetVisible({Icon}, false)
        end

        UI:SetText({TextID}, v.name)
        UI:UnRegisterClicked(BtnID1)
        UI:RegisterClicked(BtnID1,function (ItemUID)
            local cfg = UGCS.Target.ArcherDuel.Task.TaskPool.taskcfg[v.id]
            local score = GameUtils.GetPlayerRankScore()
            if cfg and cfg.taskgo then
                local goObj = taskMgr.Task.TaskGo[cfg.taskgo]
                if goObj.SubTab == "Golden" then
                    if GameUtils.IsReachGoldRank(score) then
                        System:FireGameEvent(_GAME.Events.JumpModule, goObj.GoTab, goObj.SubTab)
                    else
                        UI:ShowMessageTip("达到黄金段位，才能进入黄金赛")
                    end
                elseif goObj.SubTab == "Diamond" then
                    if GameUtils.IsReachDiamondRank(score) then
                        System:FireGameEvent(_GAME.Events.JumpModule, goObj.GoTab, goObj.SubTab)
                    else
                        UI:ShowMessageTip("达到钻石段位，才能进入钻石赛")
                    end
                else
                    System:FireGameEvent(_GAME.Events.JumpModule, goObj.GoTab, goObj.SubTab)
                end
            end
        end)
        UI:UnRegisterClicked(BtnID2)
        UI:RegisterClicked(BtnID2,function (ItemUID)
            local finishTaskRet = taskMgr:finishTask(v.id)
            if finishTaskRet == true then
                local taskExp = DataCenter.GetNumber("Player_TaskDailyExp_Num")
                if v.rewards and v.rewards.DailyExp then
                    DataCenter.SetNumber("Player_TaskDailyExp_Num", taskExp + v.rewards.DailyExp)
                end
                UI:SetVisible({ItemUID}, false)
                table.remove(Task_Gap_All,k)
                table.insert(Task_Gap_All, NewUI)
            end
            self:RefreshTaskUI()
        end)
        if not (self.Task_Gap_All and self.Task_Gap_All[k]) then
            table.insert(Task_Gap_All, NewUI)
        end
    end
    UI:SetVisible(Task_Gap_All, true)
    if self.Task_Gap_All == nil then
        self.Task_Gap_All = Task_Gap_All
        UI:AddToScrollView(110467, Task_Gap_All)
    end
end

--- 刷新
---@param DeltaTime 时间戳
function TaskModule:Update(DeltaTime)
    
end

--- 关闭
function TaskModule:Close()
    for index = 1, 6, 1 do
        local ButtonID = UIConfig.TaskView.TaskProcesView.Button[index]
        UI:UnRegisterClicked(ButtonID)
    end

    if self.Task_Gap_All then
        for k, v in pairs(self.Task_Gap_All) do
            local NewUI = k
            local BtnID1 = UI:FindChildWithIndex(NewUI, 4) -- 前往按钮
            local BtnID2 = UI:FindChildWithIndex(NewUI, 5) -- 领取按钮
            UI:UnRegisterClicked(BtnID1)
            UI:UnRegisterClicked(BtnID2)
        end
        --UI:SetVisible(self.Task_Gap_All, false)
        --self.Task_Gap_All = nil
    end
end

return TaskModule