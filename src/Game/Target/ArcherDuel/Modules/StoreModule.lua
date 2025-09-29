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
--任务事件
local TaskEvents = UGCS.Target.ArcherDuel.Task.TaskEvents
--星钻购买
local FightModule = UGCS.Target.ArcherDuel.Modules.FightModule

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
    self.AccumulateTimestamp = 0
end

--- 刷新
---@param DeltaTime 时间戳
function StoreModule:Update(DeltaTime)
    self.AccumulateTimestamp = self.AccumulateTimestamp + DeltaTime
    --一分钟刷新一次
    if self.AccumulateTimestamp > 60 then
        self.AccumulateTimestamp = 0
        self:RefreshStore(false)
    end
end

--- 关闭
function StoreModule:Close()
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
---@param ShopSlot 商铺槽
---@param ShopCosts 商铺消耗
function StoreModule:RefreshPrice(ShopSlot, ShopCosts)
    --获取当前拥有的砖石数量
    local CurrentDiamond = DataCenter.GetNumber("Diamond")
    --获取当前拥有的金宝箱数量
    local CurrentGoldBox = DataCenter.GetNumber("GoldBox")
    --获取当前拥有的银宝箱数量
    local CurrentSilverBox = DataCenter.GetNumber("SilverBox")

    --砖石&广告类型
    local DiamondStyle = ShopSlot.DiamondStyle
    local AdStyle = ShopSlot.AdStyle
    if DiamondStyle and AdStyle then
        if ShopCosts.Diamond and (CurrentDiamond >= ShopCosts.Diamond or not ShopCosts.AdTag) then
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

    --限时倒计时
    local LimitStyle = ShopSlot.LimitStyle
    if LimitStyle and ShopCosts.ClickTimestamp then
        local NowTimestamp = GameUtils.GetNowTimestamp()
        local DeltaTime = ShopCosts.AdCoolTime - NowTimestamp + ShopCosts.ClickTimestamp - 1
        local FormatTime = GameUtils.GetFormatTime(DeltaTime)
        if FormatTime then
            UI:SetVisible({LimitStyle.GainUI}, false)
            UI:SetVisible({LimitStyle.LimitUI}, true)
            UI:SetText({LimitStyle.CDTime}, FormatTime)
        else
            --清空点击时刻
            ShopCosts.ClickTimestamp = nil
            UI:SetVisible({LimitStyle.GainUI}, true)
            UI:SetVisible({LimitStyle.LimitUI}, false)
        end
    end
    --宝箱类型
    local BoxStyle = ShopSlot.BoxStyle
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
---@param ShopSlot 商铺槽
---@param ShopItem 商铺数据项
---@param HoldInfo 持有信息
function StoreModule:RefreshShop(ShopSlot, ShopItem, HoldInfo)
    local ShopGoods = ShopItem and ShopItem.Goods
    if ShopSlot and ShopGoods then
        --消耗信息
        local ShopCosts = ShopItem.Costs
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
                    --商品消耗
                    Costs = ShopCosts,
                    --商铺商品
                    Goods = ShopGoods
                }
                --注册商铺按钮事件
                UI:RegisterClicked(ShopSlot.ID, function()
                    --触发一次购买行为【刷新存档】
                    Log:PrintTable(ShopInfo.Goods)
                    if not ShopCosts.ClickTimestamp then
                        local isPlayer =  IAA:IsWeChatMiniGamePlayer()
                        if isPlayer then
                            self:BuyGood(ShopInfo.Costs, ShopInfo.Goods)
                        else
                            if ShopInfo.Goods.GoldBox == 1 then
                                FightModule:StarDiamond(3,ShopInfo.Costs,ShopInfo.Goods)
                            elseif ShopInfo.Goods.SilverBox == 1 then
                                FightModule:StarDiamond(4,ShopInfo.Costs, ShopInfo.Goods)
                            elseif ShopInfo.Goods.Diamond == 60 then
                                FightModule:StarDiamond(5,ShopInfo.Costs, ShopInfo.Goods)
                            else 
                                self:BuyGood(ShopInfo.Costs, ShopInfo.Goods)
                            end
                        end
                    end
                end)
                table.insert(self.ShopInfos, ShopInfo)
            end
        end
    end
end

