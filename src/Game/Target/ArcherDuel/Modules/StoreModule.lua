--商城模块，这里会有一系列活动
local StoreModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig

--- 打开
---@param PlayerData 玩家数据
function StoreModule:Open(PlayerData)
    local StoreView = UIConfig.StoreView
    self.ScrollItems = {}
    --加载商城活动
    local Activities = StoreView.Activities
    for _, Activity in pairs(Activities) do
        --插入活动页签
        table.insert(self.ScrollItems, Activity.ID)
        --插入分隔条
        local SplitItem =  UI:DuplicateWidget(StoreView.SplitItem, 6000, 6000)
        table.insert(self.ScrollItems, SplitItem)
    end
    --添加到滚动视图
    UI:AddToScrollView(StoreView.Scrollable, self.ScrollItems)

    --注册获取事件
    --寄存玩家数据
    self.PlayerData = PlayerData
end

--- 刷新
---@param DeltaTime 时间戳
function StoreModule:Update(DeltaTime)
    
end

--- 关闭
function StoreModule:Close()
    --销毁视图
    UI:RemoveFromScrollView(110361, self.ScrollItems)
    --清除玩家数据
    self.PlayerData = nil
end

return StoreModule