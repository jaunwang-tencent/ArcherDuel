--对决模块
local FightModule = {}
--段位配置
local RankInfoConfig = UGCS.Target.ArcherDuel.Config.RankInfoConfig
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig

--- 打开
---@param PlayerData 玩家数据
function FightModule:Open(PlayerData)
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

    local function getLevelByScore(levels, score)
        -- 假设 levels 已按照 base_score 升序排列
        local prev_level = levels[1]
        for i = 2, #levels do
            local level = levels[i]
            if score < level.base_score then
                -- 之前的等级就是当前等级
                return prev_level
            end
            prev_level = level
        end
        -- 积分超过所有等级基础积分，返回最高等级
        return levels[#levels]
    end

    local Rank = CenterView and CenterView.Rank
    if Rank then
        local list = CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "RankIconList", CustomProperty.PROPERTY_TYPE.Image)
        local BattlePoints = PlayerData.BaseData["Player_BattlePoints_Num"]
        local level = getLevelByScore(RankInfoConfig, BattlePoints)
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

    --寄存玩家数据
    self.PlayerData = PlayerData
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