--- 刷新商品
---@param GoodSlot 商品槽
---@param ShopItem 商铺数据项
---@param HoldInfo 持有信息
function StoreModule:RefreshGood(GoodSlot, ShopItem, HoldInfo)
    --处理商品
    local ShopGoods = ShopItem.Goods
    if GoodSlot then
        local GoodInfo = {
            --寄存商品视图，以便刷新
            GoodView = GoodSlot,
            --商品点击
            SlotID = GoodSlot.ID,
            --商品内容
            Goods = ShopGoods
        }
        local Equipment = self:GetEquipmentByID(ShopGoods.EquipmentID)
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
        --装备槽
        local EquipmentSlots = GoodSlot.EquipmentSlots
        local EquipmentIDs = ShopGoods.EquipmentIDs
        if EquipmentIDs then
            for EquipmentIndex, EquipmentID in ipairs(EquipmentIDs) do
                Equipment = self:GetEquipmentByID(EquipmentID)
                if Equipment then
                    local EquipmentSlot = EquipmentSlots[EquipmentIndex]
                    --装备
                    GameUtils.SetImageWithEquipment(EquipmentSlot, Equipment)
                end
            end
        end
        --点击次数
        if GoodSlot.Times then
            --消耗信息【这种情况下是一一映射】
            local ShopCosts = ShopItem.Costs
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
            --注册商品点击装备槽事件
            if EquipmentSlots and EquipmentIDs then
                for SlotIndex, EquipmentSlot in ipairs(EquipmentSlots) do
                    local EquipmentID = EquipmentIDs[SlotIndex]
                    if EquipmentID then
                        UI:RegisterClicked(EquipmentSlot, function()
                            --装备
                            Equipment = self:GetEquipmentByID(EquipmentID)
                            if Equipment then
                                UGCS.Target.ArcherDuel.Modules.EquipmentModule:OpenDetail(Equipment)
                            end
                        end)
                    end
                end
            end
            table.insert(self.GoodInfos, GoodInfo)
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
                local ActivityView = Activity.Views[ViewIndex]
                if ActivityView then
                    --刷新商铺
                    self:RefreshShop(ActivityView.ShopSlot, ShopItem, HoldInfo)

                    --刷新商品
                    self:RefreshGood(ActivityView.GoodSlot, ShopItem, HoldInfo)
                end
            end
        end
    end
end

--- 获取指定商品信息对应的装备数据
---@param EquipmentID 装备ID
function StoreModule:GetEquipmentByID(EquipmentID)
    if EquipmentID then
        local AllEquipment = DataCenter.GetTable("AllEquipment")
        local Equipment = AllEquipment and AllEquipment[EquipmentID]
        return Equipment
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
    if not Costs or not Goods then
        return
    end
    --前置条件检测
    if Costs.HasCollect and Costs.MaxCollect and Costs.HasCollect >= Costs.MaxCollect then
        --超过消耗数量则不允购买
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
            self:ShowAdView()
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
            self:ShowAdView()
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
            local isPlayer =  IAA:IsWeChatMiniGamePlayer()
            if Costs.AdTag and isPlayer then
                --观看广告
                self:SeeAd(Costs, Goods, true)
            else
                --在此弹出看广告弹窗
                self:ShowAdView()
            end
        end
    elseif Costs.AdTag then
        --观看广告
        self:SeeAd(Costs, Goods, true)
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
---@param Costs 消耗【参见：LobbyModule:DefaultShopData()中的Costs】
---@param Goods 商品【格式：{ EquipmentID = 5 } or { Diamond = 60 } or { Coin = 1200 }】
---@param NeedGain 需要获得
---@param OnFinish 观看结束
function StoreModule:SeeAd(Costs, Goods, NeedGain, OnFinish)
    local AdTag = Costs.AdTag
    local isPlayer = IAA:IsWeChatMiniGamePlayer()
    if AdTag and isPlayer then
        GameUtils.SeeAd(AdTag, function()
            Log:PrintLog("OnAdFinish()", AdTag, NeedGain)
            if OnFinish then
                --使用自定义结束事件
                OnFinish()
            end
            if NeedGain then
                --累计收集次数
                self:AccumulateCollected(Costs)
                --看完广告后，获得物品
                self:ShowGainView(Costs, Goods)
            end
        end)
    elseif AdTag then
        if OnFinish then
            --使用自定义结束事件
            OnFinish()
        end
        if NeedGain then
            --累计收集次数
            self:AccumulateCollected(Costs)
            --看完广告后，获得物品
            self:ShowGainView(Costs, Goods)
        end
    end
