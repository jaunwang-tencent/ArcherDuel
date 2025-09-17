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
--装备详情模块
local EquipmentDetailModule = UGCS.Target.ArcherDuel.Modules.EquipmentDetailModule

--- 打开
---@param PlayerData 玩家数据
function FightModule:Open(PlayerData)
    --寄存玩家数据
    self.PlayerData = PlayerData

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

    --跳转黄金联赛按钮
    UI:RegisterClicked(CenterView.Golden.ID, function()
        self:OnGolden()
    end)

    --跳转钻石联赛按钮
    UI:RegisterClicked(CenterView.Diamond.ID, function() 
        self:OnDiamond()
    end)

    --七日挑战
    UI:RegisterClicked(CenterView.SevenDays.Button, function()
        self:OnSevenDays()
    end)

    --寻找对局
    UI:SetText({CenterView.Match.Text}, string.format("%d", PlayerData.BaseData.Coin))
    UI:RegisterClicked(CenterView.Match.Button, function()
        self:OnMatch()
    end)

    --段位奖励
    UI:RegisterClicked(CenterView.Rank.Button, function()
        self:OnRank()
    end)
    UI:RegisterClicked(101102,function()
        UI:SetVisible({UIConfig.SevenDays.ID}, false)
    end) 

    local Rank = CenterView and CenterView.Rank
    if Rank then
        local list = CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Rank", CustomProperty.PROPERTY_TYPE.Image)
        local BattlePoints = PlayerData.BaseData["Player_BattlePoints_Num"]
        local level = _GAME.GameUtils.GetRankLevelByScore(BattlePoints)
        if level.icon and list[level.icon] then
            UI:SetImage({Rank.Image}, list[level.icon], true)
        end
        UI:SetText({Rank.Text}, level.name)

        if RankInfoConfig[level.id + 1] then
            UI:SetProgressMaxValue({Rank.Progress}, RankInfoConfig[level.id + 1].base_score)
            UI:SetProgressCurrentValue({Rank.Progress}, BattlePoints - level.base_score)
        else
            UI:SetProgressMaxValue({Rank.Progress}, BattlePoints)
            UI:SetProgressCurrentValue({Rank.Progress}, BattlePoints)
        end
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
    
    self.PlayerData = nil
end

--- 刷新身体上的数据
function FightModule:RegreshBodyUI()
    local FightView = UIConfig.FightView
    local PlayerData = self.PlayerData
    --角色身上的装备
    local EquipmentSlotConfig = {
        [1] = FightView.LeftView.Character,
        [2] = FightView.LeftView.Top,
        [3] = FightView.LeftView.Bottoms,
        [4] = FightView.RightView.Bow,
        [5] = FightView.RightView.Aex,
        [6] = FightView.RightView.Spear,
    }
    local BodyEquipment = PlayerData.BodyEquipment
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
        local RandomNumber = math.random(1, 7)  --随机海岛和天空
        if RandomNumber == 7 then
            RandomNumber = 8
        end
        --这里要关闭所有页面
        UI:SetVisible({UIConfig.MainView.TitleBar.ID,
            UIConfig.MainView.StoreResourceBar.ID,
            UIConfig.MainView.GeneralResourceBar.ID,
            UIConfig.FightView.CenterView.ID,
            UIConfig.FightView.LeftView.ID,
            UIConfig.FightView.RightView.ID
        }, false)
        System:FireSignEvent(tostring(RandomNumber))
        Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.Number, "BattleStage", RandomNumber)
    end
end

function FightModule:OnRank()
    --这里打开段位奖励随机奖励
end

function FightModule:RefreshTaskProcesUI()
    local TaskExp = self.PlayerData.BaseData.Player_TaskWeeklyExp_Num
    local CollectTask = self.PlayerData.BaseData.Player_CollectTaskWeekly_Num
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
                    self.PlayerData.BaseData.Player_CollectTaskWeekly_Num = self.PlayerData.BaseData.Player_CollectTaskWeekly_Num | (1 << (index - 1))
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
            UI:SetText({ExpText}, tostring(v.rewards.WeeklyExp))
            UI:SetText({Name}, v.name)
            if v.state == taskMgr.Task.State.COMPLETED then
                UI:SetVisible({Finish}, false)
                UI:SetVisible({Completed}, true)
                UI:UnRegisterClicked(Completed)
                UI:RegisterClicked(Completed,function (ItemUID)
                    local finishTaskRet = taskMgr:finishTask(v.id)
                    if finishTaskRet == true then
                        local taskExp = self.PlayerData.BaseData.Player_TaskWeeklyExp_Num
                        if v.rewards and v.rewards.WeeklyExp then
                            self.PlayerData.BaseData.Player_TaskWeeklyExp_Num = taskExp + v.rewards.WeeklyExp
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