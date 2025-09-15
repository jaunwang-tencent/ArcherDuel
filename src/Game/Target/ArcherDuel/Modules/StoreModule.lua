--商城模块，这里会有一系列活动
local StoreModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig

--- 打开
---@param PlayerData 玩家数据
function StoreModule:Open(PlayerData)
    local StoreView = UIConfig.StoreView
    self.ScrollItems = {}
    self.ButtonInfos = {}
    --加载商城活动
    local Activities = StoreView.Activities
    --获取所有商品
    local AllGoods = PlayerData.AllGoods
    local GoodsMap = {
        [1] = AllGoods.LimitItem,
        [2] = AllGoods.DailyItem,
        [3] = AllGoods.DiamondItem,
        [4] = AllGoods.CoinItem,
    }
    for ActivityIndex, Activity in ipairs(Activities) do
        --插入活动页签
        table.insert(self.ScrollItems, Activity.ID)
        --插入分隔条
        local SplitItem =  UI:DuplicateWidget(StoreView.SplitItem, 6000, 6000)
        table.insert(self.ScrollItems, SplitItem)

        --注册活动页面上的按钮
        local Buttons = Activity.Buttons
        local Items = GoodsMap[ActivityIndex]
        if Buttons and Items then
            for ButtonIndex, Button in ipairs(Buttons) do
                local Item = Items[ButtonIndex]
                if Item then
                    local ButtonInfo = {
                        ButtonID = Button.ID,
                        Item = Item
                    }
                    UI:RegisterPressed(Button.ID, function()
                        self:BuyGood(ButtonInfo)
                    end)
                    table.insert(self.ButtonInfos, ButtonInfo)
                end
            end
        end
    end
    --添加到滚动视图
    UI:AddToScrollView(StoreView.Scrollable, self.ScrollItems)

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
    for _, ButtonInfo in pairs(self.ButtonInfos) do
        UI:UnRegisterPressed(ButtonInfo.ButtonID)
    end
    UI:UnRegisterClicked(110962)
    --清除玩家数据
    self.ScrollItems = nil
    self.ButtonInfos = nil
    self.PlayerData = nil
end

--- 购买商品
---@param ButtonInfo 按钮信息
function StoreModule:BuyGood(ButtonInfo)
    local Item = ButtonInfo.Item
    local Consumables = Item.Consumables
    local Goods = Item.Goods
    local BaseData = self.PlayerData.BaseData
    if Consumables.GoldBox and BaseData.GoldBox >= Consumables.GoldBox then
        --消耗金宝箱
        BaseData.GoldBox = BaseData.GoldBox - Consumables.GoldBox
        self:OpenBox(200003)
    elseif Consumables.SilverBox and BaseData.SilverBox >= Consumables.SilverBox then
        --消耗银宝箱
        BaseData.SilverBox = BaseData.SilverBox - Consumables.SilverBox
        self:OpenBox(200002)
    elseif Consumables.Diamond then
        --消耗砖石
        if BaseData.Diamond > Consumables.Diamond then
            --直接消耗
            BaseData.Diamond = BaseData.Diamond - Consumables.Diamond
            --获得物品
            self:GainGoods(Goods)
            Log:PrintLog("Last Diamond", BaseData.Diamond)
        else
            --看广告，在此弹出看广告弹窗【没有资源...】
            Log:PrintLog("Last Diamond", BaseData.Diamond)
        end
    elseif Consumables.Ad then
        --看广告
        Log:PrintLog("See Ad", Consumables.Ad)
        --不看广告了，直接获得物品
        self:GainGoods(Goods)
    else
        --不可购买
        Log:PrintLog("Cant Buy", ButtonInfo.ButtonID)
    end
    --刷新商店资源
    System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")
end

--- 获得物品
---@param Goods 物品
function StoreModule:GainGoods(Goods)
    --TODO：获得界面展示
    local BaseData = self.PlayerData.BaseData
    if Goods.Equipments then
        --获取装备
        local AllEquipment = self.PlayerData.AllEquipment
        for _, Equipment in pairs(Goods.Equipments) do
            local TargetEquipment = AllEquipment[Equipment.ID]
            --累加碎片
            TargetEquipment.Piece = TargetEquipment.Piece + Equipment.Piece
            --解锁
            TargetEquipment.Unlock = true
        end
        --刷新装备数据
        System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
    end

    if Goods.Coin then
        --获取金币
        BaseData.Coin = BaseData.Coin + Goods.Coin
    end

    if Goods.Diamond then
        --获取砖石
        BaseData.Diamond = BaseData.Diamond + Goods.Diamond
        System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")
    end
end

--- 刷新图标
---@param IconUI 图标资源
---@param EquipmentData 装备数据
function StoreModule:RefreshIcon(IconUI, EquipmentData)
    if EquipmentData then
        local AssetName = EquipmentData.AssetName or "weapon_icon"
        local AssetIndex = EquipmentData.AssetIndex or EquipmentData.ID
        local ElementId = System:GetScriptParentID()

        local IconIdArray = CustomProperty:GetCustomPropertyArray(ElementId, AssetName, CustomProperty.PROPERTY_TYPE.Image)
        local IconId = IconIdArray[AssetIndex]
        UI:SetImage({IconUI}, IconId, true)
    end
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
            self:RefreshIcon(BoxItem.Icon, EquipmentData)
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
        --恢复动画播放
        UI:ResumeUIAnimation(ThreeItem.ItemGroupID)
        --隐藏组
        UI:SetVisible({ThreeItem.ID}, false)
        --注销事件
        UI:UnRegisterClicked(ThreeItem.Button.ID)
    end)
    return BoxRewards
end
return StoreModule