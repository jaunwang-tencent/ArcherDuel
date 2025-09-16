--商城模块，这里会有一系列活动
local StoreModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
--装备详情模块
local EquipmentDetailModule = UGCS.Target.ArcherDuel.Modules.EquipmentDetailModule

--- 打开
---@param PlayerData 玩家数据
function StoreModule:Open(PlayerData)
    --寄存玩家数据
    self.PlayerData = PlayerData

    local StoreView = UIConfig.StoreView
    self.ScrollItems = {}
    self.ButtonInfos = {}
    self.GoodInfos = {}
    --加载商城活动
    local Activities = StoreView.Activities
    --获取所有商品
    local AllItems = PlayerData.AllItems
    local ItemsMap = {
        [1] = AllItems.LimitItem,
        [2] = AllItems.DailyItem,
        [3] = AllItems.DiamondItem,
        [4] = AllItems.CoinItem,
    }
    for ActivityIndex, Activity in ipairs(Activities) do
        --插入活动页签
        table.insert(self.ScrollItems, Activity.ID)
        --插入分隔条
        local SplitItem =  UI:DuplicateWidget(StoreView.SplitItem, 6000, 6000)
        table.insert(self.ScrollItems, SplitItem)

        --商品
        local Items = ItemsMap[ActivityIndex]
        --商铺
        local Shops = Activity.Shops
        for ShopIndex, ShopSlot in ipairs(Shops) do
            local Item = Items and Items[ShopIndex]
            --按钮组【一般地购买某个商品只有一种途径（一个按钮），但不排除会有多个购买途径，比如限定奖池，可以开宝箱、也可以观看广告】
            local ButtonGroup = ShopSlot.ButtonGroup
            if ButtonGroup and Item then
                local Costs = Item.Costs
                for ButtonIndex, ButtonSlot in pairs(ButtonGroup) do
                    local Cost = Costs[ButtonIndex]
                    if Item then
                        local ButtonInfo = {
                            ButtonID = ButtonSlot.ID,
                            Item = {
                                Costs = Cost,
                                Goods = Item.Goods
                            }
                        }
                        UI:RegisterClicked(ButtonInfo.ButtonID, function()
                            self:BuyGood(ButtonInfo)
                        end)
                        table.insert(self.ButtonInfos, ButtonInfo)
                    end
                end
            end

            --品槽组
            local GoodGroup = ShopSlot.GoodGroup
            if GoodGroup then
                for SlotIndex, GoodSlot in pairs(GoodGroup) do
                    local GoodInfo = {
                        ButtonID = GoodSlot.ID,
                        SlotIndex = SlotIndex,
                        Goods = Item.Goods
                    }
                    local Equipment = self:GetEquipmentByGoodInfo(GoodInfo)
                    if Equipment then
                        GameUtils.SetImageWithEquipment(GoodInfo.ButtonID, Equipment)
                    elseif GoodInfo.Goods.Coin then
                        --显示金币
                        GameUtils.SetImageWithAsset(GoodInfo.ButtonID, "Currency", 4)
                    elseif GoodInfo.Goods.Diamond then
                        --显示砖石
                        GameUtils.SetImageWithAsset(GoodInfo.ButtonID, "Currency", 6)
                    end
                    UI:RegisterClicked(GoodInfo.ButtonID, function()
                        self:GoodDetail(GoodInfo)
                    end)
                    table.insert(self.GoodInfos, GoodInfo)
                end
            end
        end
    end
    --添加之前显示子节点
    UI:SetVisible(self.ScrollItems, true)
    --添加到滚动视图
    UI:AddToScrollView(StoreView.Scrollable, self.ScrollItems)
end

--- 刷新
---@param DeltaTime 时间戳
function StoreModule:Update(DeltaTime)
    
end

--- 关闭
function StoreModule:Close()
    --销毁视图
    local StoreView = UIConfig.StoreView
    UI:RemoveFromScrollView(StoreView.Scrollable, self.ScrollItems)
    for _, ButtonInfo in pairs(self.ButtonInfos) do
        UI:UnRegisterClicked(ButtonInfo.ButtonID)
    end
    for _, GoodInfo in pairs(self.GoodInfos) do
        UI:UnRegisterClicked(GoodInfo.ButtonID)
    end
    --再隐藏子节点
    UI:SetVisible(self.ScrollItems, false)
    --清除玩家数据
    self.ScrollItems = nil
    self.ButtonInfos = nil
    self.GoodInfos = nil
    self.PlayerData = nil
