--任务模块
local TaskModule = {}


--- 打开
---@param PlayerData 玩家数据
function TaskModule:Open(PlayerData)
    self:LoadData()
end

function TaskModule:LoadData()
    local Task = {110369,110375,110381,110387,110393,110399,110405,110411,110417,110423,110429,110435,110441,110447,110453,110459,110465}
    UI:SetVisible(Task, true)

    self:RefreshTaskUI()

    UI:SetVisible(Task, false)
end

function TaskModule:RefreshTaskUI()
    Log:PrintDebug("TaskModule:LoadData")
    local taskMgr = UGCS.Framework.TaskManager:GetInsatnce()
    local ret = taskMgr:getAllTask()
    local arr = {}
    for _, v in pairs(ret) do
        table.insert(arr, v)
    end
    
    Log:PrintDebug("排序前")
    for k, v in pairs(arr) do
        Log:PrintDebug("TaskModule:LoadData：" .. v.name)
        Log:PrintDebug("TaskModule:LoadData:" .. v.state)
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
    Log:PrintDebug("排序后")
    for k, v in pairs(arr) do
        Log:PrintDebug("TaskModule:LoadData:" .. v.name)
        Log:PrintDebug("TaskModule:LoadData:" .. v.state)
    end

    local Task_Gap_All = {}
    for k, v in pairs(arr) do
        local NewUI
        if self.Task_Gap_All and self.Task_Gap_All[k] then
            NewUI =  self.Task_Gap_All[k]
        else
            NewUI =  UI:DuplicateWidget(110369, 0, 0)
        end

        local TextID = UI:FindChildWithIndex(NewUI, 2)
        local BtnID1 = UI:FindChildWithIndex(NewUI, 3) -- 前往按钮
        local BtnID2 = UI:FindChildWithIndex(NewUI, 4) -- 领取按钮
        local Progress = UI:FindChildWithIndex(NewUI, 5) -- 进度条
        local Icon = UI:FindChildWithIndex(NewUI, 1) -- 已完成图标
        UI:SetProgressCurrentValue({Progress}, v:getProgress())
        UI:SetProgressMaxValue({Progress}, v:getProgressNumer())
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
        UI:RegisterClicked(BtnID1,function (ItemUID)
        end)
        UI:RegisterClicked(BtnID2,function (ItemUID)
            local finishTaskRet = taskMgr:finishTask(v.id)
            if finishTaskRet == true then
                UI:SetVisible({ItemUID}, false)
                table.remove(Task_Gap_All,k)
                table.insert(Task_Gap_All, NewUI)
            end
            self:RefreshTaskUI()
        end)
        table.insert(Task_Gap_All, NewUI)
    end
    UI:SetVisible(Task_Gap_All, true)
    self.Task_Gap_All = Task_Gap_All
    UI:AddToScrollView(110467, Task_Gap_All)
end

--- 刷新
---@param DeltaTime 时间戳
function TaskModule:Update(DeltaTime)
    
end

--- 关闭
function TaskModule:Close()
    if self.Task_Gap_All then
        UI:SetVisible(self.Task_Gap_All, false)
        self.Task_Gap_All = nil
    end
end

return TaskModule