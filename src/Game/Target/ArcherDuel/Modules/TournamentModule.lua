--锦标赛模块
local TournamentModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils

local DiamondRankManager = require("Game.Framework.Rank.DiamondRank")

local RewardConfig = require "Game.Target.ArcherDuel.Config.RewardConfig"

--- 打开
function TournamentModule:Open(Context)
    --寄存玩家数据
    local TournamentView = UIConfig.TournamentView
    local DiamondView = TournamentView.Diamond
    local Rank_Scroll = {DiamondView.Rank_Scroll.ID}
    UI:SetVisible(Rank_Scroll, true)

    local DiamondRankPlayerList = {}
    local Rank_DiamondScore_Num = DataCenter.GetNumber("Rank_DiamondScore_Num")
    local DiamondRankData = DiamondRankManager.GetPlayerDataDiamondRank(Character:GetLocalPlayerId())
    local isRank = false
    local RankNum = 100
    if DiamondRankData and DiamondRankData[#DiamondRankData - 1] and DiamondRankData[#DiamondRankData - 1].DiamondScore and Rank_DiamondScore_Num > DiamondRankData[#DiamondRankData - 1].DiamondScore then
        isRank = true
        table.remove(DiamondRankData, #DiamondRankData)
        table.insert(DiamondRankData, { name = Chat:GetCustomName(Character:GetLocalPlayerId()), headIcon = Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()), DiamondScore = Rank_DiamondScore_Num , isPlayer = true})
        table.sort(DiamondRankData, function(a,b) return a.DiamondScore > b.DiamondScore end)
    end
    for i, v in ipairs(DiamondRankData) do
        if i== 1 then
            UI:SetText({DiamondView.Rank_1.Name}, v.name)
            if v.isPlayer then
                UI:SetImage({DiamondView.Rank_1.Image}, Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()))
            else
                UI:SetImage({DiamondView.Rank_1.Image}, v.headIcon, true)
            end
            UI:SetText({DiamondView.Rank_1.Text}, tostring(v.DiamondScore))
            UI:RegisterClicked(DiamondView.Rank_1.Button,function (Button)
                TournamentModule:RefreshTip(Button, 1)
            end)
        elseif i == 2 then
            UI:SetText({DiamondView.Rank_2.Name}, v.name)
            if v.isPlayer then
                UI:SetImage({DiamondView.Rank_2.Image}, Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()))
            else
                UI:SetImage({DiamondView.Rank_2.Image}, v.headIcon, true)
            end
            UI:SetText({DiamondView.Rank_2.Text}, tostring(v.DiamondScore))
            UI:RegisterClicked(DiamondView.Rank_2.Button,function (Button)
                TournamentModule:RefreshTip(Button, 2)
            end)
        elseif i == 3 then
            UI:SetText({DiamondView.Rank_3.Name}, v.name)
            if v.isPlayer then
                UI:SetImage({DiamondView.Rank_3.Image}, Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()))
            else
                UI:SetImage({DiamondView.Rank_3.Image}, v.headIcon, true)
            end
            UI:SetText({DiamondView.Rank_3.Text}, tostring(v.DiamondScore))
            UI:RegisterClicked(DiamondView.Rank_3.Button,function (Button)
                TournamentModule:RefreshTip(Button, 3)
            end)
        else
            local NewUI =  UI:DuplicateWidget(DiamondView.Rank_Scroll.ID, 0, 0)
            local Button = UI:FindChildWithIndex(NewUI, 1) -- 宝箱按钮
            local DiamondScore = UI:FindChildWithIndex(NewUI, 2) -- 积分
            local Rank = UI:FindChildWithIndex(NewUI, 3) -- 名次
            local Name = UI:FindChildWithIndex(NewUI, 4) -- 玩家名字
            local Icon = UI:FindChildWithIndex(NewUI, 5) -- 玩家头像

            UI:SetText({DiamondScore}, tostring(v.DiamondScore))
            UI:SetText({Rank}, tostring(i))
            UI:SetText({Name}, v.name)
            if v.isPlayer then
                UI:SetImage({Icon}, Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()))
            else
                UI:SetImage({Icon}, v.headIcon, true)
            end
            UI:RegisterClicked(Button, function (Button)
                TournamentModule:RefreshTip(Button, i)
            end)

            table.insert(DiamondRankPlayerList, NewUI)
        end

        if v.isPlayer then
            RankNum = i
        end
    end
    UI:AddToScrollView(DiamondView.ScrollView, DiamondRankPlayerList)

    local score = GameUtils.GetPlayerRankScore()
    local level = GameUtils.GetRankLevelByScore(score)
    UI:SetImageColor({TournamentView.World.Image_1}, "#FFFFFF")
    UI:SetImageColor({TournamentView.World.Image_2}, "#FFFFFF")
    UI:SetImageColor({TournamentView.World.Image_3}, "#FFFFFF")
    UI:SetImageColor({TournamentView.World.Image_4}, "#FFFFFF")
    UI:SetImageColor({TournamentView.World.Image_5}, "#FFFFFF")
    UI:SetImageColor({TournamentView.World.Image_6}, "#FFFFFF")
    UI:SetImageColor({TournamentView.World["Image_"..level.titleLv]}, "#58DEFF")

    UI:SetText({106676}, tostring(level.cost))
    --本玩家Rank_8
    if isRank then
        UI:SetText({107566}, tostring(RankNum))
        UI:SetVisible({107572}, true)
        UI:RegisterClicked(107572, function (Button)
            TournamentModule:RefreshTip(Button, RankNum)
        end)
    else
        UI:SetVisible({107572}, false)
        UI:SetText({107566}, "未上榜")
    end
    UI:SetText({107568}, Chat:GetCustomName(Character:GetLocalPlayerId()))
    UI:SetImage({107567}, Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()))
    UI:SetText({107574}, tostring(Rank_DiamondScore_Num))

    self.DiamondRankPlayerList = DiamondRankPlayerList
    UI:SetVisible(Rank_Scroll, false)

    local tabBtn = {106561,106560,106559}
    local tabUnselected = {106563,106564,106565}
    local view = {106605,106518,107540}

    UI:SetVisible(tabUnselected,false)
    UI:SetVisible(view,false)
    if Context == "Golden" then
        UI:SetVisible({view[2]},true)
        UI:SetVisible({tabUnselected[2]},true)
    elseif Context == "Diamond" then
        UI:SetVisible({view[3]},true)
        UI:SetVisible({tabUnselected[3]},true)
    else
        UI:SetVisible({view[1]},true)
        UI:SetVisible({tabUnselected[1]},true)
    end

    for i, btnId in ipairs(tabBtn) do
        UI:RegisterClicked(btnId,function (btnId)
            UI:SetVisible({DiamondView.Popup.ID}, false)
            local isRet = false
            if i == 2 then
                if GameUtils.IsReachGoldRank(score) then
                    isRet = true
                else
                    UI:ShowMessageTip("达到黄金段位，才能进入黄金赛")
                end
            elseif i == 3 then
                if GameUtils.IsReachDiamondRank(score) then
                    isRet = true
                else
                    UI:ShowMessageTip("达到钻石段位，才能进入钻石赛")
                end
            else
                isRet = true
            end

            if isRet then
                for j, v in pairs(tabUnselected) do
                    if j == i then
                        UI:SetVisible({v},true)
                    else
                        UI:SetVisible({v},false)
                    end
                end
                for j, v in pairs(view) do
                    if j == i then
                        UI:SetVisible({v},true)
                    else
                        UI:SetVisible({v},false)
                    end
                end
            end
        end)
    end

    -- 刷新黄金赛次数
    local count = GameUtils.GetGoldBattleCount()
    UI:SetText({106557}, string.format("剩余次数：%d/3", count))

    --进入排位赛
    UI:RegisterClicked(TournamentView.World.Button, function()
        self:OnMatch()
    end)

    --进入黄金联赛
    UI:RegisterClicked(TournamentView.Gold.Button, function()
        self:OnGoldMatch()
    end)

    --进入钻石联赛
    UI:RegisterClicked(TournamentView.Diamond.Button, function()
        self:OnDiamondMatch()
    end)

    System:RegisterEvent(Events.ON_TOUCH_SCREEN_PRESSED, function (x, y)
        UI:SetVisible({DiamondView.Popup.ID}, false)
    end)

    TournamentModule:ShowRule()
