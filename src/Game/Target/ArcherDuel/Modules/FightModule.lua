--对决模块
local FightModule = {}
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--宝箱配置
local OpenBoxConfig = UGCS.Target.ArcherDuel.Config.OpenBoxConfig
--段位配置
local RankInfoConfig = UGCS.Target.ArcherDuel.Config.RankInfoConfig
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
--任务管理器
local TaskManager = UGCS.Target.ArcherDuel.Task.TaskManager
--星钻配置
local StarDiamondConfig = UGCS.Target.ArcherDuel.Config.StarDiamondConfig


System:RegisterEvent(Events.ON_PLAYER_GET_ITEM,function(playerId, itemId, num, isCustom) -- playerId = 玩家ID, itemId = 物品ID, num = 物品数量, isCustom = 是否为自制物品
    FightModule:BuySucceed(itemId)
end)

--判断是否是小程序玩家
function FightModule:IsMiniGamePlayer()
    self.isPlayer = IAA:IsWeChatMiniGamePlayer()
    if not self.isPlayer and self.Number_1 == nil then
        local elementId = System:GetScriptParentID()
        local valueArray = CustomProperty:GetCustomPropertyArray(elementId, "AppPlay", CustomProperty.PROPERTY_TYPE.Image)
        local Icon_1 = UIConfig.FightView.CenterView
        UI:SetImage({Icon_1.Ad_1.ID},valueArray[1],true) --主页宝箱广告
        UI:SetImage({Icon_1.Ad_2.ID},valueArray[2],true) --主页钻石广告
        --更换宝箱的广告图标
        local Icon_2 = UIConfig.StoreView.Activities[1].Views
        UI:SetVisible({111349,111328,111350,111322},false) --将两个宝箱广告图标关闭
        UI:SetVisible({117785,117783,117762,117736},true) --将星钻图标打开
        local BoxDiamond_1 = tostring(StarDiamondConfig.BoxDiamond.Price_1)
        local BoxDiamond_2 = tostring(StarDiamondConfig.BoxDiamond.Price_2)
        UI:SetText({Icon_2[2].ShopSlot.AdStyle.Price},BoxDiamond_1) --设置宝箱的星钻数量
        UI:SetText({Icon_2[4].ShopSlot.AdStyle.Price},BoxDiamond_2) --设置宝箱的星钻数量
        --免费钻石购买
        local FreeDiamond_Price = tostring(StarDiamondConfig.FreeDiamond.Price)
        UI:SetVisible({111334,111335},false) --关闭免费钻石中的广告图标
        UI:SetVisible({117496,117519,117809},true) --打开免费钻石的星钻图标
        UI:SetText({117519},FreeDiamond_Price) --免费钻石需要的星钻
        --更换二级界面图标
        UI:SetVisible({117451},true)
        UI:SetVisible({111295},false)
        UI:SetText({117450},FreeDiamond_Price)
        --再来一次图标
        UI:SetVisible({118934},true) --再来一局可见
        System:FireSignEvent("更换底图")
        --更换*3倍率图标
        --直接将*3倍率关闭
        UI:SetVisible({118935},false)
        --免费金币
        UI:SetVisible({111341,111340},false)
        UI:SetVisible({117954,117955},true)

        self.Judge = false
        self.Number_1 = 0
        --开局进行判断
        if  not GameUtils.IsCrossDay(DataCenter.GetNumber("Day_Coin", true)) then
            UI:SetVisible({117955},false)
            UI:SetText({117954},"领取完成")
        end
        if not GameUtils.IsCrossDay(DataCenter.GetNumber("Day_Diamond", true))  then
            UI:SetText({117854},"今日已领取")
            --设置ui不可见
            UI:SetVisible({117496}, false)
        end
 
        if not DataCenter.GetNumber("Time_DiamondPurchase", true) then
            --System:FireSignEvent("TutorialbRestart_1")
            DataCenter.SetNumber("Time_DiamondPurchase",0)
        end

    end
end

