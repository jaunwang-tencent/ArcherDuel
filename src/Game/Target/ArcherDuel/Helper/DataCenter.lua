--数据中心，全局访问，用于寄存运行时数据与存档
--Q:为啥要专项弄一个这个玩意？
--A:因为元件脚本的生命周期进局限于单个场景！无法在运行时共享跨场景的述求，并且能解决试玩模式下存档问题
local DataCenter = {}
local GameServer = require"Server.GameServer"
--归档数据
local ArchiveData = {
    --数值数据
    NumberData = {},
    --表数据
    TableData = {},
}

--寄存的运行时数据【不参与存档行为】
local RuntimeData = {

}

--玩家ID，在同一进程生命周期范围内是不会变得
local PlayerID

--- 获取玩家标识
function DataCenter.GetPlayerID()
    if not PlayerID then
        PlayerID = Character:GetLocalPlayerId()
    end
    return PlayerID
end

--- 重置数据中心
function DataCenter.Reset()
    ArchiveData = {}
    RuntimeData = {}
end

--- 设置数值数据【写入时务必及时存档】
---@param DataName 数据名称
---@param DataValue 数据值
function DataCenter.SetNumber(DataName, DataValue)
    --Log:PrintLog("SetNumber", DataName, DataValue)
    local NumberData = ArchiveData.NumberData
    if DataName and DataValue and NumberData then
        if NumberData then
            NumberData[DataName] = DataValue
            --发送到服务器存储
            local msg = {
                num = 1,
                Store = DataName,
                Value = DataValue,
            }
            GameServer:OnStore(msg,Character:GetLocalPlayerId())
            
        end
    end
end

--- 获取数值数据
---@param DataName 数据名称
---@param SyncData 是否同步数据
---@return DataValue 数据值
function DataCenter.GetNumber(DataName, SyncData)
    --Log:PrintLog("GetNumber", DataName, SyncData)
    local NumberData = ArchiveData.NumberData
    if DataName and NumberData then
        local DataValue
    
        if SyncData and  GameServer:CheckStore(DataName,1,Character:GetLocalPlayerId())  then
            local msg = {
                num = 1,
                Store = DataName,
            }
            DataValue = GameServer:GetStore(msg,Character:GetLocalPlayerId())
            NumberData[DataName] = DataValue
        else
            DataValue = NumberData[DataName]
        end
        return DataValue
    end
end

--- 获取字符串数据
---@param DataName 数据名称
---@param DataValue 数据值
function DataCenter.SetString(DataName, DataValue)
    --Log:PrintLog("SetString", DataName, DataValue)
    local NumberData = ArchiveData.NumberData
    if DataName and DataValue and NumberData then
        if NumberData then
            NumberData[DataName] = DataValue
            --发送到服务器存储
            local msg = {
                num = 2,
                Store = DataName,
                Value = DataValue,
            }
             GameServer:OnStore(msg,Character:GetLocalPlayerId())
        end
    end
end

--- 获取字符串数据
---@param DataName 数据名称
---@param SyncData 是否同步数据
---@return DataValue 数据值
function DataCenter.GetString(DataName, SyncData)
    --Log:PrintLog("GetString", DataName, SyncData)
    local NumberData = ArchiveData.NumberData
    if DataName and NumberData then
        local DataValue
      --  System:SeDndToServer(MsgId,msg)
        if SyncData and GameServer:CheckStore(DataName,2,Character:GetLocalPlayerId()) then
            local msg = {
                num = 2,
                Store = DataName,
            }
            DataValue = GameServer:GetStore(msg,Character:GetLocalPlayerId())
            NumberData[DataName] = DataValue
        else
            DataValue = NumberData[DataName]
        end
        return DataValue
    end
end

--- 设置基础数据【写入时务必及时存档】
---@param DataName 数据名称
---@param DataValue 数据值
function DataCenter.SetTable(DataName, DataValue)
    local TableData = ArchiveData.TableData
    if DataName and DataValue and TableData then
        if TableData then
            TableData[DataName] = DataValue
            local DataJson = MiscService:Table2JsonStr(DataValue)
            --发送到服务器存储
            local msg = {
                num = 2,
                Store = DataName,
                Value = DataValue,
            }
            GameServer:OnStore(msg,Character:GetLocalPlayerId())
        end
    end
end

--- 获取基础数据
---@param DataName 数据名称
---@param SyncData 是否同步数据
---@return DatTable 数据值
function DataCenter.GetTable(DataName, SyncData)
    local TableData = ArchiveData.TableData
    if DataName and TableData then
        local DataValue
        if SyncData and  GameServer:CheckStore(DataName,2,Character:GetLocalPlayerId()) then
             local msg = {
                num = 2,
                Store = DataName,
            }
            local DataJson = GameServer:GetStore(msg,Character:GetLocalPlayerId())
            DataValue = MiscService:JsonStr2Table(DataJson)
            TableData[DataName] = DataValue
        else
            DataValue = TableData[DataName]
        end
        return DataValue
    end
end

--- 寄存数据
---@param DataName 数据名称
---@param DataValue 数据值
function DataCenter.Put(DataName, DataValue)
    RuntimeData[DataName] = DataValue
end

--- 取出数据
---@param DataName 数据名称
---@return DatTable 数据值
function DataCenter.Get(DataName)
    return RuntimeData[DataName]
end
return DataCenter