end

function TournamentModule:OnMatch()
    if GameUtils.CanEnterRankBattle() then
        --这里打开寻找对局页面
        --生成1到7的随机数字
        local RandomNumber = math.random(1, 6)  --随机海岛和天空
        DataCenter.SetNumber("BattleStage", RandomNumber)
        System:FireSignEvent(tostring(RandomNumber))
    end
end

function TournamentModule:OnGoldMatch()
    if GameUtils.CanEnterGoldBattle() then
        DataCenter.SetNumber("BattleStage", 7)
        System:FireSignEvent(tostring(7))
    end
end

function TournamentModule:OnDiamondMatch()
    if GameUtils.CanEnterDiamondRankBattle() then
        DataCenter.SetNumber("BattleStage", 8)
        System:FireSignEvent(tostring(8))
    end
end

--- 刷新
---@param DeltaTime 时间戳
function TournamentModule:Update(DeltaTime)
    
end

--- 关闭
function TournamentModule:Close()
    System:UnregisterEvent(Events.ON_TOUCH_SCREEN_PRESSED)
    if self.DiamondRankPlayerList then
        for i, v in ipairs(self.DiamondRankPlayerList) do
            local Button = UI:FindChildWithIndex(v, 1) -- 宝箱按钮
            UI:UnRegisterClicked(Button)
        end
        UI:SetVisible(self.DiamondRankPlayerList, false)
        self.DiamondRankPlayerList = nil
    end

    local tabBtn = {106561,106560,106559}
    for _, btnId in ipairs(tabBtn) do
        UI:UnRegisterClicked(btnId)
    end

    local TournamentView = UIConfig.TournamentView
    --进入排位赛
    UI:UnRegisterClicked(TournamentView.World.Button)
    --进入黄金联赛
    UI:UnRegisterClicked(TournamentView.Gold.Button)
    --进入钻石联赛
    UI:UnRegisterClicked(TournamentView.Diamond.Button)

    UI:UnRegisterClicked(TournamentView.Diamond.Rank_1.Button)
    UI:UnRegisterClicked(TournamentView.Diamond.Rank_2.Button)
    UI:UnRegisterClicked(TournamentView.Diamond.Rank_3.Button)

    UI:UnRegisterClicked(107572)
    UI:UnRegisterClicked(106604)
    UI:UnRegisterClicked(115569)

    local uis = {}
    for i, v in pairs(TournamentView) do
        table.insert(uis, v.ID)
    end
    UI:SetVisible(uis, false)
