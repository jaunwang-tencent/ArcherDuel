--任务模块
local TaskModule = {}

--- 打开
---@param PlayerData 玩家数据
function TaskModule:Open(PlayerData)
    self:LoadData()
end

function TaskModule:LoadData()
    Log:PrintDebug("TaskModule:LoadData")
    local TaskManager = require "Game.Framework.Task.Task"
    local taskMgr = TaskManager:Init()
    local ret = taskMgr:getAllTask()
    --Log:PrintDebug("[进入v]"..ret)
    local Task_Gap_All = {}
    for k, v in pairs(ret) do
        local NewUI =  UI:DuplicateWidget(110369, 0, 0)
        local TextID = UI:FindChildWithIndex(NewUI, 2)
        local BtnID1 = UI:FindChildWithIndex(NewUI, 3) -- 前往按钮
        local BtnID2 = UI:FindChildWithIndex(NewUI, 4) -- 领取按钮
        if v.State == TaskManager.Task.State.COMPLETED then
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
            local ret = taskMgr:finishTask(k)
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

--- 刷新
---@param DeltaTime 时间戳
function TaskModule:Update(DeltaTime)
    
end

--- 关闭
function TaskModule:Close()

end

return TaskModule