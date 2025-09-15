local MatchConfig = require("Match.MatchConfig")
local GoldRewardConfig = require("Match.GoldRewardConfig")

local GameMatch = {}

math.randomseed(TimerManager:GetClock()) -- 设置随机数种子

function GameMatch:Init()
    Log:PrintLog("[GameMatch:Init]")

    -- 构造武器类型表
    self.weaponMap = {}
    for i, v in pairs(UGCS.Target.ArcherDuel.Config.WeaponConfig) do
        self.weaponMap[v.TypeName] = self.weaponMap[v.TypeName] or {}
        table.insert(self.weaponMap[v.TypeName], i)
    end

    -- 构造装备类型表
    self.equipmentMap = {}
    for i, v in pairs(UGCS.Target.ArcherDuel.Config.EquipmentConfig) do
        self.equipmentMap[v.TypeName] = self.equipmentMap[v.TypeName] or {}
        table.insert(self.equipmentMap[v.TypeName], i)
    end

    self.localPlayerId = Character:GetLocalPlayerId()
    --获取当前地图
    self.mapId = Archive:GetPlayerData(self.localPlayerId, Archive.TYPE.Number, "BattleStage")
    if not self.mapId or self.mapId == 0 then
        self.mapId = CustomProperty:GetCustomProperty(System:GetScriptParentID(), "MapId", CustomProperty.PROPERTY_TYPE.Number)
    end
    self.isGold = false -- 是否是黄金赛地图
    
    --构造场景表
    self.sceneIds = {}
    if UGCS.Target.ArcherDuel.Config.SceneConfig[self.mapId] then
        self.isGold = UGCS.Target.ArcherDuel.Config.SceneConfig[self.mapId].IsGold
        for i, v in pairs(UGCS.Target.ArcherDuel.Config.SceneConfig[self.mapId].Resource) do
            if type(i) == "number" then
                table.insert(self.sceneIds, i)
            end
        end
    end

    --读取保存当前玩家能够使用武器
    self.localWeapons = {}
    local Bow_Num = Archive:GetPlayerData(self.localPlayerId, Archive.TYPE.Number, "Equipped_Bow_Num")
    if Bow_Num and Bow_Num > 0 then
        self.localWeapons["Bow"] = Bow_Num -- 弓
    end
    local Axe_Num = Archive:GetPlayerData(self.localPlayerId, Archive.TYPE.Number, "Equipped_Axe_Num")
    if Axe_Num and Axe_Num > 0 then
        self.localWeapons["Axe"] = Axe_Num -- 斧
    end
    local Spear_Num = Archive:GetPlayerData(self.localPlayerId, Archive.TYPE.Number, "Equipped_Spear_Num")
    if Spear_Num and Spear_Num > 0 then
        self.localWeapons["Spear"] = Spear_Num -- 矛
    end
    if #self.localWeapons == 0 then -- 试玩兜底
        self.localWeapons = {
            ["Bow"] = 1,
            ["Axe"] = 2,
            ["Spear"] = 3,
        }
    end

    -- 当前玩家穿戴装备
    self.localEquipments = {}
    local Part_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Part_Num")
    if Part_Num and Part_Num > 0 then
        self.localEquipments["Part"] = Part_Num
    end
    local Bottoms_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Bottoms_Num")
    if Bottoms_Num and Bottoms_Num > 0 then
        self.localEquipments["Bottoms"] = Bottoms_Num
    end
    local Cloth_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Cloth_Num")
    if Cloth_Num and Cloth_Num > 0 then
        self.localEquipments["Cloth"] = Cloth_Num
    end

    --黄金赛缓存数据
    self.goldWinnerRivalInfo = {} -- 黄金赛胜者组
    self.goldFailerRivalInfo = {} -- 黄金赛败者组
    self.goldBattleRival = {} -- 黄金赛当前对手
    self.goldShowBattleRivals = {} -- 黄金赛本次表演者
    self.goldFailCount = 0 -- 黄金赛失败次数
    self.goldBattleResult = false -- 黄金赛当前结果
    self.goldBattleRound = 0 -- 黄金赛比赛轮次
    self.isGoldFinalBattle = false -- 是否为黄金赛最后一轮
    self.goldHeadStates = {} -- 黄金赛头像状态

    if self.isGold then
        self:InitGoldMatch()
    end

    self:BindEvents()
end

function GameMatch:OnStart()
    Log:PrintLog("[GameMatch:OnStart]")
end

-- 游戏结束
function GameMatch:OnEnd()
    Log:PrintLog("[GameMatch:OnEnd]")
end

------------------------------ 匹配 ------------------------------

local function GetRankIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Rank", CustomProperty.PROPERTY_TYPE.Image)
end

local function GetHeadIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "avatar", CustomProperty.PROPERTY_TYPE.Image)
end

local function GetWeaponIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "weapon_icon", CustomProperty.PROPERTY_TYPE.Image)
end

local function GetBodyIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Character", CustomProperty.PROPERTY_TYPE.Image)
end

local function GetClothIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Top", CustomProperty.PROPERTY_TYPE.Image)
end

local function GetBottomsIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Bottoms", CustomProperty.PROPERTY_TYPE.Image)
end

local function GetCurrencyIconList()
    return CustomProperty:GetCustomPropertyArray(System:GetScriptParentID(), "Currency", CustomProperty.PROPERTY_TYPE.Image)
end

