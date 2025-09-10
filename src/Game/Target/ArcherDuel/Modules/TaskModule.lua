--任务模块
local TaskModule = {}


--- 打开
---@param PlayerData 玩家数据
function TaskModule:Open(PlayerData)
    self:LoadData()
end

function TaskModule:LoadData()
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
    -- 以后对 arr 排序和使用
    table.sort(arr, function(a,b) 
        if a.state == taskMgr.Task.State.IN_PROGRESS then
            return true
        else
            
        end
    end)
    Log:PrintDebug("排序后")
    for k, v in pairs(arr) do
        Log:PrintDebug("TaskModule:LoadData:" .. v.name)
        Log:PrintDebug("TaskModule:LoadData:" .. v.state)
    end

    --Log:PrintDebug("[进入v]"..ret)
    local Task_Gap_All = {}
    for k, v in pairs(arr) do
        local NewUI =  UI:DuplicateWidget(110369, 0, 0)
        local TextID = UI:FindChildWithIndex(NewUI, 2)
        local BtnID1 = UI:FindChildWithIndex(NewUI, 3) -- 前往按钮
        local BtnID2 = UI:FindChildWithIndex(NewUI, 4) -- 领取按钮
        if v.state == taskMgr.Task.State.COMPLETED then
            UI:SetVisible({BtnID1}, false)
            UI:SetVisible({BtnID2}, true)
        else
            UI:SetVisible({BtnID1}, true)
            UI:SetVisible({BtnID2}, false)
        end

        UI:SetText({TextID}, v.name)
        UI:RegisterClicked(BtnID1,function (ItemUID)
        end)
        UI:RegisterClicked(BtnID2,function (ItemUID)
            local ret = taskMgr:finishTask(v.id)
            if ret == true then
                UI:SetVisible({ItemUID}, false)
            end
        end)
        table.insert(Task_Gap_All, NewUI)
    end
    UI:SetVisible(Task_Gap_All, true)
    self.Task_Gap_All = Task_Gap_All
    UI:AddToScrollView(110467, Task_Gap_All)

    local Task = {110369,110375,110381,110387,110393,110399,110405,110411,110417,110423,110429,110435,110441,110447,110453,110459,110465}
    UI:SetVisible(Task, false)
end

function TaskModule:RefreshTaskUI()
    -- table.sort(Task_Gap_All, function(a, b)
    --     return a.state < b.state
    -- end)
    -- self.Task_Gap_All = Task_Gap_All
end

--- 刷新
---@param DeltaTime 时间戳
function TaskModule:Update(DeltaTime)
    
end

--- 关闭
function TaskModule:Close()

end

return TaskModule