--打开星钻购买弹窗
function FightModule:StarDiamond(num,Costs1,Goods1)
    local StoreModule = require ("Game.Target.ArcherDuel.Modules.StoreModule")
    local GameMatch = require ("Match.GameMatch")
    if Costs1 and Goods1 then
        self.Costs1 = Costs1
        self.Goods1 = Goods1
    else
        self.Costs1 = {}
        self.Goods1 = {}
    end

   -- local goodsIds = Shop:GetAllGoodsInShop(1)
   --   Shop:ShowGoodsForPlayer(goodsIds[num])
   if num == 1 then
         FightModule:OnClickAd1()
   elseif num == 2 then
        FightModule:OnClickAd2()
    elseif num == 3 then
        StoreModule:BuyGood(self.Costs1, self.Goods1)
    elseif num == 4 then
        StoreModule:BuyGood(self.Costs1, self.Goods1)
    elseif num == 5 then
        StoreModule:BuyGood(self.Costs1, self.Goods1)
    elseif num == 6 then
        UI:SetVisible({118934,106511},false)
        --GameMatch:Addover("ad_reward_again", Character:GetLocalPlayerId())
    elseif num == 7 then
         GameMatch:Addover("ad_battle_again", Character:GetLocalPlayerId())
         UI:SetVisible({118934,106511},false)
  --[[  elseif num == 8 then
        local callback1 = function()
            UI:SetText({ self.Costs1.Text}, tostring(self.Goods1[2] * 3))
            UI:SetVisible({ self.Costs1.ad},false)
            self.Goods1[2] = self.Goods1[2] * 3
        end
        UGCS.Target.ArcherDuel.Modules.StoreModule:SeeAd("ad_tag_free_three_diamond", nil, false, callback1)
    elseif num == 9 then
         local callback2 = function()
                UI:SetText({self.Costs1.Text}, tostring(self.Goods1[3] * 3))
                UI:SetVisible({self.Costs1.ad},false)
                self.Goods1[3] = self.Goods1[3] * 3
        end
        UGCS.Target.ArcherDuel.Modules.StoreModule:SeeAd("ad_tag_free_three_coin", nil, false, callback2)]]
   end

end

--- 打开
function FightModule:Open(Context)
    self:RegreshBodyUI()

    local FightView = UIConfig.FightView
    local CenterView = FightView and FightView.CenterView

    --广告1按钮监听
    local Player_HasAdFreeWatchBox = DataCenter.GetNumber("Player_HasAdFreeWatchBox", true)
    if Player_HasAdFreeWatchBox == 0 then
        UI:SetVisible({CenterView.Ad_1.Mask}, false)
        UI:RegisterClicked(CenterView.Ad_1.ID, function()
             if self.Number_1 == 0 then
             --    UI:ShowMessageTip("暂时无法获取")
             --System:FireGameEvent(_GAME.Events.JumpModule, "Store")
                self:OnClickAd1()
                

            else
                self:OnClickAd1()
            end
        end)
    else
        --显示遮罩，屏蔽【广告1按钮监听】
        UI:SetVisible({CenterView.Ad_1.Mask}, true)
    end

    --广告2按钮监听
    local Player_HasAdFreeWatchDiamond = DataCenter.GetNumber("Player_HasAdFreeWatchDiamond", true)
    if Player_HasAdFreeWatchDiamond == 0 then
        UI:SetVisible({CenterView.Ad_2.Mask}, false)
        UI:RegisterClicked(CenterView.Ad_2.ID, function()
             if self.Number_1 == 0 then
                self:StarDiamond(2)
            else
                self:OnClickAd2()
            end
        end)
    else
        --显示遮罩，屏蔽【广告1按钮监听】
        UI:SetVisible({CenterView.Ad_2.Mask}, true)
    end

    local score = GameUtils.GetPlayerRankScore()
    if GameUtils.IsReachGoldRank(score) then
        local unLock = "#FFFFFF"
        UI:SetImageColor({CenterView.Golden.ID}, unLock)
        UI:SetVisible({CenterView.Golden.Lock}, false)
        --跳转黄金联赛按钮
        UI:RegisterClicked(CenterView.Golden.ID, function()
            self:OnGolden()
        end)
        --新手教程判定
        if DataCenter.GetNumber("TutorialbRestart", true) == 4 then
            System:FireSignEvent("TutorialbRestart_4")
        end
    else
        local lock = "#8E8E8E"
        UI:SetImageColor({CenterView.Golden.ID}, lock)
        UI:SetVisible({CenterView.Golden.Lock}, true)
    end

    if GameUtils.IsReachDiamondRank(score) then
        local unLock = "#FFFFFF"
        UI:SetImageColor({CenterView.Diamond.ID}, unLock)
        UI:SetVisible({CenterView.Diamond.Lock}, false)
        --跳转钻石联赛按钮
        UI:RegisterClicked(CenterView.Diamond.ID, function()
            self:OnDiamond()
        end)
        if DataCenter.GetNumber("TutorialbRestart", true) == 5 then
            System:FireSignEvent("TutorialbRestart_5")
        end
    else
        local lock = "#8E8E8E"
        UI:SetImageColor({CenterView.Diamond.ID}, lock)
        UI:SetVisible({CenterView.Diamond.Lock}, true)
    end

    --七日挑战
    UI:RegisterClicked(CenterView.SevenDays.Button, function()
        self:OnSevenDays()
    end)

    local level = GameUtils.GetRankLevelByScore(score)
    --寻找对局
    UI:SetText({CenterView.Match.Text}, string.format("%d", level.cost))
    UI:RegisterClicked(CenterView.Match.Button, function()
        self:OnMatch()
    end)

    --判断是否有可领取的段位奖励
    local RankBoxReward_Table = DataCenter.GetTable("RankBoxReward_Table", true)
    if RankBoxReward_Table then
        if #RankBoxReward_Table > 0 then
            --段位奖励
            UI:RegisterClicked(CenterView.Rank.Button, function()
                self:OnRank(RankBoxReward_Table)
            end)
            System:FireSignEvent("BoxAnimation", {Character:GetLocalPlayerId()})
            UI:SetVisible({CenterView.Rank.Image_1}, true)
            UI:SetVisible({CenterView.Rank.Image_2}, true)
        else
            System:FireSignEvent("BoxAnimationStop", {Character:GetLocalPlayerId()})
            UI:SetVisible({CenterView.Rank.Image_1}, false)
            UI:SetVisible({CenterView.Rank.Image_2}, false)
        end
    else
        System:FireSignEvent("BoxAnimationStop", {Character:GetLocalPlayerId()})
        UI:SetVisible({CenterView.Rank.Image_1}, false)
        UI:SetVisible({CenterView.Rank.Image_2}, false)
    end

    UI:RegisterClicked(101102,function()
        UI:SetVisible({UIConfig.SevenDays.ID}, false)
    end)

    local Rank = CenterView and CenterView.Rank
    if Rank then
        local list = CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Rank", CustomProperty.PROPERTY_TYPE.Image)
        if level.icon and list[level.icon] then
            UI:SetImage({Rank.Image}, list[level.icon], true)
        end
        UI:SetText({Rank.Text}, level.name)

        if RankInfoConfig[level.id + 1] then
            local value = score - level.base_score
            local max = RankInfoConfig[level.id + 1].base_score - level.base_score
            UI:SetProgressMaxValue({Rank.Progress}, max)
            UI:SetProgressCurrentValue({Rank.Progress}, value)
            UI:SetText({115394}, value .. "/" .. max)
        else
            if RankInfoConfig[level.id - 1] then
                local max = level.base_score - RankInfoConfig[level.id - 1].base_score
                UI:SetProgressMaxValue({Rank.Progress}, max)
                UI:SetProgressCurrentValue({Rank.Progress}, max)
                UI:SetText({115394}, max .. "/" .. max)
            else
                UI:SetProgressMaxValue({Rank.Progress}, 0)
                UI:SetProgressCurrentValue({Rank.Progress}, 0)
                UI:SetText({115394}, "0/0")
            end
        end

        UI:SetText({Rank.Text_1}, tostring(UGCS.Target.ArcherDuel.Config.GameConfig.FailAddScore))
        UI:SetText({Rank.Text_2}, "+" .. UGCS.Target.ArcherDuel.Config.GameConfig.VictoryAddScore)
        UI:SetText({Rank.Text_3}, tostring(level.cost * 2))
    end