end

--- 显示广告视图，通过看广告来获取砖石【免费获取，每天固定数量】
function StoreModule:ShowAdView()
    local AdView = UIConfig.AdView
    UI:SetVisible({AdView.ID}, true)
    local HasCollect = DataCenter.GetNumber("Player_HasAdFreeWatch_Num", true)
    local MaxCollect = DataCenter.GetNumber("Player_MaxAdFreeWatch_Num")
    local Text = string.format("%d/%d", MaxCollect - HasCollect, MaxCollect)
    local isPlayer =  IAA:IsWeChatMiniGamePlayer()
    UI:SetText({AdView.Times}, Text)

    UI:RegisterClicked(AdView.AdButton, function()
        ----关闭
        UI:SetVisible({AdView.ID}, false)
        if MaxCollect > HasCollect then
            --观看广告
            local Costs = {
                AdTag = "ad_tag_free",
                HasCollect = HasCollect,
                MaxCollect = MaxCollect,
                CollectTimesUI = AdView.Times
            }
            local Goods = {
                Diamond = 60
            }
             if isPlayer then
               self:SeeAd(Costs, Goods, true)
            else
                FightModule:StarDiamond(5, Costs, Goods)
            end
        else
            UI:ShowMessageTip("今日次数已用尽")
        end
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


--- 将装备转换为金币
---@param EquipmentID 装备标识
function StoreModule:ConvertCoinByEquipment(EquipmentID)
    if EquipmentID then
        local Converted = false
        --获取装备
        local AllEquipment = DataCenter.GetTable("AllEquipment")
        local TargetEquipment = AllEquipment[EquipmentID]
        --获取装备升级信息
        local Attributes = EquipmentConfig[EquipmentID].Attributes
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
            local GoodsCoin = CoinConvertConfig[TargetEquipment.Level]
            return GoodsCoin
        end
    end
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
        UI:SetVisible({Item.Icon, Item.Background, Item.Text}, false)
    end
    local BoxRewards = GameUtils.RandomBox(BoxID, 3)
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
            --结束之后表演翻拍
            --在此处表现翻牌动作
            for RewardIndex, EquipmentID in ipairs(BoxRewards) do
                local ConvertCoin = self:ConvertCoinByEquipment(EquipmentID)
                if ConvertCoin then
                    --转换成币
                    local BoxItem = ThreeItem.ItemGroup[RewardIndex]
                    --转化动画
                    UI:SetVisible({BoxItem.Icon_1, BoxItem.Text}, true)
                    --播放翻盘动画
                    UI:PlayUIAnimation(BoxItem.Icon_1, 1, 0)
                    TimerManager:AddTimer(0.2,function ()
                        UI:SetVisible({BoxItem.Icon_2}, true)
                        UI:SetText({BoxItem.Text}, tostring(ConvertCoin))
                    end)
                end
            end
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
        --开宝箱结束后发射任务事件
        System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.OpenBox)
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
    local ResourceSlot = GainView.ResourceSlot
    UI:SetVisible({GainView.ID}, true)
    --播放背景动效
    UI:PlayUIAnimation(GainView.BackgroundEffect, 1, 0)
    local Converted, EquipmentID, GoodsCoin, GoodsDiamond = false, Goods.EquipmentID, Goods.Coin, Goods.Diamond
    if EquipmentID then
        local ConvertCoin = self:ConvertCoinByEquipment(EquipmentID)
        if ConvertCoin then
            --转换成币
            GoodsCoin = ConvertCoin
            Converted = true
        else
            --获取装备
            local AllEquipment = DataCenter.GetTable("AllEquipment")
            local TargetEquipment = AllEquipment[EquipmentID]
            --获取装备升级信息
            local Attributes = EquipmentConfig[EquipmentID].Attributes

            --显示物品
            UI:SetVisible({GoodSlot.ID}, true)
            UI:SetVisible({ResourceSlot.ID}, false)

            if TargetEquipment.Unlock then
                --累加碎片
                TargetEquipment.Piece = TargetEquipment.Piece + 1
            else
                --解锁
                TargetEquipment.Unlock = true
            end

            --显示部分
            GameUtils.SetImageWithEquipment(GoodSlot.Icon, TargetEquipment)
            GameUtils.SetImageWithAsset(GoodSlot.Background, "EquipmentImage", Attributes.Grade)

            --刷新装备数据
            System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
        end
    end
    --金币和砖石
    if GoodsCoin or GoodsDiamond or Goods.GoldBox or Goods.SilverBox then
        local ExecuteShowResource = function()
            if GoodsCoin then
                --获得金钱，显示金钱
                local Coin = DataCenter.GetNumber("Coin")
                Coin = Coin + GoodsCoin
                DataCenter.SetNumber("Coin", Coin)

                --显示部分
                GameUtils.SetImageWithAsset(ResourceSlot.Icon, "Currency", 4)
                UI:SetText({ResourceSlot.Count}, tostring(GoodsCoin))
                System:FireGameEvent(_GAME.Events.RefreshData, "GeneralResource")

                if Costs and Costs.AdTag then
                    System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.AdCoin)
                end
            elseif GoodsDiamond then
                --获得砖石，显示砖石
                local Diamond = DataCenter.GetNumber("Diamond")
                Diamond = Diamond + GoodsDiamond
                DataCenter.SetNumber("Diamond", Diamond)

                --显示部分
                GameUtils.SetImageWithAsset(ResourceSlot.Icon, "Currency", 6)
                UI:SetText({ResourceSlot.Count}, tostring(GoodsDiamond))
                System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")

                if Costs and Costs.AdTag then
                    System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.AdDiamond)
                end
            elseif Goods.GoldBox then
                --金宝箱
                local GoldBox = DataCenter.GetNumber("GoldBox", true)
                DataCenter.SetNumber("GoldBox", GoldBox + Goods.GoldBox)

                --显示部分
                GameUtils.SetImageWithAsset(ResourceSlot.Icon, "Currency", 1)
                UI:SetText({ResourceSlot.Count}, tostring(Goods.GoldBox))
                System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")
            elseif Goods.SilverBox then
                --银宝箱
                local SilverBox = DataCenter.GetNumber("SilverBox", true)
                DataCenter.SetNumber("SilverBox", SilverBox + Goods.SilverBox)

                --显示部分
                GameUtils.SetImageWithAsset(ResourceSlot.Icon, "Currency", 2)
                UI:SetText({ResourceSlot.Count}, tostring(Goods.SilverBox))
                System:FireGameEvent(_GAME.Events.RefreshData, "StoreResource")
            end
        end

        --显示资源
        UI:SetVisible({GoodSlot.ID}, false)
        if Converted then
            --转化动画
            UI:SetVisible({ResourceSlot.ID, ResourceSlot.Background}, true)
             --播放翻盘动画
            UI:PlayUIAnimation(ResourceSlot.Background, 1, 0)
            --延迟显示资源和数量
            UGCS.Framework.Executor.Delay(0.2, function()
                UI:SetVisible({ResourceSlot.Count, ResourceSlot.Icon}, true)
                ExecuteShowResource()
            end)
        else
            --立即显示
            UI:SetVisible({ResourceSlot.ID, ResourceSlot.Background, ResourceSlot.Count, ResourceSlot.Icon}, true)
            ExecuteShowResource()
        end
    end
    --设置物品图标
    UI:RegisterClicked(GainView.CloseButton, function()
        UI:SetVisible({GainView.ID}, false)
        UI:StopUIAnimation(GainView.BackgroundEffect)
        if Costs.AdCoolTime then
            local NeedRecordTimestamp
            if Costs.HasCollect and Costs.MaxCollect then
                if Costs.HasCollect >= Costs.MaxCollect then
                    NeedRecordTimestamp = true
                else
                    NeedRecordTimestamp = false
                end
            else
                NeedRecordTimestamp = true
            end
            if NeedRecordTimestamp then
                Costs.ClickTimestamp = GameUtils.GetNowTimestamp()
            end
        end
        --刷新价格
        self:RefreshStore(false)
        --注销按钮事件
        UI:UnRegisterClicked(GainView.CloseButton)
    end)
end

return StoreModule