-- 绑定事件
function GameMatch:BindEvents()
    -- 收到开始匹配的事件
    System:RegisterGameEvent(_GAME.Events.StartMatch, function()
        if self.isGold then
            self:StartGoldMatch()
        else
            self:StartMatch()
        end
    end)

    -- 收到对局胜利的事件
    System:RegisterGameEvent(_GAME.Events.BattleVictory, function ()
        if self.isGold then
            self:OnGoldVictory()
        else
            self:OnVictory()
        end
    end)
    
    -- 收到对局失败的事件
    System:RegisterGameEvent(_GAME.Events.BattleFail,function ()
        if self.isGold then
            self:OnGoldFail()
        else
            self:OnFail()
        end
    end)

    -- 胜利界面点击再来一次
    UI:RegisterPressed(108060,function ()
        UI:SetVisible(MatchConfig.Victory_UI, false)
        System:FireGameEvent(_GAME.Events.StartMatch)
    end)

    -- 胜利界面点击返回大厅
    UI:RegisterPressed(108059,function ()
        UI:SetVisible(MatchConfig.Victory_UI, false)
        System:FireSignEvent("GoHome")
    end)

    -- 开箱表演动画
    UI:RegisterPressed(108303,function ()
        if self.VictoryRewards ~= nil then
            local ElementId = System:GetScriptParentID()
            local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
            local equipIconUIs = {108054, 108055}
            for i, v in ipairs(self.VictoryRewards) do
                local EquipmentData = EquipmentConfig[v]
                local AssetName = EquipmentData.AssetName or "weapon_icon"
                local AssetIndex = EquipmentData.AssetIndex or EquipmentData.ID
                local IconIdArray = CustomProperty:GetCustomPropertyArray(ElementId, AssetName, CustomProperty.PROPERTY_TYPE.Image)
                local IconId = IconIdArray[AssetIndex]
                UI:SetImage({equipIconUIs[i]}, IconId, true)
            end
            self.VictoryRewards = nil
        end

        UI:SetVisible({108298},false)
        UI:SetVisible({108048,108056},true)
        TimerManager:AddTimer(2.3,function ()
            UI:SetVisible({111057},true)
            UI:PlayUIAnimation(111057,1,0)
            TimerManager:AddTimer(1.6,function ()
                UI:PauseUIAnimation(111057,1)
            end)
            UI:SetVisible({108052,108051},true)
            UI:PlayUIAnimation(108051,1,0)
            UI:PlayUIAnimation(108052,1,0)
        end)
        TimerManager:AddTimer(3.05,function ()
            UI:EffectPausePlay(108056)
            TimerManager:AddTimer(1.25,function ()
                UI:SetVisible({108057},true)
                UI:PlayUIAnimation(108058,1,0)
                TimerManager:AddTimer(2,function ()
                    UI:SetVisible({108480},true)
                end)
            end)
        end)
    end)

    -- 失败界面点击再来一次
    UI:RegisterClicked(106511, function()
        UI:SetVisible(MatchConfig.Fail_UI, false)
        System:FireGameEvent(_GAME.Events.StartMatch)
    end)

    -- 失败界面点击返回大厅
    UI:RegisterClicked(106512, function()
        UI:SetVisible(MatchConfig.Fail_UI, false)
        System:FireSignEvent("GoHome")
    end)

    -- 黑屏动画
    System:RegisterGameEvent(_GAME.Events.BlackScreen,function ()
        UI:SetVisible(MatchConfig.BlackScreen_UI,true)
        UI:PlayUIAnimation(110054,1,1)
        TimerManager:AddTimer(2,function ()
            -- 关闭黑屏动画
            UI:SetVisible(MatchConfig.BlackScreen_UI,false)
        end)
    end)

    --- 黄金赛点击下一局
    UI:RegisterClicked(110079,function ()
        UI:SetVisible(MatchConfig.GoldWinner_UI,false)
        UI:SetVisible(MatchConfig.GoldFailer_UI,false)
        UI:SetVisible(MatchConfig.MatchUI_Next,false)

        System:FireGameEvent(_GAME.Events.StartMatch)
    end)

    -- 继续进行黄金赛匹配
    System:RegisterGameEvent(_GAME.Events.GoldBattleContinue, self.OnGoldBattleContinue, self)

    -- 黄金赛结束
    UI:RegisterClicked(110205,function ()
        UI:SetVisible({110204},false)
        UI:SetVisible(MatchConfig.GoldWinner_UI,false)
        UI:SetVisible(MatchConfig.GoldFailer_UI,false)
        UI:SetVisible(MatchConfig.MatchUI_Next,false)
        UI:SetVisible(MatchConfig.MatchUI_Start,false)
        System:FireSignEvent("GoHome")
    end)
    -- 黄金赛结算前往开启
    UI:RegisterClicked(110785,function ()
        UI:SetVisible(MatchConfig.GoldTop3_Show_UI,false)
        System:FireSignEvent("GoHome")
    end)
    -- 黄金赛结算退出
    UI:RegisterClicked(110788,function ()
        UI:SetVisible(MatchConfig.GoldTop3_Show_UI,false)
        System:FireSignEvent("GoHome")
    end)
    -- 黄金赛中途退出
    UI:RegisterClicked(110720,function ()
        UI:SetVisible({109965},false)
        UI:SetVisible(MatchConfig.GoldWinner_UI,false)
        UI:SetVisible(MatchConfig.GoldFailer_UI,false)
        UI:SetVisible(MatchConfig.MatchUI_Next,false)
        UI:SetVisible(MatchConfig.MatchUI_Start,false)
        self:GoldExist()
        System:FireSignEvent("GoHome")
    end)
end