end

--- 获取指定商品信息对应的装备数据
---@param GoodInfo 商品信息
function StoreModule:GetEquipmentByGoodInfo(GoodInfo)
    --装备
    local Equipments = GoodInfo.Goods and GoodInfo.Goods.Equipments
    local EquipmentGood = Equipments and Equipments[GoodInfo.SlotIndex]
    if EquipmentGood then
        local AllEquipment = self.PlayerData.AllEquipment
        local Equipment = AllEquipment[EquipmentGood.ID]
        return Equipment
    end
end

--- 获取指定商品中的装备【第一个】
---@param Goods 商品
function StoreModule:GetEquipmentByGoods(Goods)
    local Equipments = Goods and Goods.Equipments
    local EquipmentGood = Equipments and Equipments[1]
    if EquipmentGood then
        local AllEquipment = self.PlayerData.AllEquipment
        local Equipment = AllEquipment[EquipmentGood.ID]
        return Equipment
    end
end

--- 商品详情
---@param GoodInfo 商品详情
function StoreModule:GoodDetail(GoodInfo)
    --装备
    local Equipment = self:GetEquipmentByGoodInfo(GoodInfo)
    if Equipment then
        EquipmentDetailModule:Open(Equipment)
    end
end

--- 购买商品
---@param ButtonInfo 按钮信息
function StoreModule:BuyGood(ButtonInfo)
    local Item = ButtonInfo.Item
    local Costs = Item.Costs
    local Goods = Item.Goods
    local BaseData = self.PlayerData.BaseData
    if Costs.GoldBox and BaseData.GoldBox >= Costs.GoldBox then
        --消耗金宝箱
        BaseData.GoldBox = BaseData.GoldBox - Costs.GoldBox
        self:OpenBox(200003)
    elseif Costs.SilverBox and BaseData.SilverBox >= Costs.SilverBox then
        --消耗银宝箱
        BaseData.SilverBox = BaseData.SilverBox - Costs.SilverBox
        self:OpenBox(200002)
    elseif Costs.Diamond then
        --消耗砖石
        if BaseData.Diamond > Costs.Diamond then
            --直接消耗
            BaseData.Diamond = BaseData.Diamond - Costs.Diamond
            --获得物品
            self:ShowGainView(Goods)
        else
            --看广告，在此弹出看广告弹窗【没有资源...】
            self:ShowAdView(Goods)
        end
    elseif Costs.Ad then
        --观看广告
        self:SeeAd(Costs.Ad, Goods)
    else
        --不可购买
        UI:ShowMessageTip("Cant Buy:" .. ButtonInfo.ButtonID)
    end
    --刷新商店资源
    System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")
end

--- 显示获得视图
---@param Goods 物品
function StoreModule:ShowGainView(Goods)
    local GainView = UIConfig.GainView
    UI:SetVisible({GainView.ID}, true)

    if Goods.Equipments then
        --获取装备
        local AllEquipment = self.PlayerData.AllEquipment
        for _, Equipment in pairs(Goods.Equipments) do
            local TargetEquipment = AllEquipment[Equipment.ID]
            --累加碎片
            TargetEquipment.Piece = TargetEquipment.Piece + Equipment.Piece
            --解锁
            TargetEquipment.Unlock = true

            --显示部分
            GameUtils.SetImageWithEquipment(GainView.GoodSlot.Icon, Equipment)
            local Attributes = EquipmentConfig[Equipment.ID].Attributes
            GameUtils.SetImageWithAsset(GainView.GoodSlot.Background, "EquipmentImage", Attributes.Grade)
        end
        --刷新装备数据
        System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
    elseif Goods.Coin then
        --获得金钱，显示金钱
        local BaseData = self.PlayerData.BaseData
        BaseData.Coin = BaseData.Coin + Goods.Coin

        --显示部分
        GameUtils.SetImageWithAsset(GainView.GoodSlot.Icon, "Currency", 4)
    elseif Goods.Diamond then
        --获得砖石，显示砖石
        local BaseData = self.PlayerData.BaseData
        BaseData.Diamond = BaseData.Diamond + Goods.Diamond

        --显示部分
        GameUtils.SetImageWithAsset(GainView.GoodSlot.Icon, "Currency", 6)
    end

    --设置物品图标
    UI:RegisterClicked(GainView.CloseButton, function()
        UI:SetVisible({GainView.ID}, false)
        --注销按钮事件
        UI:UnRegisterClicked(GainView.CloseButton)
    end)
end

