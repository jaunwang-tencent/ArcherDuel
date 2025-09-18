--对决模块
local FightModule = {}
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--段位配置
local RankInfoConfig = UGCS.Target.ArcherDuel.Config.RankInfoConfig
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
--装备详情模块
local EquipmentDetailModule = UGCS.Target.ArcherDuel.Modules.EquipmentDetailModule

--- 打开
function FightModule:Open()
    self:RegreshBodyUI()

    local FightView = UIConfig.FightView
    local CenterView = FightView and FightView.CenterView

    --广告1按钮监听
    UI:RegisterClicked(CenterView.Ad_1.ID, function()
        self:OnClickAd1()
    end)

    --广告2按钮监听
    UI:RegisterClicked(CenterView.Ad_2.ID, function()
        self:OnClickAd2()
    end)

    local score = _GAME.GameUtils.GetPlayerRankScore()
    if _GAME.GameUtils.IsReachGoldRank(score) then
        local unLock = "#FFFFFF"
        UI:SetImageColor({CenterView.Golden.ID}, unLock)
        UI:SetVisible({CenterView.Golden.Lock}, false)
        --跳转黄金联赛按钮
        UI:RegisterClicked(CenterView.Golden.ID, function()
            self:OnGolden()
        end)
    else
        local lock = "#8E8E8E"
        UI:SetImageColor({CenterView.Golden.ID}, lock)
        UI:SetVisible({CenterView.Golden.Lock}, true)
    end

    if _GAME.GameUtils.IsReachDiamondRank(score) then
        local unLock = "#FFFFFF"
        UI:SetImageColor({CenterView.Diamond.ID}, unLock)
        UI:SetVisible({CenterView.Diamond.Lock}, false)
        --跳转钻石联赛按钮
        UI:RegisterClicked(CenterView.Diamond.ID, function()
            self:OnDiamond()
        end)
    else
        local lock = "#8E8E8E"
        UI:SetImageColor({CenterView.Diamond.ID}, lock)
        UI:SetVisible({CenterView.Diamond.Lock}, true)
    end

    --七日挑战
    UI:RegisterClicked(CenterView.SevenDays.Button, function()
        self:OnSevenDays()
    end)

    local level = _GAME.GameUtils.GetRankLevelByScore(score)
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
            UI:SetVisible({CenterView.Rank.Image_1}, true)
            UI:SetVisible({CenterView.Rank.Image_2}, true)
        else
            UI:SetVisible({CenterView.Rank.Image_1}, false)
            UI:SetVisible({CenterView.Rank.Image_2}, false)
        end
    else
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
                EquipmentDetailModule:Open(Equipment)
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
    --TODO：广告
    --IAA:LetPlayerWatchAds()
end

function FightModule:OnClickAd2()
    --TODO：广告
    --IAA:LetPlayerWatchAds()
end

function FightModule:OnGolden()  --跳转黄金联赛按钮
    System:FireGameEvent(_GAME.Events.JumpModule, "Tournament")
end


function FightModule:OnDiamond()  --跳转钻石联赛按钮
    System:FireGameEvent(_GAME.Events.JumpModule, "Tournament")
end

function FightModule:OnSevenDays()  --七日挑战
    --这里打开七日挑战页面

    local day = _GAME.GameUtils.GetWeekDay() -- 获取当前是星期几

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
    if _GAME.GameUtils.CanEnterRankBattle() then
        --这里打开寻找对局页面
        --生成1到7的随机数字
        local RandomNumber = math.random(1, 6)  --随机海岛和天空
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
    if _GAME.GameUtils.CanEnterGoldBattle() then
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
    if _GAME.GameUtils.CanEnterDiamondRankBattle() then
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
        UI:SetVisible({CenterView.Rank.Image_1}, false)
        UI:SetVisible({CenterView.Rank.Image_2}, false)
    end
    DataCenter.SetTable("RankBoxReward_Table", RankBoxReward_Table)

    local OpenBoxConfig = require "Game.Target.ArcherDuel.Config.OpenBoxConfig"
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
                local equipmap = _GAME.GameUtils.GetEquipmentMap()
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
                _GAME.GameUtils.AddPlayerReward(100002, Value)
            elseif i == 3 then
                --增加金币
                _GAME.GameUtils.AddPlayerReward(100001, Value)
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
                UI:SetVisible({CheckID}, true)
                UI:SetVisible({MaskID}, true)
                UI:SetVisible({ButtonID}, false)
            else
                UI:SetVisible({CheckID}, false)
                UI:SetVisible({MaskID}, false)
                UI:SetVisible({ButtonID}, true)
                UI:UnRegisterClicked(ButtonID)
                UI:RegisterClicked(ButtonID, function (ButtonID)
                    DataCenter.SetNumber("Player_CollectTaskWeekly_Num", CollectTask | (1 << (index - 1)))
                    if index == 1 then
                        _GAME.GameUtils.AddPlayerReward(100002, 100)
                    elseif index == 2 then
                        _GAME.GameUtils.AddPlayerReward(200003, 1)
                    elseif index == 3 then
                        _GAME.GameUtils.AddPlayerReward(200002, 2)
                    elseif index == 4 then
                        _GAME.GameUtils.AddPlayerReward(200003, 2)
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
    UI:SetVisible({UIConfig.SevenDays.ID}, true)
    UI:SetVisible({UIConfig.SevenDays.DayTask.ID}, true)
    local WeeklyTaskUIID = {105077, 105084, 105091}
    local iconIDs = {105075, 105082, 105089}
    local taskMgr = UGCS.Framework.TaskManager:GetInsatnce()
    local ret = taskMgr:getAllTaskByWeekly()
    local i = 1
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
                        end
                    end
                    self:RefreshTaskProcesUI()
                    self:RefreshWeeklyTaskUI(wday)
                end)
                UI:SetVisible({Button}, false)
            elseif v.state == taskMgr.Task.State.FINISH then
                UI:SetVisible({Finish}, true)
                UI:SetVisible({Completed}, false)
                UI:SetVisible({Button}, false)
            else
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

function FightModule:RefreshTabDayUI(wday)
    for i = 1, 7, 1 do
        local flag = wday == i
        local dayObj = UIConfig.SevenDays.TabButton["Days" .. i]
        UI:SetVisible({dayObj.Unselected}, flag)
        UI:SetVisible({dayObj.Selected}, not flag)
    end
end

return FightModule