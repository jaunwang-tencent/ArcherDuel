--商城模块，这里会有一系列活动
local StoreModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig

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

    UI:RegisterClicked(110962, function ()
        self:CloseBox()
    end)
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
    if Consumables.GoldBox and BaseData.GoldBox > Consumables.GoldBox then
        --消耗金宝箱
        BaseData.GoldBox = BaseData.GoldBox - Consumables.GoldBox
    elseif Consumables.SilverBox and BaseData.SilverBox > Consumables.SilverBox then
        --消耗银宝箱
        BaseData.SilverBox = BaseData.SilverBox - Consumables.SilverBox
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

--- 打开宝箱
---@param boxId 宝箱Id
function StoreModule:OpenBox(boxId)
    local ElementId = System:GetScriptParentID()

    local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
    local equipIconUIs = {110966,110957,110956}
    local rewards = _GAME.GameUtils.OpenBoxReward(boxId)
    for i, v in ipairs(rewards) do
        local EquipmentData = EquipmentConfig[v]
        local AssetName = EquipmentData.AssetName or "weapon_icon"
        local AssetIndex = EquipmentData.AssetIndex or EquipmentData.ID
        local IconIdArray = CustomProperty:GetCustomPropertyArray(ElementId, AssetName, CustomProperty.PROPERTY_TYPE.Image)
        local IconId = IconIdArray[AssetIndex]
        UI:SetImage({equipIconUIs[i]}, IconId, true)
        -- local IconBGArray = CustomProperty:GetCustomPropertyArray(ElementId, "", CustomProperty.PROPERTY_TYPE.Image)
        -- UI:SetImage({IconUI}, IconBGArray[EquipmentData.Attributes.Grade], true)
    end

    UI:SetVisible({110963},true) -- 打开宝箱UI
    UI:SetVisible({110962,110965,110959},false)
    TimerManager:AddTimer(2.3,function ()
        UI:SetVisible(equipIconUIs,true)
        for i, v in ipairs(equipIconUIs) do
            UI:PlayUIAnimation(v,1,0)
        end
    end)
    TimerManager:AddTimer(3,function ()
        UI:EffectPausePlay(110964)
        UI:SetVisible({110962,110965,110959},true)
    end)

    return rewards
end

function StoreModule:CloseBox()
    UI:SetVisible({110963},false)
end

return StoreModule