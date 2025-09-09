--装备模块
local EquipmentModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig

--- 打开
---@param PlayerData 玩家数据
function EquipmentModule:Open(PlayerData)
    local EquipmentView = UIConfig.EquipmentView
    
end

--- 刷新
---@param DeltaTime 时间戳
function EquipmentModule:Update(DeltaTime)
    
end

--- 关闭
function EquipmentModule:Close()

end

return EquipmentModule