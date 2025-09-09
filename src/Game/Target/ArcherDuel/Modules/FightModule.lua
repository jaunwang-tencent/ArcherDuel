--对决模块
local FightModule = {}
--段位配置
local RankInfoConfig = UGCS.Target.ArcherDuel.Config.RankInfoConfig
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig

--- 打开
---@param PlayerData 玩家数据
function FightModule:Open(PlayerData)
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

    local HomeView = UIConfig.HomeView
    local CenterView = HomeView and HomeView.CenterView
    local Rank = CenterView and CenterView.Rank
    if Rank then
        local list = CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "RankIconList", CustomProperty.PROPERTY_TYPE.Image)
        local BattlePoints = PlayerData["Player_BattlePoints_Num"]
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
    self.PlayerData = nil
end

return FightModule