--- 显示广告视图
---@param Goods 物品
function StoreModule:ShowAdView(Goods)
    local AdView = UIConfig.AdView
    UI:SetVisible({AdView.ID}, true)

    UI:RegisterClicked(AdView.AdButton, function()
        ----关闭
        UI:SetVisible({AdView.ID}, false)
        --观看广告
        self:SeeAd(Goods)
        --注销按钮事件
        UI:UnRegisterClicked(AdView.AdButton)
        UI:UnRegisterClicked(AdView.CloseButton)
    end)

    --设置物品图标
    UI:RegisterClicked(AdView.CloseButton, function()
        --直接关闭
        UI:SetVisible({AdView.ID}, false)
        --注销按钮事件
        UI:UnRegisterClicked(AdView.AdButton)
        UI:UnRegisterClicked(AdView.CloseButton)
    end)
end

--- 观看广告
---@param AdTag 广告标签
---@param Goods 商品
function StoreModule:SeeAd(AdTag, Goods)
    --看广告
    UI:ShowMessageTip("See Ad:" .. AdTag)

    --这一段是模拟观看广告
    UGCS.Framework.Executor.Delay(3, function()
        --看完广告后，获得物品
        self:ShowGainView(Goods)
    end)
end

--- 打开宝箱
---@param boxId 宝箱Id
function StoreModule:OpenBox(boxId)
    local ThreeItem = UIConfig.BoxView.ThreeItem
    --显示装备按钮
    UI:SetVisible({ThreeItem.ID, ThreeItem.ItemGroupID}, true)

    --开宝箱表演
    local TargetBoxID
    for _, Perform in ipairs(ThreeItem.PerformGroup) do
        if boxId == Perform.ResourceID then
            UI:SetVisible({Perform.ID}, true)
            TargetBoxID = Perform.ID
        else
            UI:SetVisible({Perform.ID}, false)
        end
    end

    --装备展示
    for _, Item in ipairs(ThreeItem.ItemGroup) do
        UI:SetVisible({Item.Icon, Item.Background}, false)
    end
    local BoxRewards = _GAME.GameUtils.OpenBoxReward(boxId)
    UI:SetVisible({ThreeItem.Button.ID, ThreeItem.Button.Icon, ThreeItem.Button.Text},false)

    UGCS.Framework.Executor.Delay(2.3, function ()
        for RewardIndex, EquipmentID in ipairs(BoxRewards) do
            local EquipmentData = EquipmentConfig[EquipmentID]
            local BoxItem = ThreeItem.ItemGroup[RewardIndex]
            UI:SetVisible({BoxItem.Icon, BoxItem.Background}, true)
            GameUtils.SetImageWithAsset(BoxItem.Icon, EquipmentData.AssetName, EquipmentData.AssetIndex)
            GameUtils.SetImageWithAsset(BoxItem.Background, "EquipmentImage", EquipmentData.Attributes.Grade)
        end
        UI:PlayUIAnimation(ThreeItem.ItemGroupID, 1, 0)
        --播到1.6秒暂停播放
        UGCS.Framework.Executor.Delay(1.6, function()
            UI:PauseUIAnimation(ThreeItem.ItemGroupID, 1)
        end)
    end)
    UGCS.Framework.Executor.Delay(3,function ()
        if TargetBoxID then
            UI:EffectPausePlay(TargetBoxID)
        end
        UI:SetVisible({ThreeItem.Button.ID, ThreeItem.Button.Icon, ThreeItem.Button.Text},true)
    end)

    --注册领取事件
    UI:RegisterClicked(ThreeItem.Button.ID, function ()
        --获取装备
        local AllEquipment = self.PlayerData.AllEquipment
        for _, EquipmentID in pairs(BoxRewards) do
            local TargetEquipment = AllEquipment[EquipmentID]
            if TargetEquipment.Unlock then
                --累加碎片
                TargetEquipment.Piece = TargetEquipment.Piece + 1
            else
                --解锁
                TargetEquipment.Unlock = true
            end
        end
        --刷新装备数据
        System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
        --隐藏组
        UI:SetVisible({ThreeItem.ItemGroupID}, false)
        --恢复动画播放【这个方案可能还是会有问题！！！】
        UI:ResumeUIAnimation(ThreeItem.ItemGroupID, 1)
        --隐藏组
        UI:SetVisible({ThreeItem.ID}, false)
        --注销事件
        UI:UnRegisterClicked(ThreeItem.Button.ID)
    end)
    return BoxRewards
end

return StoreModule