end

function TournamentModule:RefreshTip(Button, RankNum)
    if RankNum > 6 then
        RankNum = 6
    end
    --辅助API
    local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
    local TournamentView = UIConfig.TournamentView
    local DiamondView = TournamentView.Diamond
    for i = 1, 3, 1 do
        UI:SetVisible({DiamondView.Popup["Image_"..i], DiamondView.Popup["Text_"..i]}, false)
    end
    for i, v in ipairs(RewardConfig.Diamond_Rewards[RankNum]) do
        UI:SetVisible({DiamondView.Popup["Image_"..i], DiamondView.Popup["Text_"..i]}, true)
        local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[v.id]
        GameUtils.SetImageWithAsset(DiamondView.Popup["Image_"..i], "Currency", cfg.iconIndex)
        UI:SetText({DiamondView.Popup["Text_"..i]}, tostring(v.count))
    end

    UI:SetVisible({DiamondView.Popup.ID}, true)
    local size = UI:GetSize(DiamondView.Popup.ID)
    local Pos = UI:GetPosition(Button)
    local sPos = UI:UIPositionToScreenPosition(Pos,Button)
    local relativePos = UI:ScreenPositionToUIPosition(sPos,DiamondView.Popup.ID)
    UI:SetPosition({DiamondView.Popup.ID}, relativePos.X - (size.X / 2), relativePos.Y)
end

function TournamentModule:ShowRule()
    local Rank_Rules = {}

    UI:RegisterPressed(106604,function ()
        UI:SetVisible({115567},true)
        if #Rank_Rules == 0 then
            local ElementId = System:GetScriptParentID()
            local IconIdCurrency = CustomProperty:GetCustomPropertyArray(ElementId,"Currency", CustomProperty.PROPERTY_TYPE.Image)
            local IconIdRank = CustomProperty:GetCustomPropertyArray(ElementId,"Rank", CustomProperty.PROPERTY_TYPE.Image)
            local Rank_Rewards = {
                Icon = {6,5,5,5,5,5,4,4,4,4,4,3,3,3,3,3,2,2,2,1,1,1},
                Text = {"王者","大师1","大师2","大师3","大师4","大师5","钻石1","钻石2","钻石3","钻石4","钻石5","黄金1","黄金2","黄金3","黄金4","黄金5","白银1","白银2","白银3","青铜1","青铜2","青铜3",},
                Icon_1 = {1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,4,4,4,4,4,4}, --奖励图片
                Text_1 = {3,3,3,3,3,3,2,2,2,1,1,1,1,1,1,1,700,600,500,500,500,500}, --图片下的个数
                Icon_2 = 6,
                Text_2 = {200,150,150,150,150,150,120,100,100,100,100,80,60,60,50,50,40,40,40,30,30,30},
            }
            for index = 1, 22 do
                local NewUID =  UI:DuplicateWidget(115563,9999,9999)
                local Icon = UI:FindChildWithIndex(NewUID,1)
                local Text = UI:FindChildWithIndex(NewUID,2)
                local Text_1 = UI:FindChildWithIndex(NewUID,3)
                local Icon_1 = UI:FindChildWithIndex(NewUID,4)
                local Text_2 = UI:FindChildWithIndex(NewUID,5)
                local Icon_2 = UI:FindChildWithIndex(NewUID,6)
                
                UI:SetText({Text},Rank_Rewards.Text[index])
                UI:SetImage({Icon},IconIdRank[Rank_Rewards.Icon[index]],true)
                UI:SetText({Text_1},tostring(Rank_Rewards.Text_1[index]))
                UI:SetImage({Icon_1},IconIdCurrency[Rank_Rewards.Icon_1[index]],true)
                UI:SetText({Text_2},tostring(Rank_Rewards.Text_2[index]))
                UI:SetImage({Icon_2},IconIdCurrency[Rank_Rewards.Icon_2],true)
                table.insert(Rank_Rules,NewUID)
            end
            UI:AddToScrollView(115568,Rank_Rules)
        else
            UI:SetVisible(Rank_Rules,true) 
        end
        
    end)

    UI:RegisterPressed(115569,function ()
        UI:SetVisible({115567},false) 
        UI:SetVisible(Rank_Rules,false) 

    end)
end

return TournamentModule