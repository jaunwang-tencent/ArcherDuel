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

    local Rank_Scroll = {107535}
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
            UI:SetText({UIConfig.RankView.Diamond.Rank_1.Name}, v.name)
            UI:SetImage({UIConfig.RankView.Diamond.Rank_1.Image}, v.headIcon, true)
            --UI:SetText({UIConfig.RankView.Diamond.Rank_1.Button}, v.name)
            UI:SetText({UIConfig.RankView.Diamond.Rank_1.Text}, tostring(v.DiamondScore))
        elseif i == 2 then
            UI:SetText({UIConfig.RankView.Diamond.Rank_2.Name}, v.name)
            UI:SetImage({UIConfig.RankView.Diamond.Rank_2.Image}, v.headIcon, true)
            --UI:SetText({UIConfig.RankView.Diamond.Rank_2.Button}, v.name)
            UI:SetText({UIConfig.RankView.Diamond.Rank_2.Text}, tostring(v.DiamondScore))
        elseif i == 3 then
            UI:SetText({UIConfig.RankView.Diamond.Rank_3.Name}, v.name)
            UI:SetImage({UIConfig.RankView.Diamond.Rank_3.Image}, v.headIcon, true)
            --UI:SetText({UIConfig.RankView.Diamond.Rank_3.Button}, v.name)
            UI:SetText({UIConfig.RankView.Diamond.Rank_3.Text}, tostring(v.DiamondScore))
        else
            local NewUI =  UI:DuplicateWidget(107535, 0, 0)
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
    UI:AddToScrollView(107735, DiamondRankPlayerList)

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
end

return TournamentModule