end
--- 刷新
---@param DeltaTime 时间戳
function FightModule:Update(DeltaTime)
    
end

--- 关闭
function FightModule:Close()
    local FightView = UIConfig.FightView
    local CenterView = FightView and FightView.CenterView
    UI:UnRegisterClicked(CenterView.Ad_1.ID)
    UI:UnRegisterClicked(CenterView.Ad_2.ID)
    UI:UnRegisterClicked(CenterView.Golden.ID)
    UI:UnRegisterClicked(CenterView.Diamond.ID)
    UI:UnRegisterClicked(CenterView.SevenDays.Button)
    UI:UnRegisterClicked(CenterView.SevenDays.Text)
    UI:UnRegisterClicked(CenterView.Match.Button)
    UI:UnRegisterClicked(CenterView.Rank.Button)

    --注销装备槽的点击事件
    local EquipmentSlotConfig = {
        [1] = FightView.LeftView.Character,
        [2] = FightView.LeftView.Top,
        [3] = FightView.LeftView.Bottoms,
        [4] = FightView.RightView.Bow,
        [5] = FightView.RightView.Aex,
        [6] = FightView.RightView.Spear,
    }
    for _, EquipmentSlot in ipairs(EquipmentSlotConfig) do
         --先注销点击事件
         UI:UnRegisterClicked(EquipmentSlot.Image)
    end
    for i = 1, 7, 1 do
        local dayObj = UIConfig.SevenDays.TabButton["Days" .. i]
        UI:UnRegisterClicked(dayObj.Selected)
    end

    for index = 1, 4, 1 do
        local ButtonID = UIConfig.SevenDays.TaskProgress.Button[index]
        UI:UnRegisterClicked(ButtonID)
    end

    local WeeklyTaskUIID = {105077, 105084, 105091}
    for k, v in pairs(WeeklyTaskUIID) do
        local Completed = UI:FindChildWithIndex(v,2) -- 领奖
        local Button = UI:FindChildWithIndex(v,3) -- 前往按钮
        UI:UnRegisterClicked(Completed)
        UI:UnRegisterClicked(Button)
    end

    UI:UnRegisterClicked(UIConfig.BoxView.ThreeItem.ItemGroup[2].AdButton)
    UI:UnRegisterClicked(UIConfig.BoxView.ThreeItem.ItemGroup[3].AdButton)
end

