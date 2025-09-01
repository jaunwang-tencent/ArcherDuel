--简易执行器
local Executor = {}

local GlobalExecutorMap = {}
local GlobalExecutorID = 0
local CurrentApp

--- 观察时刻
---@return 当前时刻【单位：秒】
local function WatchTime()
    if not CurrentApp or not CurrentApp.IsValid then
        CurrentApp = UGCS.Framework.Application.current
    end
    if CurrentApp then
        return CurrentApp:Watch()
    end
end

--- 延迟执行
---@param DelayTime 延迟时间
---@param OnExecute 执行函数
---@param Args 参数列表
---@return 执行标识
function Executor.Delay(DelayTime, OnExecute, ...)
    local CurrentTimestamp = WatchTime()
    if CurrentTimestamp then
        local Instance = {
            ExecuteTime = CurrentTimestamp,
            DelayTime = DelayTime,
            OnExecute = OnExecute,
            Args = {...}
        }
        GlobalExecutorID = GlobalExecutorID + 1
        GlobalExecutorMap[GlobalExecutorID] = Instance
        return GlobalExecutorID
    end
end

--- 取消执行
---@param ExecutorID 执行标识
function Executor.Cancel(ExecutorID)
    if ExecutorID then
        GlobalExecutorMap[ExecutorID] = nil
    end
end

--- 刷新执行列表
function Executor.Update()
    --延迟执行
    if GlobalExecutorMap then
        local CurrentTimestamp = WatchTime()
        if CurrentTimestamp then
            local CompletedExecutorList = {}
            for ExecutorID, Instance in pairs(GlobalExecutorMap) do
                local PassTime = CurrentTimestamp - Instance.ExecuteTime
                if PassTime >= Instance.DelayTime then
                    if Instance.OnExecute then
                        Instance.OnExecute(table.unpack(Instance.Args))
                    end
                    table.insert(CompletedExecutorList, ExecutorID)
                end
            end
            --清除已完成的执行者
            for _, ExecutorID in pairs(CompletedExecutorList) do
                Executor.Cancel(ExecutorID)
            end
        end
    end
end

return Executor