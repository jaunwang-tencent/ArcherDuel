--商城模块，这里会有一系列活动
local StoreModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--升级配置
local UpgradeConfig = UGCS.Target.ArcherDuel.Config.UpgradeConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
--装备详情模块
local EquipmentDetailModule = UGCS.Target.ArcherDuel.Modules.EquipmentDetailModule
--任务事件
local TaskEvents = UGCS.Target.ArcherDuel.Task.TaskEvents

--- 打开
function StoreModule:Open(Context)
    --活动页
    self.ScrollItems = {}
    --商铺信息
    self.ShopInfos = {}
    --商品信息
    self.GoodInfos = {}
    --刷新商店
    self:RefreshStore(true)
    --添加之前显示子节点
    UI:SetVisible(self.ScrollItems, true)
    --添加到滚动视图
    UI:AddToScrollView(UIConfig.StoreView.Scrollable, self.ScrollItems)
    --广告结束回调<AdTag, CallBack>
    self.AdFinishCallBack = {}
    --注册广告结束事件
    System:RegisterEvent(Events.ON_PLAYER_WATCH_IAA_AD_FINISH, function(mark, userId)
        local LocalPlayerId = Character:GetLocalPlayerId()
        if LocalPlayerId == userId then
            local CallBack = self.AdFinishCallBack[mark]
            if CallBack then
                --回调处理
                CallBack()
            end
        end
    end)
end

--- 刷新
---@param DeltaTime 时间戳
function StoreModule:Update(DeltaTime)
    
end

--- 关闭
function StoreModule:Close()
    --注销广告完成事件
    System:UnregisterEvent(Events.ON_PLAYER_WATCH_IAA_AD_FINISH)
    self.AdFinishCallBack = {}
    --销毁视图
    local StoreView = UIConfig.StoreView
    UI:RemoveFromScrollView(StoreView.Scrollable, self.ScrollItems)
    for _, ShopInfo in pairs(self.ShopInfos) do
        UI:UnRegisterClicked(ShopInfo.SlotID)
    end
    for _, GoodInfo in pairs(self.GoodInfos) do
        UI:UnRegisterClicked(GoodInfo.SlotID)
    end
    --再隐藏子节点
    UI:SetVisible(self.ScrollItems, false)
    --清除玩家数据
    self.ScrollItems = nil
    self.ShopInfos = nil
    self.GoodInfos = nil
end

--- 刷新价格
---@param ShopView 商铺视图
---@param ShopCosts 商铺消耗
function StoreModule:RefreshPrice(ShopView, ShopCosts)
    --获取当前拥有的砖石数量
    local CurrentDiamond = DataCenter.GetNumber("Diamond")
    --获取当前拥有的金宝箱数量
    local CurrentGoldBox = DataCenter.GetNumber("GoldBox")
    --获取当前拥有的银宝箱数量
    local CurrentSilverBox = DataCenter.GetNumber("SilverBox")

    --砖石&广告类型
    local DiamondStyle = ShopView.DiamondStyle
    local AdStyle = ShopView.AdStyle
    if DiamondStyle and AdStyle then
        if ShopCosts.Diamond and (CurrentDiamond > ShopCosts.Diamond or not ShopCosts.AdTag) then
            --当前玩家拥有消耗砖石数量时，使用砖石购买方式
            UI:SetVisible({DiamondStyle.Icon, DiamondStyle.Price}, true)
            UI:SetText({DiamondStyle.Price}, tostring(ShopCosts.Diamond))
            UI:SetVisible({AdStyle}, false)
        elseif ShopCosts.AdTag then
            --否则观看广告方式
            UI:SetVisible({DiamondStyle.Icon, DiamondStyle.Price}, false)
            UI:SetVisible({AdStyle}, true)
        end
    end

    --宝箱类型
    local BoxStyle = ShopView.BoxStyle
    if BoxStyle then
        if ShopCosts.GoldBox and CurrentGoldBox >= ShopCosts.GoldBox then
            --金宝箱
            GameUtils.SetImageWithAsset(BoxStyle.Icon, "Currency", 1)
            UI:SetText({BoxStyle.Price}, tostring(ShopCosts.GoldBox))
        elseif ShopCosts.SilverBox and CurrentSilverBox >= ShopCosts.SilverBox then
            --银宝箱
            GameUtils.SetImageWithAsset(BoxStyle.Icon, "Currency", 2)
            UI:SetText({BoxStyle.Price}, tostring(ShopCosts.SilverBox))
        elseif ShopCosts.Diamond then
            --砖石
            GameUtils.SetImageWithAsset(BoxStyle.Icon, "Currency", 6)
            UI:SetText({BoxStyle.Price}, tostring(ShopCosts.Diamond))
        else
            --数据错误
            UI:ShowMessageTip("商品数据错误！")
        end
    end