--- 刷新身体上的数据
function FightModule:RegreshBodyUI()
    local FightView = UIConfig.FightView
    --角色身上的装备
    local EquipmentSlotConfig = {
        [1] = FightView.LeftView.Character,
        [2] = FightView.LeftView.Top,
        [3] = FightView.LeftView.Bottoms,
        [4] = FightView.RightView.Bow,
        [5] = FightView.RightView.Aex,
        [6] = FightView.RightView.Spear,
    }
    local BodyEquipment = DataCenter.Get("BodyEquipment")
    for Category, EquipmentSlot in ipairs(EquipmentSlotConfig) do
         --先注销点击事件
         UI:UnRegisterClicked(EquipmentSlot.Image)
        local Equipment = BodyEquipment[Category]
        if Equipment then
             --点击装备事件
             UI:RegisterClicked(EquipmentSlot.Image, function()
                --装备详情模块
                UGCS.Target.ArcherDuel.Modules.EquipmentModule:OpenDetail(Equipment)
            end)
            --设置等级
            UI:SetText({EquipmentSlot.Label}, string.format("等级%d", Equipment.Level))
            --图标
            GameUtils.SetImageWithEquipment(EquipmentSlot.Image, Equipment)
            --装备品质底图
            local Attributes = EquipmentConfig[Equipment.ID].Attributes
            GameUtils.SetImageWithAsset(EquipmentSlot.Background, "EquipmentImage", Attributes.Grade)
            UI:SetVisible({EquipmentSlot.EmptyImage}, false)
        else
            --没有装备则清空
            UI:SetVisible({EquipmentSlot.Label, EquipmentSlot.Image}, false)
            UI:SetVisible({EquipmentSlot.EmptyImage}, true)
        end
    end
end

function FightModule:OnClickAd1()
    --看广告获得宝箱
    local Costs = {
        AdTag = "ad_tag_free_box"
    }
    local Goods = {
        BoxID = 200001
    }
    local Ad_1 = UIConfig.FightView.CenterView.Ad_1
    UGCS.Target.ArcherDuel.Modules.StoreModule:SeeAd(Costs, Goods, true, function()
        DataCenter.SetNumber("Player_HasAdFreeWatchBox", 1)
        UI:UnRegisterClicked(Ad_1.ID)
        --显示遮罩，屏蔽【广告1按钮监听】
        UI:SetVisible({Ad_1.Mask}, true)
    end)
end

function FightModule:OnClickAd2()
    --看广告获得砖石
    local Costs = {
        AdTag = "ad_tag_free_diamond"
    }
    local Goods = {
        Diamond = 60
    }
    local Ad_2 = UIConfig.FightView.CenterView.Ad_2
    UGCS.Target.ArcherDuel.Modules.StoreModule:SeeAd(Costs, Goods, true, function()
        DataCenter.SetNumber("Player_HasAdFreeWatchDiamond", 1)
        UI:UnRegisterClicked(Ad_2.ID)
        --显示遮罩，屏蔽【广告2按钮监听】
        UI:SetVisible({Ad_2.Mask}, true)
    end)
end

function FightModule:OnGolden()  --跳转黄金联赛按钮

    System:FireGameEvent(_GAME.Events.JumpModule, "Tournament", "Golden")
    if DataCenter.GetNumber("TutorialbRestart", true) == 4 then
        System:FireSignEvent("TutorialbRestart_4_Off")
        DataCenter.SetNumber("TutorialbRestart", 5)
    end
end


function FightModule:OnDiamond()  --跳转钻石联赛按钮
    System:FireGameEvent(_GAME.Events.JumpModule, "Tournament", "Diamond")
    if DataCenter.GetNumber("TutorialbRestart", true) == 5 then
        System:FireSignEvent("TutorialbRestart_5_Off")
        DataCenter.SetNumber("TutorialbRestart", 6)
    end
end

function FightModule:OnSevenDays()  --七日挑战
    --这里打开七日挑战页面
    if DataCenter.GetNumber("TutorialbRestart", true) == 3 then
        DataCenter.SetNumber("TutorialbRestart", 4)
        System:FireSignEvent("TutorialbRestart_3_Off")
        System:FireSignEvent("七日挑战逻辑")
    end


    UI:SetVisible({UIConfig.SevenDays.ID}, true)

    local day = GameUtils.GetWeekDay() -- 获取当前是星期几

    -- 周活跃进度 UI begin
    self:RefreshTaskProcesUI()
    -- 周活跃进度 UI end

    -- 周任务 UI begin
    self:RefreshWeeklyTaskUI(day)
    -- 周任务 UI end

    -- 每天切页按钮 UI begin
    local dayLock = {0, 111213, 111214, 111215, 111218, 111216, 111219}
    for i = 1, 7, 1 do
        local flag = day == i
        local dayObj = UIConfig.SevenDays.TabButton["Days" .. i]
        UI:SetVisible({dayObj.Unselected}, flag)
        UI:SetVisible({dayObj.Selected}, not flag)
        if i <= day then
            UI:SetVisible({dayLock[i]}, false)
            UI:SetImageColor({dayObj.Selected}, dayObj.OnLock)
            UI:UnRegisterClicked(dayObj.Selected)
            UI:RegisterClicked(dayObj.Selected, function(UIID)
                Log:PrintLog("点击的是第" .. i .. "天")
                self:RefreshWeeklyTaskUI(i)
                self:RefreshTabDayUI(i)
            end)
        else
            UI:SetVisible({dayLock[i]}, true)
            UI:SetImageColor({dayObj.Selected}, dayObj.Lock)
        end
    end
    -- 每天切页按钮 UI end
