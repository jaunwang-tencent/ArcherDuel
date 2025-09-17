--锦标赛模块
local TournamentModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig

local DiamondRankManager = require("Game.Framework.Rank.DiamondRank")

--- 打开
---@param PlayerData 玩家数据
function TournamentModule:Open(PlayerData)
    --寄存玩家数据
    self.PlayerData = PlayerData
    local TournamentView = UIConfig.TournamentView

    --注册Table标签

    local DiamondView = TournamentView.Diamond
    local Rank_Scroll = {DiamondView.Rank_Scroll.ID}
    UI:SetVisible(Rank_Scroll, true)

    local DiamondRankPlayerList = {}
    local Rank_DiamondScore_Num = Archive:GetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.Number, "Rank_DiamondScore_Num")
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
            UI:SetImage({DiamondView.Rank_1.Image}, v.headIcon, true)
            --UI:SetText({DiamondView.Rank_1.Button}, v.name)
            UI:SetText({DiamondView.Rank_1.Text}, tostring(v.DiamondScore))
        elseif i == 2 then
            UI:SetText({DiamondView.Rank_2.Name}, v.name)
            UI:SetImage({DiamondView.Rank_2.Image}, v.headIcon, true)
            --UI:SetText({DiamondView.Rank_2.Button}, v.name)
            UI:SetText({DiamondView.Rank_2.Text}, tostring(v.DiamondScore))
        elseif i == 3 then
            UI:SetText({DiamondView.Rank_3.Name}, v.name)
            UI:SetImage({DiamondView.Rank_3.Image}, v.headIcon, true)
            --UI:SetText({DiamondView.Rank_3.Button}, v.name)
            UI:SetText({DiamondView.Rank_3.Text}, tostring(v.DiamondScore))
        else
            local NewUI =  UI:DuplicateWidget(DiamondView.Rank_Scroll.ID, 0, 0)
            local DiamondScore = UI:FindChildWithIndex(NewUI, 2) -- 积分
            local Rank = UI:FindChildWithIndex(NewUI, 3) -- 名次
            local Name = UI:FindChildWithIndex(NewUI, 4) -- 玩家名字
            local Icon = UI:FindChildWithIndex(NewUI, 5) -- 玩家头像

            UI:SetText({DiamondScore}, tostring(v.DiamondScore))
            UI:SetText({Rank}, tostring(i))
            UI:SetText({Name}, v.name)
            UI:SetImage({Icon}, v.headIcon, true)

            table.insert(DiamondRankPlayerList, NewUI)
        end

        if v.isPlayer then
            RankNum = i
        end
    end
    UI:AddToScrollView(DiamondView.ScrollView, DiamondRankPlayerList)

    local score = _GAME.GameUtils.GetPlayerRankScore()
    local level = _GAME.GameUtils.GetRankLevelByScore(score)
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
    else
        UI:SetText({107566}, "未上榜")
    end
    UI:SetText({107568}, Chat:GetCustomName(Character:GetLocalPlayerId()))
    UI:SetImage({107567}, Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()), true)
    UI:SetText({107574}, tostring(Rank_DiamondScore_Num))

    self.DiamondRankPlayerList = DiamondRankPlayerList
    UI:SetVisible(Rank_Scroll, false)

    local tabBtn = {106561,106560,106559}
    local tabUnselected = {106563,106564,106565}
    local view = {106605,106518,107540}

    UI:SetVisible(tabUnselected,false)
    UI:SetVisible({tabUnselected[1]},true)
    UI:SetVisible(view,false)
    UI:SetVisible({view[1]},true)

    for i, btnId in ipairs(tabBtn) do
        UI:RegisterPressed(btnId,function (btnId)
            UI:SetVisible(tabUnselected,false)
            UI:SetVisible({tabUnselected[i]},true)
            UI:SetVisible(view,false)
            UI:SetVisible({view[i]},true)
        end)
    end

    -- 刷新黄金赛次数
    local count = _GAME.GameUtils.GetGoldBattleCount()
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
end

function TournamentModule:OnMatch()
    if _GAME.GameUtils.CanEnterRankBattle() then
        --这里打开寻找对局页面
        --生成1到7的随机数字
        local RandomNumber = math.random(1, 6)  --随机海岛和天空
        Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.Number, "BattleStage", 1)
        System:FireSignEvent(tostring(1))
    end
end

function TournamentModule:OnGoldMatch()
    if _GAME.GameUtils.CanEnterGoldBattle() then
        Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.Number, "BattleStage", 7)
        System:FireSignEvent(tostring(7))
    end
end

function TournamentModule:OnDiamondMatch()
    if _GAME.GameUtils.CanEnterDiamondRankBattle() then
        Archive:SetPlayerData(Character:GetLocalPlayerId(), Archive.TYPE.Number, "BattleStage", 8)
        System:FireSignEvent(tostring(8))
    end
end

--- 刷新
---@param DeltaTime 时间戳
function TournamentModule:Update(DeltaTime)
    
end

--- 关闭
function TournamentModule:Close()
    if self.DiamondRankPlayerList then
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

    local uis = {}
    for i, v in pairs(TournamentView) do
        table.insert(uis, v.ID)
    end
    UI:SetVisible(uis, false)
end

return TournamentModule