end

--- 刷新商铺【一般地购买某个商品只有一种途径（一个按钮），但不排除会有多个购买途径，比如限定奖池，可以开宝箱、也可以观看广告】
---@param ShopGroup 商铺视图组
---@param ShopItem 商铺数据项
---@param HoldInfo 持有信息
function StoreModule:RefreshShop(ShopGroup, ShopItem, HoldInfo)
    local ShopGoods = ShopItem and ShopItem.Goods
    if ShopGroup and ShopGoods then
        for ShopIndex, ShopSlot in pairs(ShopGroup) do
            --消耗信息
            local ShopCosts = ShopItem.Costs[ShopIndex]
            --处理商铺
            if ShopCosts and ShopGoods then
                --刷新价格
                self:RefreshPrice(ShopSlot, ShopCosts)

                --持有信息
                if HoldInfo then
                    local ShopInfo = {
                        --寄存商铺视图，以便刷新
                        ShopView = ShopSlot,
                        --商铺点击
                        SlotID = ShopSlot.ID,
                        --商铺内容
                        Content = {
                            Costs = ShopCosts,
                            Goods = ShopGoods
                        }
                    }
                    --注册商铺按钮事件
                    UI:RegisterClicked(ShopSlot.ID, function()
                        --触发一次购买行为【刷新存档】
                        self:BuyGood(ShopInfo.Content.Costs, ShopInfo.Content.Goods)
                    end)
                    table.insert(self.ShopInfos, ShopInfo)
                end
            end
        end
    end
end

--- 刷新商品
---@param GoodGroup 商品视图组
---@param ShopItem 商铺数据项
---@param HoldInfo 持有信息
function StoreModule:RefreshGood(GoodGroup, ShopItem, HoldInfo)
    --处理商品
    local ShopGoods = ShopItem.Goods
    if GoodGroup then
        for GoodIndex, GoodSlot in pairs(GoodGroup) do
            local GoodInfo = {
                --寄存商品视图，以便刷新
                GoodView = GoodSlot,
                --商品点击
                SlotID = GoodSlot.ID,
                --商品索引
                GoodIndex = GoodIndex,
                --商品内容
                Content = ShopGoods
            }
            local Equipment = self:GetEquipmentByGoodInfo(GoodInfo)
            if Equipment then
                --装备
                GameUtils.SetImageWithEquipment(GoodSlot.ID, Equipment)
                --装备品质
                if GoodSlot.Background then
                    local EquipmentData = EquipmentConfig[Equipment.ID]
                    GameUtils.SetImageWithAsset(GoodSlot.Background, "EquipmentImage", EquipmentData.Attributes.Grade)
                end
            else
                if not GoodSlot.IconLock then
                    if ShopGoods.Coin then
                        --显示金币
                        GameUtils.SetImageWithAsset(GoodSlot.ID, "Currency", 4)
                    elseif ShopGoods.Diamond then
                        --显示砖石
                        GameUtils.SetImageWithAsset(GoodSlot.ID, "Currency", 6)
                    end
                end
            end
            --点击次数
            if GoodSlot.Times then
                --消耗信息【这种情况下是一一映射】
                local ShopCosts = ShopItem.Costs[GoodIndex]
                --寄存收集次数，即便刷新
                ShopCosts.CollectTimesUI = GoodSlot.Times
                local Text = string.format("%d/%d", ShopCosts.MaxCollect - ShopCosts.HasCollect, ShopCosts.MaxCollect)
                UI:SetText({GoodSlot.Times}, Text)
            end
            --商品数量
            if GoodSlot.Count then
                local Value = ShopGoods.Coin or ShopGoods.Diamond
                local Text = tostring(Value)
                UI:SetText({GoodSlot.Count}, Text)
            end

            --持有信息
            if HoldInfo then
                --注册商品点击事件
                UI:RegisterClicked(GoodInfo.SlotID, function()
                    self:GoodDetail(GoodInfo)
                end)
                table.insert(self.GoodInfos, GoodInfo)
            end
        end
    end
end