end

function FightModule:OnMatch()

    if GameUtils.CanEnterRankBattle() then
        if DataCenter.GetNumber("TutorialbRestart", true) == 1 then
            System:FireSignEvent("TutorialbRestart_1_Off")
        end
        --这里打开寻找对局页面
        --生成1到7的随机数字
        local RandomNumber =  math.random(1, 6)  --随机海岛和天空
        -- if RandomNumber == 7 then
        --     RandomNumber = 8
        -- end
        --这里要关闭所有页面
        UI:SetVisible({UIConfig.MainView.TitleBar.ID,
            UIConfig.MainView.StoreResourceBar.ID,
            UIConfig.MainView.GeneralResourceBar.ID,
            UIConfig.FightView.CenterView.ID,
            UIConfig.FightView.LeftView.ID,
            UIConfig.FightView.RightView.ID
        }, false)
        System:FireSignEvent(tostring(RandomNumber))
        DataCenter.SetNumber("BattleStage", RandomNumber)
    end
end

function FightModule:OnGoldMatch()
    if GameUtils.CanEnterGoldBattle() then
        --这里要关闭所有页面
        UI:SetVisible({UIConfig.MainView.TitleBar.ID,
            UIConfig.MainView.StoreResourceBar.ID,
            UIConfig.MainView.GeneralResourceBar.ID,
            UIConfig.FightView.CenterView.ID,
            UIConfig.FightView.LeftView.ID,
            UIConfig.FightView.RightView.ID
        }, false)
        System:FireSignEvent(tostring(7))
        DataCenter.SetNumber("BattleStage", 7)
    end
end

function FightModule:OnDiamondMatch()
    if GameUtils.CanEnterDiamondRankBattle() then
        --这里要关闭所有页面
        UI:SetVisible({UIConfig.MainView.TitleBar.ID,
            UIConfig.MainView.StoreResourceBar.ID,
            UIConfig.MainView.GeneralResourceBar.ID,
            UIConfig.FightView.CenterView.ID,
            UIConfig.FightView.LeftView.ID,
            UIConfig.FightView.RightView.ID
        }, false)
        System:FireSignEvent(tostring(8))
        DataCenter.SetNumber("BattleStage", 8)
    end
end

