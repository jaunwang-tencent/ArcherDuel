--简易更新器
local Updator = {}

local GlobalUpdatorMap = {}
local GlobalUpdatorID = 0
local CurrentApp

--- 观察时刻
---@return 当前时刻【单位：秒】
local function WatchTime()
    if not CurrentApp or not CurrentApp.IsVlid then
        CurrentApp = UGCS.Framework.Application.current
    end
    if CurrentApp then
        return CurrentApp:Watch()
    end
end

--- 分配时长为Duration的刷新器
---@param DurationTime 持续时长
---@param OnBegin 开始
---@param OnUpdate 进度刷新
---@param OnEnd 结束
---@param Args 参数列表
---@return 刷新器标识
function Updator.Alloc(DurationTime, OnBegin, OnUpdate, OnEnd, ...)
    local CurrentTimestamp = WatchTime()
    if CurrentTimestamp then
        local Instance = {
            ExecuteTime = CurrentTimestamp,
            DurationTime = DurationTime,
            OnBegin = OnBegin,
            OnUpdate = OnUpdate,
            OnEnd = OnEnd,
            Args = {...}
        }
        GlobalUpdatorID = GlobalUpdatorID + 1
        GlobalUpdatorMap[GlobalUpdatorID] = Instance
        if OnBegin then
            OnBegin(...)
        end
        return GlobalUpdatorID
    end
end

--- 释放刷新器
---@param UpdatorID 刷新标识
function Updator.Free(UpdatorID, notEnd)
    if UpdatorID then
        local Instance = GlobalUpdatorMap[UpdatorID]
        if not notEnd and Instance and Instance.OnEnd then
            if Instance.OnEnd then
                Instance.OnEnd(table.unpack(Instance.Args))
            end
        end
        GlobalUpdatorMap[UpdatorID] = nil
    end
end

--刷新器
function Updator.Update()
     --延迟执行
     if GlobalUpdatorMap then
        local CurrentTimestamp = WatchTime()
        if CurrentTimestamp then
            local CompletedUpdatorList = {}
            --使用时，先临时拷贝
            local TempUpdatorMap = {}
            for UpdatorID, Instance in pairs(GlobalUpdatorMap) do
                TempUpdatorMap[UpdatorID] = Instance
            end
            for UpdatorID, Instance in pairs(TempUpdatorMap) do
                local Progress
                if Instance.DurationTime == 0 then
                    --时长为0表示永动机，只能人工移除
                    Progress = 0
                else
                    local PassTime = CurrentTimestamp - Instance.ExecuteTime
                    if PassTime < Instance.DurationTime then
                        Progress = PassTime / Instance.DurationTime
                    else
                        Progress = 1
                        table.insert(CompletedUpdatorList, UpdatorID)
                    end
                end
                --刷新
                if Instance.OnUpdate then
                    Instance.OnUpdate(Progress, table.unpack(Instance.Args))
                end
            end
            --清除已完成的刷新器
            for _, UpdatorID in pairs(CompletedUpdatorList) do
                --释放
                Updator.Free(UpdatorID)
            end
        end
    end
end

return Updator