--- 刷新商店
---@param HoldInfo 持有信息
function StoreModule:RefreshStore(HoldInfo)
    --商城视图
    local StoreView = UIConfig.StoreView
    --加载商城活动
    local Activities = StoreView.Activities
    --获取商店中所有商品
    local AllShops = DataCenter.GetTable("AllShops")
    local ItemsMap = {
        [1] = AllShops.LimitItem,
        [2] = AllShops.DailyItem,
        [3] = AllShops.DiamondItem,
        [4] = AllShops.CoinItem,
    }
    for ActivityIndex, Activity in ipairs(Activities) do
        if HoldInfo then
            --插入活动页签
            table.insert(self.ScrollItems, Activity.ID)
            --插入分隔条
            local SplitItem =  UI:DuplicateWidget(StoreView.SplitItem, 6000, 6000)
            table.insert(self.ScrollItems, SplitItem)
        end

        --1、关闭所有视图？！

        --2、商品【由数据驱动视图】
        local ShopItems = ItemsMap[ActivityIndex]
        if ShopItems then
            for ViewIndex, ShopItem in ipairs(ShopItems) do
                local ViewSlot = Activity.Views[ViewIndex]
                if ViewSlot then
                    --刷新商铺
                    self:RefreshShop(ViewSlot.ShopGroup, ShopItem, HoldInfo)

                    --刷新商品
                    self:RefreshGood(ViewSlot.GoodGroup, ShopItem, HoldInfo)
                end
            end
        end
    end
end

--- 获取指定商品信息对应的装备数据
---@param GoodInfo 商品信息
function StoreModule:GetEquipmentByGoodInfo(GoodInfo)
    --装备
    local EquipmentGood
    if GoodInfo.Content then
        if GoodInfo.Content.Equipments and GoodInfo.GoodIndex then
            EquipmentGood = GoodInfo.Content.Equipments[GoodInfo.GoodIndex]
        else
            EquipmentGood = GoodInfo.Content.Equipment
        end
    end
    if EquipmentGood then
        local AllEquipment = DataCenter.GetTable("AllEquipment")
        local Equipment = AllEquipment[EquipmentGood.ID]
        return Equipment
    end
end

--- 商品详情
---@param GoodInfo 商品信息
function StoreModule:GoodDetail(GoodInfo)
    --装备
    local Equipment = self:GetEquipmentByGoodInfo(GoodInfo)
    if Equipment then
        EquipmentDetailModule:Open(Equipment)
    end
end

--- 累计收集次数
---@param Costs 消耗
function StoreModule:AccumulateCollected(Costs)
    if Costs and Costs.HasCollect and Costs.MaxCollect then
        Costs.HasCollect = Costs.HasCollect + 1
        --刷新视图
        if Costs.CollectTimesUI then
            local Text = string.format("%d/%d", Costs.MaxCollect - Costs.HasCollect, Costs.MaxCollect)
            UI:SetText({Costs.CollectTimesUI}, Text)
        end
        if Costs.AdTag == "ad_tag_free" then
            --免费刷新全局已观看
            DataCenter.SetNumber("Player_HasAdFreeWatch_Num", Costs.HasCollect)
        end
        --刷新商店存档
        System:FireGameEvent(_GAME.Events.RefreshData, "StoreData")
    end
end

--- 购买商品
---@param Costs 消耗
---@param Goods 商品
function StoreModule:BuyGood(Costs, Goods)
    --前置条件检测
    if Costs.HasCollect and Costs.MaxCollect and Costs.HasCollect >= Costs.MaxCollect then
        --超过消耗数量则不允购买
        --UI:ShowMessageTip("Cant Buy:" .. ShopInfo.SlotID)
        return
    end
    local GoldBox = DataCenter.GetNumber("GoldBox")
    local SilverBox = DataCenter.GetNumber("SilverBox")
    local Diamond = DataCenter.GetNumber("Diamond")
    local Success = false
    if Costs.GoldBox then
        if GoldBox >= Costs.GoldBox then
            --消耗金宝箱
            DataCenter.SetNumber("GoldBox", GoldBox - Costs.GoldBox)
            Success = true
        elseif Costs.Diamond and Diamond >= Costs.Diamond then
            --消砖石
            DataCenter.SetNumber("Diamond", Diamond - Costs.Diamond)
            Success = true
        else
            --在此弹出看广告弹窗
            self:ShowAdView(Goods)
        end
        if Success then
            self:OpenBox(Goods.BoxID)
        end
    elseif Costs.SilverBox then
        if SilverBox >= Costs.SilverBox then
            --消耗银宝箱
            DataCenter.SetNumber("SilverBox", SilverBox - Costs.SilverBox)
            Success = true
        elseif Costs.Diamond and Diamond >= Costs.Diamond then
            --消砖石
            DataCenter.SetNumber("Diamond", Diamond - Costs.Diamond)
            Success = true
        else
            --在此弹出看广告弹窗
            self:ShowAdView(Goods)
        end
        if Success then
            self:OpenBox(Goods.BoxID)
        end
    elseif Costs.Diamond then
        --消耗砖石
        if Diamond >= Costs.Diamond then
            --直接消耗
            DataCenter.SetNumber("Diamond", Diamond - Costs.Diamond)
            Success = true
            --获得物品
            self:ShowGainView(Costs, Goods)
        else
            if Costs.AdTag then
                --观看广告
                self:SeeAd(Costs, Goods)
            else
                --在此弹出看广告弹窗
                self:ShowAdView(Goods)
            end
        end
    elseif Costs.AdTag then
        --观看广告
        self:SeeAd(Costs, Goods)
    end

    if Success then
        --累计消耗
        self:AccumulateCollected(Costs)
        --刷新价格
        self:RefreshStore(false)
        --刷新商店资源
        System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")
    end
