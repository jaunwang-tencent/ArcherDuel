--对决模块
local FightModule = {}
--段位配置
local RankInfoConfig = UGCS.Target.ArcherDuel.Config.RankInfoConfig
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig

--- 打开
---@param PlayerData 玩家数据
function FightModule:Open(PlayerData)
    --寄存玩家数据
    self.PlayerData = PlayerData

    self:RegreshBodyUI()
    local HomeView = UIConfig.HomeView
    local CenterView = HomeView and HomeView.CenterView

    --广告按钮监听
    UI:RegisterPressed(CenterView.Ad_1.ID, function()
        self:OnClickAd1()
    end)

    UI:RegisterPressed(CenterView.Ad_2.ID, function()
        self:OnClickAd2()
    end)

    UI:RegisterPressed(CenterView.Golden.ID, function() --跳转黄金联赛按钮
        self:OnGolden()
    end)

    UI:RegisterPressed(CenterView.Diamond.ID, function() --跳转钻石联赛按钮
        self:OnDiamond()
    end)

    UI:RegisterPressed(CenterView.SevenDays.Button, function()  --七日挑战
        self:OnSevenDays()
    end)

    UI:RegisterPressed(CenterView.Match.Button, function()  -- 寻找对局
        self:OnMatch()
    end)
    UI:RegisterPressed(CenterView.Rank.Button, function() --段位奖励
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
            UI:SetProgressCurrentValue({Rank.Progress}, BattlePoints - level.base_score)
            UI:SetProgressMaxValue({Rank.Progress}, RankInfoConfig[level.id + 1].base_score)
        else
            UI:SetProgressCurrentValue({Rank.Progress}, BattlePoints)
            UI:SetProgressMaxValue({Rank.Progress}, BattlePoints)
        end
    end


end

--- 刷新
---@param DeltaTime 时间戳
function FightModule:Update(DeltaTime)
    
end

--- 关闭
function FightModule:Close()
    local HomeView = UIConfig.HomeView
    local CenterView = HomeView and HomeView.CenterView
    UI:UnRegisterPressed(CenterView.Ad_1.ID)
    UI:UnRegisterPressed(CenterView.Ad_2.ID)
    UI:UnRegisterPressed(CenterView.Golden.ID)
    UI:UnRegisterPressed(CenterView.Diamond.ID)
    UI:UnRegisterPressed(CenterView.SevenDays.Button)
    UI:UnRegisterPressed(CenterView.SevenDays.Text)
    UI:UnRegisterPressed(CenterView.Match.Button)
    UI:UnRegisterPressed(CenterView.Rank.Button)
    self.PlayerData = nil
end

--- 刷新图标
---@param IconUI 图标资源
---@param Index 图标索引
function FightModule:RefreshIcon(IconUI, Equipment)
    local EquipmentData = EquipmentConfig[Equipment.ID]
    local AssetName = EquipmentData.AssetName or "weapon_icon"
    local AssetIndex = EquipmentData.AssetIndex or EquipmentData.ID
    local ElementId = System:GetScriptParentID()

    local IconIdArray = CustomProperty:GetCustomPropertyArray(ElementId, AssetName, CustomProperty.PROPERTY_TYPE.Image)
    local IconId = IconIdArray[AssetIndex]
    UI:SetImage({IconUI}, IconId, true)
end

--- 刷新身体上的数据
function FightModule:RegreshBodyUI()
    local HomeView = UIConfig.HomeView
    local PlayerData = self.PlayerData
    --角色身上的装备
    local EquipmentSlotConfig = {
        [1] = HomeView.LeftView.Character,
        [2] = HomeView.LeftView.Top,
        [3] = HomeView.LeftView.Bottoms,
        [4] = HomeView.RightView.Bow,
        [5] = HomeView.RightView.Aex,
        [6] = HomeView.RightView.Spear,
    }
    local BodyEquipment = PlayerData.BodyEquipment
    for Category, EquipmentSlot in ipairs(EquipmentSlotConfig) do
        local Equipment = BodyEquipment[Category]
        if Equipment then
            --设置等级
            UI:SetText({EquipmentSlot.Label}, string.format("等级%d", Equipment.Level))
            --图标
            self:RefreshIcon(EquipmentSlot.Image, Equipment)
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
    local TaskExp = self.PlayerData.BaseData.Player_TaskWeeklyExp_Num
    local CollectTask = self.PlayerData.BaseData.Player_CollectTask_Num
    --local TaskExp = 5
    --local CollectTask = 1
    local winningPoints = {5, 10, 15, 20}
    local TaskProcesID  = UIConfig.SevenDays.TaskProgress.Progress
    for index = 1, 4, 1 do
        local NodeID = UIConfig.SevenDays.TaskProgress.Node[index]
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
                    --self.PlayerData.BaseData.Player_CollectTask_Num = self.PlayerData.BaseData.Player_CollectTask_Num | (1 << (index - 1))
                    --self:RefreshTaskProcesUI()
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
    UI:SetProgressCurrentValue({TaskProcesID}, TaskExp / 20 * 100)
    UI:SetProgressMaxValue({TaskProcesID}, 100)
    UI:SetText({UIConfig.SevenDays.Progress}, "进度:" .. TaskExp .. "/" .. 20)

    UI:SetVisible({UIConfig.SevenDays.ID}, true)
    UI:SetVisible({UIConfig.SevenDays.DayTask.ID}, true)    
    local WeeklyTaskUIID = {105077, 105084, 105091}
    local taskMgr = UGCS.Framework.TaskManager:GetInsatnce()
    local ret = taskMgr:getAllTaskByWeekly()
    local i = 1
    for _, v in pairs(ret) do
        local UIID = WeeklyTaskUIID[i]
        UI:SetVisible({UIID}, true)
        local ExpText = UI:FindChildWithIndex(UIID,1) -- 活跃值
        local Name = UI:FindChildWithIndex(UIID,2) -- 名字
        local Progress = UI:FindChildWithIndex(UIID,7) -- 进度
        UI:SetText({ExpText}, tostring(v.rewards.WeeklyExp))
        UI:SetText({Name}, v.name)
        local _, current, max = v:getProgressNumer()
        UI:SetProgressCurrentValue({Progress}, current)
        UI:SetProgressMaxValue({Progress}, max)
        i = i + 1
    end
end

function FightModule:OnMatch()
  --这里打开寻找对局页面
  -- 生成 1 到 7 的随机数字
  local randomNumber = math.random(1, 7)  --随机海岛和天空
  if randomNumber == 7 then
      randomNumber = 8
  end
  --这里要关闭所有页面
  UI:SetVisible({UIConfig.MainView.TitleBar.ID,UIConfig.MainView.StoreResourceBar.ID,UIConfig.MainView.GeneralResourceBar.ID,UIConfig.HomeView.CenterView.ID,UIConfig.HomeView.LeftView.ID,UIConfig.HomeView.RightView.ID}, false)
  System:FireSignEvent(tostring(randomNumber))
  Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.Number, "BattleStage", randomNumber)
end

function FightModule:OnRank()
    --这里打开段位奖励随机奖励
end

return FightModule