function FightModule:OnRank(RankBoxReward_Table)
    --这里打开段位奖励随机奖励
    table.remove(RankBoxReward_Table, 1)
    if RankBoxReward_Table and #RankBoxReward_Table == 0 then
        local FightView = UIConfig.FightView
        local CenterView = FightView and FightView.CenterView
        UI:UnRegisterClicked(CenterView.Rank.Button)
        System:FireSignEvent("BoxAnimationStop", {Character:GetLocalPlayerId()})
        UI:SetVisible({CenterView.Rank.Image_1}, false)
        UI:SetVisible({CenterView.Rank.Image_2}, false)
    end
    DataCenter.SetTable("RankBoxReward_Table", RankBoxReward_Table)

    math.randomseed(TimerManager:GetClock())
    local Weight = 0

    --随机获取一件装备
    for _, v in ipairs(OpenBoxConfig.RankBox[1]) do
        Weight = Weight + v.Weight
    end
    local function GetOneReward()
        -- 先随品阶
        -- 再随装备
        local random = math.random(1, Weight)
        local tempWeight = 0
        for _, v in ipairs(OpenBoxConfig.RankBox[1]) do
            tempWeight = tempWeight + v.Weight
            if random <= tempWeight then
                local equipmap = GameUtils.GetEquipmentMap()
                local equipIds = equipmap[v.Grade]
                if equipIds then
                    return equipIds[math.random(1, #equipIds)]
                end
            end
        end
    end

    Weight = 0
    --随机获取钻石数量
    for _, v in ipairs(OpenBoxConfig.RankBox[2]) do
        Weight = Weight + v.Weight
    end
    local function GetDiamondCount()
        local random = math.random(1, Weight)
        local tempWeight = 0
        for _, v in ipairs(OpenBoxConfig.RankBox[2]) do
            tempWeight = tempWeight + v.Weight
            if random <= tempWeight then
                return v.Count
            end
        end
    end

    Weight = 0
    --随机获取黄金数量
    for _, v in ipairs(OpenBoxConfig.RankBox[2]) do
        Weight = Weight + v.Weight
    end
    local function GetGoldCount()
        local random = math.random(1, Weight)
        local tempWeight = 0
        for _, v in ipairs(OpenBoxConfig.RankBox[2]) do
            tempWeight = tempWeight + v.Weight
            if random <= tempWeight then
                return v.Count
            end
        end
    end

    local ThreeItem = UIConfig.BoxView.ThreeItem
    --显示装备按钮
    UI:SetVisible({ThreeItem.ID, ThreeItem.ItemGroupID}, true)

    --开宝箱表演
    local TargetBoxID
    for _, Perform in ipairs(ThreeItem.PerformGroup) do
        if 200001 == Perform.ResourceID then
            UI:SetVisible({Perform.ID}, true)
            TargetBoxID = Perform.ID
        else
            UI:SetVisible({Perform.ID}, false)
        end
    end

    --装备展示
    for _, Item in ipairs(ThreeItem.ItemGroup) do
        UI:SetVisible({Item.Icon, Item.Background, Item.Text}, false)
    end
    local BoxRewards = {GetOneReward(), GetDiamondCount(), GetGoldCount()}
    Log:PrintDebug("BoxRewards: " .. BoxRewards[1] .. ", " .. BoxRewards[2] .. ", " .. BoxRewards[3])
    UI:SetVisible({ThreeItem.Button.ID, ThreeItem.Button.Icon, ThreeItem.Button.Text},false)

    UGCS.Framework.Executor.Delay(2.3, function ()
        for RewardIndex, Value in ipairs(BoxRewards) do
            if RewardIndex == 1 then
                local EquipmentData = EquipmentConfig[Value]
                local BoxItem = ThreeItem.ItemGroup[RewardIndex]
                UI:SetVisible({BoxItem.Icon, BoxItem.Background}, true)
                GameUtils.SetImageWithAsset(BoxItem.Icon, EquipmentData.AssetName, EquipmentData.AssetIndex)
                GameUtils.SetImageWithAsset(BoxItem.Background, "EquipmentImage", EquipmentData.Attributes.Grade)
            elseif RewardIndex == 2 then
                local BoxItem = ThreeItem.ItemGroup[RewardIndex]
                UI:SetVisible({BoxItem.Icon, BoxItem.Background}, true)
                GameUtils.SetImageWithAsset(BoxItem.Icon, "Currency", 6)
                GameUtils.SetImageWithAsset(BoxItem.Background, "EquipmentImage", 1)
                UI:SetText({BoxItem.Text}, tostring(Value))
            elseif RewardIndex == 3 then
                local BoxItem = ThreeItem.ItemGroup[RewardIndex]
                UI:SetVisible({BoxItem.Icon, BoxItem.Background}, true)
                GameUtils.SetImageWithAsset(BoxItem.Icon, "Currency", 4)
                GameUtils.SetImageWithAsset(BoxItem.Background, "EquipmentImage", 1)
                UI:SetText({BoxItem.Text}, tostring(Value))
            end
        end
        UI:PlayUIAnimation(ThreeItem.ItemGroupID, 1, 0)
        --暂停特效播放
        UGCS.Framework.Executor.Delay(0.7, function()
            if TargetBoxID then
                UI:EffectPausePlay(TargetBoxID)
            end
        end)
        --播到1.6秒暂停播放
        UGCS.Framework.Executor.Delay(1.6, function()
            UI:PauseUIAnimation(ThreeItem.ItemGroupID, 1)
            --当表演完成之后才显示领取按钮
            UGCS.Framework.Executor.Delay(0.5, function()
                UI:SetVisible({ThreeItem.Button.ID, ThreeItem.Button.Icon, ThreeItem.Button.Text},true)
                UI:SetVisible({ThreeItem.ItemGroup[2].Text, ThreeItem.ItemGroup[3].Text},true)
                UI:SetVisible({ThreeItem.ItemGroup[2].ad, ThreeItem.ItemGroup[3].ad},true)
                UI:RegisterClicked(ThreeItem.ItemGroup[2].AdButton,function()
                    Log:PrintLog("看广告获取钻石数量" .. BoxRewards[2])
                    local callback = function()
                        local BoxItem = ThreeItem.ItemGroup[2]
                        UI:SetText({BoxItem.Text}, tostring(BoxRewards[2] * 3))
                        UI:SetVisible({BoxItem.ad},false)
                        BoxRewards[2] = BoxRewards[2] * 3
                    end

                    local Costs = {
                        AdTag = "ad_tag_free_three_diamond"
                    }
                    if self.isPlayer then
                        UGCS.Target.ArcherDuel.Modules.StoreModule:SeeAd(Costs, nil, false, callback)
                    else
                        self:StarDiamond(8,ThreeItem.ItemGroup[2],BoxRewards)
                    end
                end)
                UI:RegisterClicked(ThreeItem.ItemGroup[3].AdButton,function()
                    Log:PrintLog("看广告获取黄金数量" .. BoxRewards[3])
                    local callback = function()
                        local BoxItem = ThreeItem.ItemGroup[3]
                        UI:SetText({BoxItem.Text}, tostring(BoxRewards[3] * 3))
                        UI:SetVisible({BoxItem.ad},false)
                        BoxRewards[3] = BoxRewards[3] * 3
                    end

                    local Costs = {
                        AdTag = "ad_tag_free_three_coin"
                    }
                    if self.isPlayer then
                        UGCS.Target.ArcherDuel.Modules.StoreModule:SeeAd(Costs, nil, false, callback)
                    else
                        self:StarDiamond(9,ThreeItem.ItemGroup[3],BoxRewards)
                    end
                end)
            end)
        end)
    end)

    --注册领取事件
    UI:RegisterClicked(ThreeItem.Button.ID, function ()
        --获取装备
        local AllEquipment = DataCenter.GetTable("AllEquipment")
        for i, Value in pairs(BoxRewards) do
            if i == 1 then
                local TargetEquipment = AllEquipment[Value]
                if TargetEquipment.Unlock then
                    --累加碎片
                    TargetEquipment.Piece = TargetEquipment.Piece + 1
                else
                    --解锁
                    TargetEquipment.Unlock = true
                end
            elseif i == 2 then
                --增加钻石
                GameUtils.AddPlayerReward(100002, Value)
            elseif i == 3 then
                --增加金币
                GameUtils.AddPlayerReward(100001, Value)
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

        for _, Perform in ipairs(ThreeItem.PerformGroup) do
            UI:SetVisible({Perform.ID}, false)
        end
        UI:SetVisible({ThreeItem.Button.ID, ThreeItem.Button.Icon, ThreeItem.Button.Text},false)
        UI:SetVisible({ThreeItem.ItemGroup[1].Text, ThreeItem.ItemGroup[2].Text, ThreeItem.ItemGroup[3].Text},false)
        UI:SetVisible({ThreeItem.ItemGroup[2].ad, ThreeItem.ItemGroup[3].ad},false)

        --注销事件
        UI:UnRegisterClicked(ThreeItem.Button.ID)
    end)
end

function FightModule:RefreshTaskProcesUI()
    local TaskExp = DataCenter.GetNumber("Player_TaskWeeklyExp_Num")
    local CollectTask = DataCenter.GetNumber("Player_CollectTaskWeekly_Num")
    --local TaskExp = 5
    --local CollectTask = 1
    local winningPoints = {5, 10, 15, 20}
    local TaskProcesID  = UIConfig.SevenDays.TaskProgress.Progress
    for index = 1, 4, 1 do
        local NodeID = UIConfig.SevenDays.TaskProgress.Image[index]
        local LockID = UIConfig.SevenDays.TaskProgress.Lock[index]
        local CheckID = UIConfig.SevenDays.TaskProgress.Check[index]
        local ButtonID = UIConfig.SevenDays.TaskProgress.Button[index]
        local MaskID = UIConfig.SevenDays.TaskProgress.Mask[index]
        if TaskExp >= winningPoints[index] then
            UI:SetVisible({NodeID}, true)
            UI:SetVisible({LockID}, false)
            if (CollectTask & (1 << (index - 1))) ~= 0 then
                --已经领取奖品
                UI:SetVisible({NodeID}, false)
                UI:SetVisible({CheckID}, true)
                UI:SetVisible({MaskID}, true)
                UI:SetVisible({ButtonID},true)
            else
                UI:SetVisible({CheckID}, false)
                UI:SetVisible({MaskID}, false)
                UI:SetVisible({ButtonID}, true)
                UI:UnRegisterClicked(ButtonID)
                UI:RegisterClicked(ButtonID, function (ButtonID)
                    DataCenter.SetNumber("Player_CollectTaskWeekly_Num", CollectTask | (1 << (index - 1)))
                    if index == 1 then
                        GameUtils.AddPlayerReward(100002, 100)
                    elseif index == 2 then
                        GameUtils.AddPlayerReward(200003, 1)
                    elseif index == 3 then
                        GameUtils.AddPlayerReward(200002, 2)
                    elseif index == 4 then
                        GameUtils.AddPlayerReward(200003, 2)
                    end
                    self:RefreshTaskProcesUI()
                end)
            end
        else
            UI:SetVisible({NodeID}, false)
            UI:SetVisible({LockID}, true)
            UI:SetVisible({CheckID}, false)
            UI:SetVisible({MaskID}, false)
            UI:SetVisible({ButtonID}, true)
        end
    end
    UI:SetProgressMaxValue({TaskProcesID}, 100)
    UI:SetProgressCurrentValue({TaskProcesID}, TaskExp / 20 * 100)
    UI:SetText({UIConfig.SevenDays.Progress}, "进度:" .. TaskExp .. "/" .. 20)
end

function FightModule:RefreshWeeklyTaskUI(wday)
    UI:SetVisible({UIConfig.SevenDays.DayTask.ID}, true)
    local WeeklyTaskUIID = {105077, 105084, 105091}
    local iconIDs = {105075, 105082, 105089}
    local taskMgr =TaskManager:GetInsatnce()
    local ret = taskMgr:getAllTaskByWeekly()
    local i = 1
   -- Log:PrintTable(ret)
    for _, v in pairs(ret) do
        if v.conditions and v.conditions[1] and v.conditions[1].wday == wday then
            local UIID = WeeklyTaskUIID[i]
            UI:SetVisible({UIID}, true)
            local ExpText = UI:FindChildWithIndex(UIID,4) -- 活跃值
            local Name = UI:FindChildWithIndex(UIID,5) -- 名字
            local Finish = UI:FindChildWithIndex(UIID,1) -- 已完成
            local Completed = UI:FindChildWithIndex(UIID,2) -- 领奖
            local Button = UI:FindChildWithIndex(UIID,3) -- 前往按钮
            local Progress = UI:FindChildWithIndex(UIID,8) -- 进度
            UI:SetText({Name}, v.name)
            if v.state == taskMgr.Task.State.COMPLETED then
                UI:SetVisible({Finish}, false)
                UI:SetVisible({Completed}, true)
                UI:UnRegisterClicked(Completed)
                UI:RegisterClicked(Completed,function (ItemUID)
                    local finishTaskRet = taskMgr:finishTask(v.id)
                    if finishTaskRet == true then
                        local taskExp = DataCenter.GetNumber("Player_TaskWeeklyExp_Num")
                        if v.rewards and v.rewards.WeeklyExp then
                            DataCenter.SetNumber("Player_TaskWeeklyExp_Num", taskExp + v.rewards.WeeklyExp)
                            self:Daysprize(v.rewards.RewardId,v.rewards.RewardCount)
                        end
                    end
                    self:RefreshTaskProcesUI()
                    self:RefreshWeeklyTaskUI(wday)
                    Log:PrintDebug("[领取任务奖励成功]"..wday)
                end)
                UI:SetVisible({Button}, false)
            elseif v.state == taskMgr.Task.State.FINISH then
                UI:SetVisible({Finish}, true)
                UI:SetVisible({Completed}, false)
                UI:SetVisible({Button}, false)
            else
                UI:UnRegisterClicked(Button)
                UI:RegisterClicked(Button,function (ItemUID)
                    local cfg = UGCS.Target.ArcherDuel.Task.TaskPool.taskcfg[v.id]
                    if cfg and cfg.taskgo then
                        local goObj = taskMgr.Task.TaskGo[cfg.taskgo]
                        local score = GameUtils.GetPlayerRankScore()
                        if goObj.SubTab == "Golden" then
                            if GameUtils.IsReachGoldRank(score) then
                                System:FireGameEvent(_GAME.Events.JumpModule, goObj.GoTab, goObj.SubTab)
                                UI:SetVisible({UIConfig.SevenDays.ID}, false)
                            else
                                UI:ShowMessageTip("达到黄金段位，才能进入黄金赛")
                            end
                        elseif goObj.SubTab == "Diamond" then
                            if GameUtils.IsReachDiamondRank(score) then
                                System:FireGameEvent(_GAME.Events.JumpModule, goObj.GoTab, goObj.SubTab)
                                UI:SetVisible({UIConfig.SevenDays.ID}, false)
                            else
                                UI:ShowMessageTip("达到钻石段位，才能进入钻石赛")
                            end
                        else
                            System:FireGameEvent(_GAME.Events.JumpModule, goObj.GoTab, goObj.SubTab)
                            UI:SetVisible({UIConfig.SevenDays.ID}, false)
                        end
                    end
                end)
                UI:SetVisible({Finish}, false)
                UI:SetVisible({Completed}, false)
                UI:SetVisible({Button}, true)
            end
            local _, current, max = v:getProgressNumer()
            UI:SetProgressMaxValue({Progress}, max)
            UI:SetProgressCurrentValue({Progress}, current)
            if v.rewards and v.rewards.RewardId then
                local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[v.rewards.RewardId]
                GameUtils.SetImageWithAsset(iconIDs[i], "Currency", cfg.iconIndex)
                UI:SetText({ExpText}, tostring(v.rewards.RewardCount))
            end
            i = i + 1
        end
    end
end
-- 金币 100001
-- 钻石 100002
-- 普通宝箱 200001
-- 高级宝箱 200002
-- 极品宝箱 200003

function FightModule:Daysprize(RewardId,RewardCount)
GameUtils.AddPlayerReward(RewardId,RewardCount)
self:RefreshTaskProcesUI()
end

function FightModule:RefreshTabDayUI(wday)
    for i = 1, 7, 1 do
        local flag = wday == i
        local dayObj = UIConfig.SevenDays.TabButton["Days" .. i]
        UI:SetVisible({dayObj.Unselected}, flag)
        UI:SetVisible({dayObj.Selected}, not flag)
    end
end

return FightModule