end

--- 观看广告
---@param Costs 消耗
---@param Goods 商品
function StoreModule:SeeAd(Costs, Goods)
    local AdTag = Costs.AdTag
    if AdTag then
        local CallBack = self.AdFinishCallBack[AdTag]
        if not CallBack then
            CallBack = function()
                --累计收集次数
                self:AccumulateCollected(Costs)
                --看完广告后，获得物品
                self:ShowGainView(Costs, Goods)
            end
            --加入回调
            self.AdFinishCallBack[AdTag] = CallBack
        end
        --广告观看
        IAA:LetPlayerWatchAds(AdTag)
    end
end

--- 显示广告视图，通过看广告来获取砖石【免费获取，每天固定数量】
---@param Goods 物品
function StoreModule:ShowAdView(Goods)
    local AdView = UIConfig.AdView
    UI:SetVisible({AdView.ID}, true)
    local HasCollect = DataCenter.GetNumber("Player_HasAdFreeWatch_Num", true)
    local MaxCollect = DataCenter.GetNumber("Player_MaxAdFreeWatch_Num")
    local Text = string.format("%d/%d", MaxCollect - HasCollect, MaxCollect)
    UI:SetText({AdView.Times}, Text)

    UI:RegisterClicked(AdView.AdButton, function()
        ----关闭
        UI:SetVisible({AdView.ID}, false)
        --观看广告
        local Costs = {
            AdTag = "ad_tag_free",
            HasCollect = HasCollect,
            MaxCollect = MaxCollect,
            CollectTimesUI = AdView.Times
        }
        self:SeeAd(Costs, Goods)
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

--- 打开宝箱
---@param BoxID 宝箱Id
function StoreModule:OpenBox(BoxID)
    local ThreeItem = UIConfig.BoxView.ThreeItem
    --显示装备按钮
    UI:SetVisible({ThreeItem.ID, ThreeItem.ItemGroupID}, true)

    --开宝箱表演
    local TargetPerformID
    for _, Perform in ipairs(ThreeItem.PerformGroup) do
        UI:SetVisible({Perform.ID}, false)
        if BoxID == Perform.ResourceID then
            UI:SetVisible({Perform.ID}, true)
            TargetPerformID = Perform.ID
        end
    end

    --装备展示
    for _, Item in ipairs(ThreeItem.ItemGroup) do
        UI:SetVisible({Item.Icon, Item.Background}, false)
    end
    local BoxRewards = GameUtils.OpenBoxReward(BoxID)
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
        --暂停特效播放
        UGCS.Framework.Executor.Delay(0.7, function()
            if TargetPerformID then
                UI:EffectPausePlay(TargetPerformID)
            end
        end)
        --播到1.6秒暂停播放
        UGCS.Framework.Executor.Delay(1.6, function()
            UI:PauseUIAnimation(ThreeItem.ItemGroupID, 1)
            --当表演完成之后才显示领取按钮
            UGCS.Framework.Executor.Delay(0.5, function()
                UI:SetVisible({ThreeItem.Button.ID, ThreeItem.Button.Icon, ThreeItem.Button.Text},true)
            end)
        end)
    end)

    --注册领取事件
    UI:RegisterClicked(ThreeItem.Button.ID, function ()
        --获取装备
        local AllEquipment = DataCenter.GetTable("AllEquipment")
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
        UI:SetVisible({ThreeItem.ItemGroupID, TargetPerformID}, false)
        --恢复动画播放【这个方案可能还是会有问题！！！】
        UI:ResumeUIAnimation(ThreeItem.ItemGroupID, 1)
        --隐藏组
        UI:SetVisible({ThreeItem.ID}, false)
        --注销事件
        UI:UnRegisterClicked(ThreeItem.Button.ID)
    end)
    return BoxRewards