-- 随机获取一套装备
function GameMatch:GetRandomEquipments()
    local equipments = {}
    for i, v in pairs(self.equipmentMap) do
        local index = math.random(1, #v)
        equipments[i] = v[index]
    end
    return equipments
end

-- 随机获取一套武器
function GameMatch:GetRandomWeapons()
    local weapons = {}
    for i, v in pairs(self.weaponMap) do
        local index = math.random(1, #v)
        weapons[i] = v[index]
    end
    return weapons
end

-- 开始匹配
function GameMatch:StartMatch()
    local MatchInfo = {}

    MatchInfo.MapId = self.mapId
    --随机战斗场景
    local Scene_ID = self.sceneIds[math.random(1, #self.sceneIds)]
    MatchInfo.SceneId = Scene_ID

    -- 从自己的武器类型池中随机一个武器类型
    local BattleWeapon = {}
    local weapons = {}
    for i, v in pairs(self.localWeapons) do
        table.insert(weapons, {weaponType = i, weaponId = v})
    end
    local weaponIndex = math.random(1, #weapons)
    BattleWeapon = weapons[weaponIndex]
    MatchInfo.BattleWeapon = BattleWeapon

    --存储随机敌人
    local BattleRivalInfo = {}
    -- 随机一把同类型武器
    local weaponIds = self.weaponMap[BattleWeapon.weaponType]
    BattleRivalInfo.weaponId = weaponIds[math.random(1, #weaponIds)]
    -- 随机名字
    BattleRivalInfo.name = MatchConfig.PlayerName[math.random(1, #MatchConfig.PlayerName)]
    -- 随机装备
    BattleRivalInfo.equipments = self:GetRandomEquipments()
    -- 积分
    local curScore = _GAME.GameUtils.GetPlayerRankScore()
    BattleRivalInfo.score = curScore + math.random(0, 200)
    -- 头像
    local headIcons = GetHeadIconList()
    local HeadIconCount = #headIcons
    if HeadIconCount > 0 then
        --只有存在头像时才随机
        BattleRivalInfo.headIcon = headIcons[math.random(1, HeadIconCount)]
    end
    MatchInfo.BattleRivalInfo = BattleRivalInfo

    Log:PrintDebug("zzzzzzz StartMatch zzzzzzz")
    Log:PrintTable(MatchInfo)

    -- 发送信号，通知战斗端数据已经准备好
    System:FireGameEvent(_GAME.Events.MatchInfoReady, MatchInfo)

    -- 开始匹配倒计时
    self:MathCountDown(MatchInfo)
end

-- 匹配倒计时
function GameMatch:MathCountDown(MatchInfo)
    UI:SetVisible(MatchConfig.MatchUI_Next,false)
    -- 地图名称
    UI:SetText({105665}, MatchConfig.Map[self.mapId])

    UI:SetVisible({105710},true)-- 打开特效界面
    UI:SetVisible({100468,100528,100531},false)
    -- UI:SetVisible(zhuye,false)
    UI:SetVisible({105664,105670,105671,105674,105675},true)
    TimerManager:AddTimer(0.1,function ()
        local RankIconList = GetRankIconList()
        local WeaponIconList = GetWeaponIconList()
        local BodyIconList = GetBodyIconList()
        local ClothIconList = GetClothIconList()
        local BottomsIconList = GetBottomsIconList()
        local WeaponConfig = UGCS.Target.ArcherDuel.Config.WeaponConfig
        local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
        -- 自己对战信息
        UI:SetImage({105676},Chat:GetCustomHeadIcon(self.localPlayerId), true)
        UI:SetText({105680}, Chat:GetCustomName(self.localPlayerId))
        local curScore = _GAME.GameUtils.GetPlayerRankScore()
        local curLevel = _GAME.GameUtils.GetRankLevelByScore(curScore)
        if curLevel then
            if curLevel.icon and RankIconList[curLevel.icon] then
                UI:SetImage({105682}, RankIconList[curLevel.icon], true)
            end
            UI:SetText({105681}, curLevel.name)
        end
        local weaponIconIndex, bodyIconIndex, clothIconIndex, bottomIconIndex
        if WeaponConfig[MatchInfo.BattleWeapon.weaponId] then
            weaponIconIndex = MatchInfo.BattleWeapon.weaponId
        end
        if self.localEquipments["Part"] and EquipmentConfig[self.localEquipments["Part"]] then
            bodyIconIndex = EquipmentConfig[self.localEquipments["Part"]].AssetIndex
        end
        if self.localEquipments["Cloth"] and EquipmentConfig[self.localEquipments["Cloth"]] then
            clothIconIndex = EquipmentConfig[self.localEquipments["Cloth"]].AssetIndex
        end
        if self.localEquipments["Bottoms"] and EquipmentConfig[self.localEquipments["Bottoms"]] then
            bottomIconIndex = EquipmentConfig[self.localEquipments["Bottoms"]].AssetIndex
        end
        UI:SetImage({105686}, WeaponIconList[weaponIconIndex],true) -- 武器
        UI:SetImage({105687},BodyIconList[bodyIconIndex],true) -- body
        UI:SetImage({105688},ClothIconList[clothIconIndex],true) -- cloth
        UI:SetImage({105689},BottomsIconList[bottomIconIndex],true) -- Bottoms

        -- 对方信息
        UI:SetImage({105677}, MatchInfo.BattleRivalInfo.headIcon, true)
        UI:SetText({105685}, MatchInfo.BattleRivalInfo.name)
        curLevel = _GAME.GameUtils.GetRankLevelByScore(MatchInfo.BattleRivalInfo.score)
        if curLevel then
            if curLevel.icon and RankIconList[curLevel.icon] then
                UI:SetImage({105684}, RankIconList[curLevel.icon], true)
            end
            UI:SetText({105683}, curLevel.name)
        end
        if WeaponConfig[MatchInfo.BattleRivalInfo.weaponId] then
            weaponIconIndex = MatchInfo.BattleWeapon.weaponId
        end
        if MatchInfo.BattleRivalInfo.equipments["Character"] and EquipmentConfig[MatchInfo.BattleRivalInfo.equipments["Character"]] then
            bodyIconIndex = EquipmentConfig[MatchInfo.BattleRivalInfo.equipments["Character"]].AssetIndex
        end
        if MatchInfo.BattleRivalInfo.equipments["Top"] and EquipmentConfig[MatchInfo.BattleRivalInfo.equipments["Top"]] then
            clothIconIndex = EquipmentConfig[MatchInfo.BattleRivalInfo.equipments["Top"]].AssetIndex
        end
        if MatchInfo.BattleRivalInfo.equipments["Bottoms"] and EquipmentConfig[MatchInfo.BattleRivalInfo.equipments["Bottoms"]] then
            bottomIconIndex = EquipmentConfig[MatchInfo.BattleRivalInfo.equipments["Bottoms"]].AssetIndex
        end
        UI:SetImage({105691},WeaponIconList[weaponIconIndex],true) -- 武器
        UI:SetImage({105694},BodyIconList[bodyIconIndex],true) -- body
        UI:SetImage({105692},ClothIconList[clothIconIndex],true) -- cloth
        UI:SetImage({105693},BottomsIconList[bottomIconIndex],true) -- Bottoms
    end)

    -- 动画效果
    UI:PlayUIAnimation(105674,1,0)
    UI:PlayUIAnimation(105675,1,0)

    local delay = 0
    delay = delay + 0.3
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({105706},true)
        UI:PlayUIAnimation(105706,1,0)
    end)
    delay = delay + 0.3
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({105708,105709},true)
        UI:PlayUIAnimation(105708,1,0)
        UI:PlayUIAnimation(105709,1,0)
    end)
    delay = delay + 0.2
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({105707},true)
        UI:PlayUIAnimation(105707,1,0)
    end)
    delay = delay + 0.3
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({105948},true)
    end)
    delay = delay + 0.3
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({106210},false)
        UI:SetVisible({106082},true)
        UI:PlayUIAnimation(106082,1,0)
    end)
    delay = delay + 1
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({106082},false)
        UI:SetVisible({106084},true)
        UI:PlayUIAnimation(106084,1,0)
    end)
    delay = delay + 1
    TimerManager:AddTimer(delay,function ()
        UI:SetVisible({106084},false)
        UI:SetVisible({106085},true)
        UI:PlayUIAnimation(106085,1,0)
    end)
    delay = delay + 1
    TimerManager:AddTimer(delay,function ()
        -- 发送事件，通知战斗端可以开始战斗
        UI:SetVisible(MatchConfig.Match_UI,false)
        System:FireGameEvent(_GAME.Events.BattleStart)
    end)
end

-- 展示排位进度
local function ShowRankProgress(curScore, newScore)
    local stepCount = 50
    local step = (newScore - curScore)/stepCount

    local RankIconList = GetRankIconList()
    local function SetCurRank(level)
        if level.icon and RankIconList[level.icon] then
            UI:SetImage({108300}, RankIconList[level.icon], true)
        end
        UI:SetText({108299}, level.name)
    end

    local curLevel, nextLevel = _GAME.GameUtils.GetRankLevelByScore(curScore)
    if curLevel and nextLevel then
        UI:SetVisible({108302},true)
        SetCurRank(curLevel)

        -- 该排名中的分段总积分
        local maxProgress = nextLevel.base_score - curLevel.base_score
        UI:SetProgressMaxValue({108302}, maxProgress)
        -- 当前进度中的分段积分
        local score = curScore
        local curProgress = score - curLevel.base_score
        UI:SetProgressCurrentValue({108302}, curProgress)

        local animation, count = nil, 0
        animation =  TimerManager:AddLoopTimer(1/stepCount,function ()
            count = count + 1
            score = score + step

            if score >= nextLevel.base_score then
                -- UI:SetVisible({111925},true)
                -- System:FireSignEvent("RanklUp")
                UI:SetVisible({108300}, true)
                System:FireSignEvent("显示背景光")
                UI:PlayUIAnimation(108300,1,0)
                -- 切换到下一个等级图标
                TimerManager:AddTimer(0.5, function()
                    SetCurRank(curLevel)
                end)
                curLevel, nextLevel = _GAME.GameUtils.GetRankLevelByScore(score)
                if curLevel and nextLevel then
                    maxProgress = nextLevel.base_score - curLevel.base_score
                    UI:SetProgressMaxValue({108302}, maxProgress)
                else
                    UI:SetProgressCurrentValue({108302}, maxProgress)
                    TimerManager:RemoveTimer(animation)
                    return
                end
            end

            curProgress = score - curLevel.base_score
            UI:SetProgressCurrentValue({108302}, curProgress)

            if count == stepCount then
                TimerManager:RemoveTimer(animation)
            end
        end)
    else
        UI:SetVisible({108302},false)
    end
end

-- 普通赛胜利
function GameMatch:OnVictory()
    --加积分
    local score = _GAME.GameUtils.GetPlayerRankScore()
    local newScore = score + UGCS.Target.ArcherDuel.Config.GameConfig.VictoryAddScore
    Log:PrintLog("[GameMatch:OnVictory] Player_BattlePoints_Num" .. newScore)
    _GAME.GameUtils.SetPlayerRankScore(newScore)

    UI:SetVisible({108298},true)
    UI:SetText({108301}, "+"..UGCS.Target.ArcherDuel.Config.GameConfig.VictoryAddScore)
    ShowRankProgress(score, newScore)

    --发奖励
    local rewards = _GAME.GameUtils.GetRewardsByWin()
    local AllEquipment
    if Archive:HasPlayerData(self.PlayerID, Archive.TYPE.String, "All_Equipment_Table") then
        --这里读取玩家的装备 --并进行排序
        local All_Equipment_Table = Archive:GetPlayerData(self.localPlayerId, Archive.TYPE.String, "All_Equipment_Table")
        --文字转为组
        AllEquipment = MiscService:JsonStr2Table(All_Equipment_Table)
    else
        --没有则初始化
        AllEquipment = _GAME.GameUtils.DefaultEquipmentData()
    end
    for _, EquipmentID in pairs(rewards) do
        local TargetEquipment = AllEquipment[EquipmentID]
        if TargetEquipment.Unlock then
            --累加碎片
            TargetEquipment.Piece = TargetEquipment.Piece + 1
        else
            --解锁
            TargetEquipment.Unlock = true
        end
    end
    local All_Equipment_Table = MiscService:Table2JsonStr(AllEquipment)
    Archive:SetPlayerData(self.PlayerID, Archive.TYPE.String, "All_Equipment_Table", All_Equipment_Table)

    self.VictoryRewards = rewards
    Log:PrintLog("VictoryRewards, End: ", self.VictoryRewards[1], self.VictoryRewards[2])

    System:FireGameEvent(_GAME.Events.GameEnd)
end

-- 普通赛失败
function GameMatch:OnFail()
    --减积分
    local score = _GAME.GameUtils.GetPlayerRankScore()
    Log:PrintLog("[GameMatch:OnFail] Player_BattlePoints_Num" .. score, UGCS.Target.ArcherDuel.Config.GameConfig.FailAddScore)
    _GAME.GameUtils.SetPlayerRankScore(score + UGCS.Target.ArcherDuel.Config.GameConfig.FailAddScore)

    UI:SetVisible({106509}, true)
    UI:SetText({109444}, UGCS.Target.ArcherDuel.Config.GameConfig.FailAddScore.." 积分")
    System:FireGameEvent(_GAME.Events.GameEnd)
end

---------------------------------------- 黄金赛 ----------------------------------------

local GoldBattleStep = {
    [1] = { 1, 1, 1, 1, 0, 0, 0, 0 }, --第一局结束，1为胜者组，0为失败组
    [2] = { 1, 1, 0, 0, 0, 0 }, --第2局结束，1为胜者组，0为失败组，败者组中继续失败则被淘汰
    [3] = { 1, 0, 0, 0 },
    [4] = { 1, 0, 0 },
    [5] = { 1, 0 },
    [6] = { 1 },
}

-- 黄金赛在一开始就随机好保存所有对手信息
function GameMatch:InitGoldMatch()
    --隐藏领奖台
    TimerManager:AddFrame(10, function()
        Element:SetVisibility(MatchConfig.GoldSceneConfig[self.mapId].Podium, false)
    end)

    local function sample_unique(n, k)
        assert(k <= n, "k must be <= n")
        local t = {}
        for i = 1, n do t[i] = i end
        -- 部分 Fisher-Yates：只打乱前 k 个位置
        for i = 1, k do
            local j = math.random(i, n)
            t[i], t[j] = t[j], t[i]
        end
        local res = {}
        for i = 1, k do res[i] = t[i] end
        return res
    end

    local headIcons = GetHeadIconList()
    local curScore = _GAME.GameUtils.GetPlayerRankScore()
    
    table.insert(self.goldWinnerRivalInfo, {isSelf = true})
    -- 取 7 个不重复的整数
    local picks = sample_unique(#MatchConfig.PlayerName, 7)
    -- 保存随机7个对手的信息
    for i = 1, 7 do
        table.insert(self.goldWinnerRivalInfo, {
            failCount = 0, -- 失败次数，失败两次则被淘汰
            weapons = self:GetRandomWeapons(), -- 所有武器
            equipments = self:GetRandomEquipments(), -- 所有装备
            name = MatchConfig.PlayerName[picks[i]], -- 名字
            headIcon = headIcons[math.random(1, #headIcons)], -- 头像
            score = curScore+math.random(0, 200), -- 积分
        })
    end
    self:UpdateGoldHead()
end

-- 取一个黄金赛的对手出来
function GameMatch:GetGoldBattleRivalInfo()
    if self.goldFailCount == 0 then
        if self.isGoldFinalBattle then
            return self.goldFailerRivalInfo[1] -- 决赛，取出最后一位
        else
            return self.goldWinnerRivalInfo[2] -- 取出玩家后面一位
        end
    else
        if self.isGoldFinalBattle then
            return self.goldWinnerRivalInfo[1] -- 决赛，取出最后一位
        else
            return self.goldFailerRivalInfo[2] -- 取出玩家后面一位
        end
    end

    -- local index = math.random(1, #Rivals)
    -- local rival = Rivals[index]
    -- if self.goldBattleRival.name == rival.name then -- 排除上一局对手
    --     if index > 1 then
    --         return Rivals[index - 1]
    --     else
    --         return Rivals[index + 1]
    --     end
    -- else
    --     return Rivals[index]
    -- end
end

-- 开始黄金赛匹配
function GameMatch:StartGoldMatch()
    local MatchInfo = {}

    MatchInfo.MapId = self.mapId
    --随机战斗场景
    local Scene_ID = self.sceneIds[math.random(1, #self.sceneIds)]
    MatchInfo.SceneId = Scene_ID

    -- 从自己的武器类型池中随机一个武器类型
    local BattleWeapon = {}
    local weapons = {}
    for i, v in pairs(self.localWeapons) do
        table.insert(weapons, {weaponType = i, weaponId = v})
    end
    local weaponIndex = math.random(1, #weapons)
    BattleWeapon = weapons[weaponIndex]
    MatchInfo.BattleWeapon = BattleWeapon

    -- 黄金赛对手匹配
    local mathRivals, goldRivalInfo = self:GoldMathRivals()

    -- 从黄金赛中取一个对手
    self.goldBattleRival = {}
    -- 获取同类型武器
    self.goldBattleRival.weaponId = goldRivalInfo.weapons[BattleWeapon.weaponType]
    -- 名字
    self.goldBattleRival.name = goldRivalInfo.name
    -- 装备
    self.goldBattleRival.equipments = goldRivalInfo.equipments
    -- 积分
    self.goldBattleRival.score = goldRivalInfo.score
    -- 头像
    self.goldBattleRival.headIcon = goldRivalInfo.headIcon
    MatchInfo.BattleRivalInfo = self.goldBattleRival

    -- 剩余的匹配队伍
    self.goldShowBattleRivals = mathRivals
    MatchInfo.GoldShowBattleRivals = {}
    for i, v in ipairs(mathRivals) do
        MatchInfo.GoldShowBattleRivals[i] = {}
        for i2, v2 in ipairs(v) do
            MatchInfo.GoldShowBattleRivals[i][i2] = {
                weaponId = v2.weapons[BattleWeapon.weaponType],
                name = v2.name,
                equipments = v2.equipments,
            }
        end
    end

    Log:PrintDebug("zzzzzzz StartMatch zzzzzzz")
    Log:PrintTable(MatchInfo)

    -- 发送信号，通知战斗端数据已经准备好
    System:FireGameEvent(_GAME.Events.MatchInfoReady, MatchInfo)

    if self.goldBattleRound == 0 then
        -- 打开黄金赛分组界面
        UI:SetVisible(MatchConfig.MatchUI_Start,true)

        -- 加载表演
        local a = 1
        local timer =  TimerManager:AddLoopTimer(0.5,function ()
            a = a + 1
            local onesString = string.rep(".", a)
            UI:SetText({109967},"正在加载其他玩家"..onesString)
            if a == 3 then
                a = 0
            end
        end)

        TimerManager:AddTimer(3,function ()
            UI:SetVisible({110896},true)
            TimerManager:RemoveTimer(timer)
            TimerManager:AddTimer(0.5,function ()
                UI:SetVisible({110896},false)
                UI:SetVisible(MatchConfig.MatchUI_Start,false)
                -- 开始匹配倒计时
                self:MathCountDown(MatchInfo)
            end)
        end)
    else
        -- 开始匹配倒计时
        self:MathCountDown(MatchInfo)
    end
end

-- 黄金赛匹配对手
function GameMatch:GoldMathRivals()
    local MathRivals, BattleRival = {}, {} --匹配对手,战斗对手
    if self.isGoldFinalBattle then --最后一局，进行其他表演选手匹配
        local rival1 = self.goldWinnerRivalInfo[1]
        local rival2 = self.goldFailerRivalInfo[1]
        if rival1.isSelf then
            BattleRival = rival2
        elseif rival2.isSelf then
            BattleRival = rival1
        end
    else
        local function math(RivalInfo, isFail)
            if #RivalInfo < 2 then
                return
            end
            local battleIndex = 1
            while 2*battleIndex <= #RivalInfo do
                local rival1 = RivalInfo[battleIndex*2-1]
                local rival2 = RivalInfo[battleIndex*2]
                if rival1.isSelf then
                    BattleRival = rival2
                elseif rival2.isSelf then
                    BattleRival = rival1
                else
                    table.insert(MathRivals, {
                        rival1,
                        rival2
                    })
                end
                battleIndex = battleIndex + 1
            end
        end
        math(self.goldWinnerRivalInfo) -- 胜者组匹配
        math(self.goldFailerRivalInfo, true) -- 败者组匹配
    end

    return MathRivals, BattleRival
end

-- 黄金赛胜利
function GameMatch:OnGoldVictory()
    self.goldBattleResult = true

    if self.isGoldFinalBattle then --决赛胜出
        -- 最后一局，决出排名
        local top3Players = {}
        table.insert(top3Players, {isSelf = true}) -- 第一名自己
        table.insert(top3Players, self.goldBattleRival) -- 第二名本局对手
        table.insert(top3Players, self.lastDefeatRival) -- 第3名从剩下的人中取一个

        self:SaveGoldReward(1)
        self:ShowGoldTop3(top3Players)
        System:FireGameEvent(_GAME.Events.GameEnd)
        return
    end

    local selfIndex = 1
    if self.goldFailCount == 1 then
        for i, v in ipairs(self.goldFailerRivalInfo) do
            if v.isSelf then
                selfIndex = v.index
                break
            end
        end
    end
    local bWiner = self.goldFailCount == 0
    self:SetGoldHeadState(bWiner, true, nil, selfIndex)
    self:SetGoldHeadState(bWiner, false, self.goldBattleRival.name)

    -- 其他表演对手随机判定为负
    for i, v in pairs(self.goldShowBattleRivals) do
        local failIndex = math.random(1, 2)
        local bWiner = v[failIndex].failCount == 0
        self:SetGoldHeadState(bWiner, 1~=failIndex, v[1].name)
        self:SetGoldHeadState(bWiner, 2~=failIndex, v[2].name)
        self:GoldRivalDefeat(v[failIndex].name)
    end
    -- 当前对手判定为负
    self:GoldRivalDefeat(self.goldBattleRival.name)

    UI:SetVisible({105659,105654,105656,105662},false)
    UI:SetVisible({110038,110037,109970},true)
    UI:PlayUIAnimation(110037,1,0)

    TimerManager:AddTimer(1.5,function ()
        UI:SetVisible({110038,110037,109970}, false)
        -- 通知局内，进行镜头表演
        System:FireGameEvent(_GAME.Events.GoldShow)
    end)
end

-- 黄金赛失败
function GameMatch:OnGoldFail()
    self.goldBattleResult = false
    self.goldFailCount = self.goldFailCount + 1

    if self.goldFailCount == 2 then -- 失败2次，黄金赛结束
        local rank = #GoldBattleStep[self.goldBattleRound]
        if rank <= 3 then -- 3名以内，进行展示
            local top3Players = {}
            table.insert(top3Players, self.goldBattleRival) -- 第1名本局对手
            table.insert(top3Players, {isSelf = true}) -- 第2名自己
            table.insert(top3Players, self.lastDefeatRival) -- 第3名从剩下的人中取一个

            self:SaveGoldReward(2)
            self:ShowGoldTop3(top3Players)
            System:FireGameEvent(_GAME.Events.GameEnd)
        else
            -- 公布排名
            UI:SetVisible({110204, 110718},true)
            UI:SetText({110206},"第"..rank.."名")
            local CurrencyIconList = GetCurrencyIconList()
            for i, v in ipairs(MatchConfig.GoldEnd_Reward_UI) do
                local reward = GoldRewardConfig[rank][i]
                if reward then
                    local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[reward.id]
                    if cfg and cfg.iconIndex then
                        UI:SetImage({v.icon},CurrencyIconList[cfg.iconIndex],true)
                    end    
                    UI:SetText({v.text}, tostring(reward.count))
                end
            end

            self:SaveGoldReward(rank)
            System:FireGameEvent(_GAME.Events.GameEnd)
        end
        return
    end

    -- 其他表演对手随机判定为负
    for i, v in pairs(self.goldShowBattleRivals) do
        local failIndex = math.random(1, 2)
        local bWiner = v[failIndex].failCount == 0
        self:SetGoldHeadState(bWiner, 1~=failIndex, v[1].name)
        self:SetGoldHeadState(bWiner, 2~=failIndex, v[2].name)
        self:GoldRivalDefeat(v[failIndex].name)
    end

    -- 将自己放入败者组
    table.remove(self.goldWinnerRivalInfo, 1)
    table.insert(self.goldFailerRivalInfo, {isSelf = true})
    -- self:SetGoldHeadState(false, false, nil, true)

    UI:SetVisible({105659,105654,105656,105662},false)
    UI:SetVisible({110038,110048,109970},true)
    UI:PlayUIAnimation(110048,1,0)

    TimerManager:AddTimer(1.5,function ()
        UI:SetVisible({110038,110048,109970},false)
        -- 通知局内，进行镜头表演
        System:FireGameEvent(_GAME.Events.GoldShow)
    end)
end

-- 黄金赛某个人判负
function GameMatch:GoldRivalDefeat(name)
    for i = #self.goldFailerRivalInfo, 1, -1 do
        if self.goldFailerRivalInfo[i].name == name then
            -- 淘汰
            self.goldFailerRivalInfo[i].failCount = 2
            self.lastDefeatRival = table.remove(self.goldFailerRivalInfo, i)
            break
        end
    end
    for i = #self.goldWinnerRivalInfo, 1, -1 do
        if self.goldWinnerRivalInfo[i].name == name then
            -- 放入败者组
            self.goldWinnerRivalInfo[i].failCount = 1
            --重置位置标识
            self.goldWinnerRivalInfo[i].index = #self.goldFailerRivalInfo + 1
            table.insert(self.goldFailerRivalInfo, self.goldWinnerRivalInfo[i])
            table.remove(self.goldWinnerRivalInfo, i)
            break
        end
    end
end

--继续黄金赛
--黄金赛比赛规则，8个人总共会进行6场比赛，失败过一次的人会进入败者组，失败过2次的人会被淘汰，胜者组和败者组分别进行比赛
--依次类推，在第3局结束后，胜者组还会剩下最后一人，败者组还会剩下3人
--第四局和第五局为败者组中3人，依次进行比赛，决出败者组最后一人
--第6局为胜者组最后一人和败者组最后一人进行决赛
function GameMatch:OnGoldBattleContinue()
    self.goldBattleRound = self.goldBattleRound + 1
    self.isGoldFinalBattle = false
    if self.goldFailCount == 0 then --没有失败过，在胜者组
        if #self.goldWinnerRivalInfo < 2 then --胜者组中已经没有对手，此时败者组里面应该还剩3个，模拟两次对局
            for i = 1, 2 do
                self.goldBattleRound = self.goldBattleRound + 1
                local mathRivals = self:GoldMathRivals()
                for _, v in pairs(mathRivals) do
                    local failIndex = math.random(1, 2)
                    self:GoldRivalDefeat(v[failIndex].name)
                end
            end
            self.isGoldFinalBattle = true
            UI:SetVisible(MatchConfig.GoldWinner_UI,true)
            UI:SetVisible(MatchConfig.GoldFailer_UI,false)
            UI:SetText({110081},"决赛")
        else
            UI:SetVisible(MatchConfig.GoldWinner_UI,true)
            UI:SetVisible(MatchConfig.GoldFailer_UI,false)
            UI:SetText({110081},"胜者组"..string.rep("丨", self.goldBattleRound ))
        end
    elseif self.goldFailCount == 1 then --失败过一次，在败者组
        if #self.goldFailerRivalInfo > 1 then --败者组有两人以上对手
            UI:SetVisible(MatchConfig.GoldFailer_UI,true)
            UI:SetVisible(MatchConfig.GoldWinner_UI,false)
            UI:SetText({110075},"败者组"..string.rep("丨", self.goldBattleRound ))
        else
            UI:SetVisible(MatchConfig.GoldFailer_UI,true)
            UI:SetVisible(MatchConfig.GoldWinner_UI,false)
            UI:SetText({110081},"决赛")
            self.isGoldFinalBattle = true
        end
    end

    UI:SetVisible(MatchConfig.MatchUI_Next,true)

    -- 下一局奖励，按照下一局赢之后全输的情况来计算
    local step = GoldBattleStep[self.goldBattleRound-1 + 2-self.goldFailCount] -- 按照后两局全输来决定排名奖励
    local rank = #step
    local CurrencyIconList = GetCurrencyIconList()
    local rewardUI = self.goldFailCount == 0 and MatchConfig.GoldWinner_Reward_UI or MatchConfig.GoldFailer_Reward_UI
    for i, v in ipairs(rewardUI) do
        local reward = GoldRewardConfig[rank][i]
        if reward then
            local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[reward.id]
            if cfg and cfg.iconIndex then
                UI:SetImage({v.icon},CurrencyIconList[cfg.iconIndex],true)
            end    
            UI:SetText({v.text}, tostring(reward.count))
        end
    end

    -- 如果是败者组第二局，比较特殊，34为这一局新加入的对手，但是需要分别和12匹配，在这里手动调整一下顺位
    if self.goldBattleRound == 2 then
        local info = table.remove(self.goldFailerRivalInfo, 4)
        table.insert(self.goldFailerRivalInfo, 1, info)
    end

    self:UpdateGoldHead()
end

-- 黄金赛Top3展示
function GameMatch:ShowGoldTop3(top3Players)
    Element:SetVisibility(MatchConfig.GoldSceneConfig[self.mapId].Podium, true) --显示领奖台

    local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig

    local function CreateFakePlayer(top, Equipments, isSelf)
        local PosElemnt = MatchConfig.GoldSceneConfig[self.mapId]["Top"..top]
        Element:SetVisibility(PosElemnt, false)
        local pos = Element:GetPosition(PosElemnt)
        local rot = Element:GetRotation(PosElemnt)
        local UID = FakeCharacter:CreateCharacter(pos, rot-Engine.Vector(0,0,90), Engine.Vector(1,1,1), false)

        if Equipments then
            local bodyIds = {}
            for i, v in pairs(Equipments) do
                if EquipmentConfig[v] and EquipmentConfig[v].EquipID then
                    table.insert(bodyIds, EquipmentConfig[v].EquipID)
                end
            end
            if isSelf then
                FakeCharacter:ChangeBodyFromPlayer(UID, self.localPlayerId)
            else
                FakeCharacter:ChangeCharacterBody(UID, bodyIds)
            end
        end
        if top == 1 then
            TimerManager:AddTimer(1, function()
                FakeCharacter:PlayAnim(UID, "ChooseMale")
            end)
        end
    end

    local rank = 1
    for i, v in ipairs(top3Players) do
        local equipments = v.equipments
        if v.isSelf then
            rank = i
            equipments = self.localEquipments
        end
        CreateFakePlayer(i, equipments, v.isSelf)
    end

    Camera:MovieCameraStart(MatchConfig.GoldSceneConfig[self.mapId].Camera)
    -- 移动相机
    local pos = Element:GetPosition(MatchConfig.GoldSceneConfig[self.mapId].Podium)
    Element:MoveTo(MatchConfig.GoldSceneConfig[self.mapId].Camera,pos+Engine.Vector(3000,0,1000),1,Element.CURVE.linear)
    Element:SetForward(MatchConfig.GoldSceneConfig[self.mapId].Camera, -Element:GetForward(MatchConfig.GoldSceneConfig[self.mapId].Podium))

    TimerManager:AddTimer(1, function()
        -- 公布排名
        UI:SetVisible(MatchConfig.GoldTop3_Show_UI,true)
        UI:SetText({110787}, "第"..rank.."名")

        local CurrencyIconList = GetCurrencyIconList()
        for i, v in ipairs(MatchConfig.GoldTop3_Reward_UI) do
            local reward = GoldRewardConfig[rank][i]
            if reward then
                local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[reward.id]
                if cfg and cfg.iconIndex then
                    UI:SetImage({v.icon},CurrencyIconList[cfg.iconIndex],true)
                end    
                UI:SetText({v.text}, tostring(reward.count))
            end
        end
    end)
end

function GameMatch:SetGoldHeadState(bWiner, victory, name, isSelf)
    local Head_UI, RivalInfo
    if bWiner then --在胜者组
        Head_UI = MatchConfig.GoldWinner_Head_UI
        RivalInfo = self.goldWinnerRivalInfo
    else --在败者组
        Head_UI = MatchConfig.GoldFailer_Head_UI
        RivalInfo = self.goldFailerRivalInfo
    end

    local index = 0
    for i, v in ipairs(RivalInfo) do
        if (v.name == name) or (isSelf and v.isSelf) then
            index = i
            break
        end
    end

    local UIs = Head_UI[self.goldBattleRound]
    if UIs and UIs[index] then
        local state = victory and 1 or 2 --1:胜利，2:失败
        self.goldHeadStates[state] = self.goldHeadStates[state] or {}
        table.insert(self.goldHeadStates[state], UIs[index])
    end
end

function GameMatch:UpdateGoldHead()
    if self.goldBattleRound == 0 then -- 分组赛
        for i, v in ipairs(self.goldWinnerRivalInfo) do
            if v.isSelf then
                UI:SetImage({MatchConfig.Gold_Head_UI[i]}, Chat:GetCustomHeadIcon(self.localPlayerId), true)
            else
                UI:SetImage({MatchConfig.Gold_Head_UI[i]}, v.headIcon, true)
            end
        end
    else
        local Head_UI, RivalInfo
        if self.goldFailCount == 0 then --在胜者组
            Head_UI = MatchConfig.GoldWinner_Head_UI
            RivalInfo = self.goldWinnerRivalInfo
        else --在败者组
            Head_UI = MatchConfig.GoldFailer_Head_UI
            RivalInfo = self.goldFailerRivalInfo
        end
        local UIs = Head_UI[self.goldBattleRound]
        if UIs then
            local index = 0
            for i, v in ipairs(RivalInfo) do
                index = index + 1
                UI:SetVisible({UIs[index]}, true)
                if v.isSelf then
                    UI:SetImage({UIs[index]}, Chat:GetCustomHeadIcon(self.localPlayerId), true)
                else
                    UI:SetImage({UIs[index]}, v.headIcon, true)
                end
                UI:SetImageColor({UIs[index]}, self.goldBattleRound == 1 and "#FFFFFF" or "#0DEF0D")
            end
            for i = self.goldBattleRound+1, #Head_UI do
                UI:SetVisible(Head_UI[i], false)
            end
        end
        UI:SetImageColor(self.goldHeadStates[1], "#0DEF0D")
        UI:SetImageColor(self.goldHeadStates[2], "#EF1414")
    end
end

-- 黄金赛中途退出
function GameMatch:GoldExist()
    if self.goldBattleRound == 0 then return end

    local step = GoldBattleStep[self.goldBattleRound-1 + 2-self.goldFailCount] -- 按照后两局全输来决定排名奖励
    local rank = #step
    self:SaveGoldReward(rank)
end

-- 保存黄金赛奖励
function GameMatch:SaveGoldReward(rank)
    local GoldReward = GoldRewardConfig[rank]
    for i, v in pairs(GoldReward) do
        local cfg = UGCS.Target.ArcherDuel.Config.ResourceConfig[v.id]
        if cfg then
            _GAME.GameUtils.AddPlayerReward(cfg.archive, v.count)
        end
    end
end

return GameMatch