end

--- 显示获得视图
---@param Costs 消耗,目前有四种途径获得商品 {Ad = tag} or {Diamond = 1} or {GoldBox = 1} or {SilverBox = 1}
---@param Goods 物品
function StoreModule:ShowGainView(Costs, Goods)
    local GainView = UIConfig.GainView
    local GoodSlot = GainView.GoodSlot
    local CoinSlot = GainView.CoinSlot
    UI:SetVisible({GainView.ID}, true)
    --播放背景动效
    UI:PlayUIAnimation(GainView.BackgroundEffect, 1, 0)

    local Converted, GoodsEquipment, GoodsCoin, GoodsDiamond = false, Goods.Equipment, Goods.Coin, Goods.Diamond
    if GoodsEquipment then
        --获取装备
        local AllEquipment = DataCenter.GetTable("AllEquipment")
        local TargetEquipment = AllEquipment[GoodsEquipment.ID]
        --获取装备升级信息
        local Attributes = EquipmentConfig[GoodsEquipment.ID].Attributes
        local GradeUpgradeConfig = UpgradeConfig[Attributes.Grade]
        if TargetEquipment.Level < 5 then
            local TotalUpgradePiece = 0
            for Level = TargetEquipment.Level, 4 do
                local Upgrade = GradeUpgradeConfig[Level]
                TotalUpgradePiece = TotalUpgradePiece + Upgrade.Piece
            end
            if TotalUpgradePiece <= TargetEquipment.Piece then
                --当前拥有碎片数量过升级所需碎片总量时，则转化为金币
                Converted = true
            end
        else
            --满级也需要转化为金币
            Converted = true
        end
        if Converted then
            local CoinConvertConfig = {
                200, 300, 500, 800
            }
            --转换成币
            GoodsCoin = CoinConvertConfig[TargetEquipment.Level]
        else
            --显示物品
            UI:SetVisible({GoodSlot.ID}, true)
            UI:SetVisible({CoinSlot.ID}, false)

            --累加碎片
            TargetEquipment.Piece = TargetEquipment.Piece + 1
            --解锁
            TargetEquipment.Unlock = true

            --显示部分
            GameUtils.SetImageWithEquipment(GoodSlot.Icon, TargetEquipment)
            GameUtils.SetImageWithAsset(GoodSlot.Background, "EquipmentImage", Attributes.Grade)

            --刷新装备数据
            System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
        end
    end
    --金币和砖石
    if GoodsCoin or GoodsDiamond then
        local ExecuteShowResource = function()
            if GoodsCoin then
                --获得金钱，显示金钱
                local Coin = DataCenter.GetNumber("Coin")
                Coin = Coin + GoodsCoin
                DataCenter.SetNumber("Coin", Coin)

                --显示部分
                GameUtils.SetImageWithAsset(CoinSlot.Icon, "Currency", 4)
                UI:SetText({CoinSlot.Count}, tostring(GoodsCoin))
                if Costs and Costs.AdTag then
                    System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.AdCoin)
                end
            elseif GoodsDiamond then
                --获得砖石，显示砖石
                local Diamond = DataCenter.GetNumber("Diamond")
                Diamond = Diamond + GoodsDiamond
                DataCenter.SetNumber("Diamond", Diamond)

                --显示部分
                GameUtils.SetImageWithAsset(CoinSlot.Icon, "Currency", 6)
                UI:SetText({CoinSlot.Count}, tostring(GoodsDiamond))
                if Costs and Costs.AdTag then
                    System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.AdDiamond)
                end
            end
        end

        --显示资源
        UI:SetVisible({GoodSlot.ID}, false)
        if Converted then
            --转化动画
            UI:SetVisible({CoinSlot.ID, CoinSlot.Background}, true)
             --播放翻盘动画
            UI:PlayUIAnimation(CoinSlot.Background, 1, 0)
            --延迟显示资源和数量
            UGCS.Framework.Executor.Delay(0.2, function()
                UI:SetVisible({CoinSlot.Count, CoinSlot.Icon}, true)
                ExecuteShowResource()
            end)
        else
            --立即显示
            UI:SetVisible({CoinSlot.ID, CoinSlot.Count, CoinSlot.Icon, CoinSlot.Background}, true)
            ExecuteShowResource()
        end
    end
    --设置物品图标
    UI:RegisterClicked(GainView.CloseButton, function()
        UI:SetVisible({GainView.ID}, false)
        UI:StopUIAnimation(GainView.BackgroundEffect)
        --注销按钮事件
        UI:UnRegisterClicked(GainView.CloseButton)
    end)
end

return StoreModule