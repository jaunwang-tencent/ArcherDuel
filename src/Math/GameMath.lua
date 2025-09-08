local GameMath = {}
local match_UI = {105664,105674,105675,105671,105670,105710,106082,106084,106085}
local MatchUI_Start = {110069,110072,110070,109965,110071,109970,110065}
local MatchUI_Next = {109965,110108,110079,110069,110109,110070}
local GoldSceneConfig = { -- 黄金赛场景配置
    [7] = {
        Podium = 632, -- 领奖台
        Top1 = 619, -- 第一名
        Top2 = 621, -- 第二名
        Top3 = 623, -- 第三名
        Camera = 475, -- 相机
    }
}

local MatchConfig = require("Math.MatchConfig")
math.randomseed(TimerManager:GetClock()) -- 设置随机数种子

function GameMath:Init()
    Log:PrintLog("[GameMath:Init]")

    -- 构造武器类型表
    self.WeaponMap = {}
    for i, v in pairs(UGCS.Target.ArcherDuel.Config.WeaponConfig) do
        self.WeaponMap[v.TypeName] = self.WeaponMap[v.TypeName] or {}
        table.insert(self.WeaponMap[v.TypeName], i)
    end

    -- 构造装备类型表
    self.EquipmentMap = {}
    for i, v in pairs(UGCS.Target.ArcherDuel.Config.EquipmentConfig) do
        self.EquipmentMap[v.TypeName] = self.EquipmentMap[v.TypeName] or {}
        table.insert(self.EquipmentMap[v.TypeName], i)
    end

    self.LocalPlayerId = Character:GetLocalPlayerId()
    --获取当前地图
    self.MapId = Archive:GetPlayerData(self.LocalPlayerId, Archive.TYPE.Number, "BattleStage")
    if not self.MapId or self.MapId == 0 then
        self.MapId = CustomProperty:GetCustomProperty(System:GetScriptParentID(), "MapId", CustomProperty.PROPERTY_TYPE.Number)
    end
    self.IsGold = false -- 是否是黄金赛地图
    
    --构造场景表
    self.SceneIds = {}
    if UGCS.Target.ArcherDuel.Config.SceneConfig[self.MapId] then
        self.IsGold = UGCS.Target.ArcherDuel.Config.SceneConfig[self.MapId].IsGold
        for i, v in pairs(UGCS.Target.ArcherDuel.Config.SceneConfig[self.MapId].Resource) do
            if type(i) == "number" then
                table.insert(self.SceneIds, i)
            end
        end
    end

    --读取保存当前玩家能够使用武器
    self.LocalWeapons = {}
    local Bow_Num = Archive:GetPlayerData(self.LocalPlayerId, Archive.TYPE.Number, "Equipped_Bow_Num")
    if Bow_Num and Bow_Num > 0 then
        self.LocalWeapons["Bow"] = Bow_Num -- 弓
    end
    local Axe_Num = Archive:GetPlayerData(self.LocalPlayerId, Archive.TYPE.Number, "Equipped_Axe_Num")
    if Axe_Num and Axe_Num > 0 then
        self.LocalWeapons["Axe"] = Axe_Num -- 斧
    end
    local Spear_Num = Archive:GetPlayerData(self.LocalPlayerId, Archive.TYPE.Number, "Equipped_Spear_Num")
    if Spear_Num and Spear_Num > 0 then
        self.LocalWeapons["Spear"] = Spear_Num -- 矛
    end
    if #self.LocalWeapons == 0 then -- 试玩兜底
        self.LocalWeapons = {
            ["Bow"] = 1,
            ["Axe"] = 2,
            ["Spear"] = 3,
        }
    end

    -- 当前玩家穿戴装备
    self.LocalEquipments = {}
    local Part_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Part_Num")
    if Part_Num and Part_Num > 0 then
        self.LocalEquipments["Part"] = Part_Num
    end
    local Bottoms_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Bottoms_Num")
    if Bottoms_Num and Bottoms_Num > 0 then
        self.LocalEquipments["Bottoms"] = Bottoms_Num
    end
    local Cloth_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Cloth_Num")
    if Cloth_Num and Cloth_Num > 0 then
        self.LocalEquipments["Cloth"] = Cloth_Num
    end

    --黄金赛缓存数据
    self.GoldWinnerRivalInfo = {} -- 黄金赛胜者组
    self.GoldFailerRivalInfo = {} -- 黄金赛败者组
    self.GoldRival = {} -- 黄金赛当前对手
    self.GoldShowBattleRivals = {} -- 黄金赛本次表演者
    self.GoldFailCount = 0 -- 黄金赛失败次数
    self.GoldCurResult = false -- 黄金赛当前结果
    self.GoldRound = 0 -- 黄金赛轮次
    self.IsGoldFinalBattle = false -- 是否为黄金赛最后一轮

    if self.IsGold then
        self:InitGoldMatch()
    end

    self:BindEvents()
end

function GameMath:OnStart()
    Log:PrintLog("[GameMath:OnStart]")
end

-- 游戏结束
function GameMath:OnEnd()
    Log:PrintLog("[GameMath:OnEnd]")
end

------------------------------ 匹配 ------------------------------
-- 绑定事件
function GameMath:BindEvents()
    -- 收到开始匹配的事件
    System:RegisterGameEvent(_GAME.Events.StartMatch, function()
        if self.IsGold then
            self:StartGoldMatch()
        else
            self:StartMatch()
        end
    end)

    -- 收到对局胜利的事件
    System:RegisterGameEvent(_GAME.Events.BattleVictory, function ()
        if self.IsGold then
            self:OnGoldVictory()
        else
            self:OnVictory()
        end
    end)
    
    -- 收到对局失败的事件
    System:RegisterGameEvent(_GAME.Events.BattleFail,function ()
        if self.IsGold then
            self:OnGoldFail()
        else
            self:OnFail()
        end
    end)

    -- 胜利界面点击再来一次
    UI:RegisterPressed(108060,function ()
        UI:SetVisible({108053,108052,108050,108057,108048,108480},false)
        System:FireGameEvent(_GAME.Events.StartMatch)
    end)

    -- 胜利界面点击返回大厅
    UI:RegisterPressed(108059,function ()
        UI:SetVisible({108053,108052,108050,108057,108048,108480},false)
        System:FireSignEvent("GoHome")
    end)

    -- 开箱表演动画
    UI:RegisterPressed(108303,function ()
        UI:SetVisible({108298},false)
        UI:SetVisible({108048},true)
        TimerManager:AddTimer(2.3,function ()
            UI:SetVisible({108053},true)
            UI:PlayUIAnimation(108053,1,0)
            UI:SetVisible({108052,108050},true)
            UI:PlayUIAnimation(108050,1,0)
            UI:PlayUIAnimation(108052,1,0)
        end)

        TimerManager:AddTimer(3,function ()
            UI:EffectPausePlay(108056)
            TimerManager:AddTimer(1.3,function ()
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
        UI:SetVisible({106509}, false)
        System:FireGameEvent(_GAME.Events.StartMatch)
    end)

    -- 失败界面点击返回大厅
    UI:RegisterClicked(106512, function()
        UI:SetVisible({106509}, false)
        System:FireSignEvent("GoHome")
    end)

    -- 黑屏动画
    System:RegisterGameEvent(_GAME.Events.BlackScreen,function ()
        UI:SetVisible({109970,110054},true)
        UI:PlayUIAnimation(110054,1,1)
        TimerManager:AddTimer(2,function ()
            -- 关闭黑屏动画
            UI:SetVisible({109970,110054},false)
        end)
    end)

    --- 黄金赛点击继续比赛
    UI:RegisterClicked(110079,function ()
        UI:SetVisible({110085,110082},false)
        UI:SetVisible({110074,110078},false)
        UI:SetVisible(MatchUI_Next,false)

        System:FireGameEvent(_GAME.Events.StartMatch)
    end)

    -- 黄金赛结束
    UI:RegisterClicked(110205,function ()
        UI:SetVisible({110204},false)
        System:FireSignEvent("GoHome")
    end)
end

-- 随机获取一套装备
function GameMath:GetRandomEquipments()
    local equipments = {}
    for i, v in pairs(self.EquipmentMap) do
        local index = math.random(1, #v)
        equipments[i] = v[index]
    end
    return equipments
end

-- 随机获取一套武器
function GameMath:GetRandomWeapons()
    local weapons = {}
    for i, v in pairs(self.WeaponMap) do
        local index = math.random(1, #v)
        weapons[i] = v[index]
    end
    return weapons
end

-- 开始匹配
function GameMath:StartMatch()
    local MatchInfo = {}

    MatchInfo.MapId = self.MapId
    --随机战斗场景
    local Scene_ID = self.SceneIds[math.random(1, #self.SceneIds)]
    MatchInfo.SceneId = Scene_ID

    -- 从自己的武器类型池中随机一个武器类型
    local BattleWeapon = {}
    local weapons = {}
    for i, v in pairs(self.LocalWeapons) do
        table.insert(weapons, {weaponType = i, weaponId = v})
    end
    local weaponIndex = math.random(1, #weapons)
    BattleWeapon = weapons[weaponIndex]
    MatchInfo.BattleWeapon = BattleWeapon

    --存储随机敌人
    local BattleRivalInfo = {}
    -- 随机一把同类型武器
    local weaponIds = self.WeaponMap[BattleWeapon.weaponType]
    BattleRivalInfo.weaponId = weaponIds[math.random(1, #weaponIds)]
    -- 随机名字
    BattleRivalInfo.name = MatchConfig.PlayerName[math.random(1, #MatchConfig.PlayerName)]
    -- 随机装备
    BattleRivalInfo.equipments = self:GetRandomEquipments()
    MatchInfo.BattleRivalInfo = BattleRivalInfo

    Log:PrintDebug("zzzzzzz StartMatch zzzzzzz")
    Log:PrintTable(MatchInfo)

    -- 发送信号，通知战斗端数据已经准备好
    System:FireGameEvent(_GAME.Events.MatchInfoReady, MatchInfo)

    -- 开始匹配倒计时
    self:MathCountDown(MatchInfo)
end

-- 匹配倒计时
function GameMath:MathCountDown(MatchInfo)
    UI:SetVisible(MatchUI_Next,false)
    -- 地图名称
    UI:SetText({105665},MatchConfig.Map[self.MapId].name)

    UI:SetVisible({105710},true)-- 打开特效界面
    UI:SetVisible({100468,100528,100531},false)
    -- UI:SetVisible(zhuye,false)
    UI:SetVisible({105664,105670,105671,105674,105675},true)
    TimerManager:AddTimer(0.1,function ()
        -- 对战双方名字和头像
        UI:SetImage({105676},Chat:GetCustomHeadIcon(self.LocalPlayerId))
        UI:SetText({105685}, Chat:GetCustomName(self.LocalPlayerId))
        UI:SetText({105680}, MatchInfo.BattleRivalInfo.name)
        -- 对战双方装备图标
        -- 武器Id
        -- RivalInfo.weaponId
        -- myWeaponId
        -- 身体Id
        -- RivalInfo.equipments.Part
        -- Part_Num
        -- 上衣Id
        -- RivalInfo.equipments.Cloth
        -- Cloth_Num
        -- 下衣Id
        -- RivalInfo.equipments.Bottoms
        -- Bottoms_Num
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
        UI:SetVisible(match_UI,false)
        System:FireGameEvent(_GAME.Events.BattleStart)
    end)
end

-- 普通赛胜利
function GameMath:OnVictory()
    UI:SetVisible({108298},true)
    local progress = 0
    local animation = nil
    animation =  TimerManager:AddLoopTimer(1/20,function ()
        progress = progress + 1
        UI:SetProgressCurrentValue({108302},progress)
        if progress == 20 then
            TimerManager:RemoveTimer(animation)
        end
    end)
    System:FireGameEvent(_GAME.Events.GameEnd)
end

-- 普通赛失败
function GameMath:OnFail()
    UI:SetVisible({106509}, true)
    System:FireGameEvent(_GAME.Events.GameEnd)
end

---------------------------------------- 黄金赛 ----------------------------------------

-- 黄金赛在一开始就随机好保存所有对手信息
function GameMath:InitGoldMatch()
    --隐藏领奖台
    TimerManager:AddFrame(10, function()
        Element:SetVisibility(GoldSceneConfig[self.MapId].Podium, false)
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

    -- 取 7 个不重复的整数
    local picks = sample_unique(#MatchConfig.PlayerName, 7)
    -- 保存随机7个对手的信息
    for i = 1, 7 do
        table.insert(self.GoldWinnerRivalInfo, {
            failCount = 0, -- 失败次数，失败两次则被淘汰
            weapons = self:GetRandomWeapons(), -- 所有武器
            equipments = self:GetRandomEquipments(), -- 所有装备
            name = MatchConfig.PlayerName[picks[i]], -- 名字
        })
    end
end

-- 取一个黄金赛的对手出来
function GameMath:GetGoldBattleRivalInfo()
    local Rivals
    if self.GoldFailCount == 0 then
        if #self.GoldWinnerRivalInfo > 0 then
            -- 在胜者组里面随机
            Rivals = self.GoldWinnerRivalInfo
        else
            -- 胜者组里面已经空了，但是还有一局决赛，从败者组里面取一个
            Rivals = self.GoldFailerRivalInfo
        end
    else
        -- 在败者组里面随机
        Rivals = self.GoldFailerRivalInfo
    end

    local index = math.random(1, #Rivals)
    local rival = Rivals[index]
    if self.GoldRival.name == rival.name then -- 排除上一局对手
        if index > 1 then
            return Rivals[index - 1]
        else
            return Rivals[index + 1]
        end
    else
        return Rivals[index]
    end
end


-- -- 开始黄金赛匹配
-- local function StartGoldMatch()
--     local playerId = Character:GetLocalPlayerId()

--     -- 存储自身本局武器
--     -- 从自己的武器类型池中随机一个武器类型
--     local weaponIndex = math.random(1, #self.LocalWeapons)
--     local myWeapon = self.LocalWeapons[weaponIndex]
--     Archive:SetPlayerData(playerId, Archive.TYPE.Number, "BattleWeapon", myWeapon.weaponId)
--     Log:PrintDebug("StartGoldMatch zzzzzzz BattleWeapon", myWeapon.weaponId)

--     -- 从黄金赛中随机一个对手
--     local goldRivalInfo = GetGoldBattleRivalInfo()
--     -- 获取同类型武器
--     GoldRival.weaponId = goldRivalInfo.weapons[myWeapon.weaponType]
--     -- 名字
--     GoldRival.name = goldRivalInfo.name
--     -- 装备
--     GoldRival.equipments = goldRivalInfo.equipments

--     local jsonStr = MiscService:Table2JsonStr(GoldRival)
--     Archive:SetPlayerData(playerId, Archive.TYPE.String, "BattleRivalInfo", jsonStr)
--     Log:PrintDebug("StartGoldMatch zzzzzzz BattleRivalInfo", jsonStr)

--     --随机战斗场景
--     local sceneIds = MatchConfig.Map[MapId].sceneIds
--     local Scene_ID = sceneIds[math.random(1, #sceneIds)]
--     Archive:SetPlayerData(playerId, Archive.TYPE.Number, "BattleStage_Ordinal", Scene_ID)
--     Log:PrintDebug("StartGoldMatch zzzzzzz BattleStage_Ordinal", Scene_ID)

--     -- 取出剩下的所有人进行匹配
--     GoldShowBattleRivals = {}
--     if not IsGoldFinalBattle then --非最后一局，进行其他表演选手匹配
--         local battleIndex = 1
--         local function math(RivalInfo)
--             for i, v in ipairs(RivalInfo) do
--                 GoldShowBattleRivals[battleIndex] = GoldShowBattleRivals[battleIndex] or {}
--                 if #GoldShowBattleRivals[battleIndex] < 2 then
--                     if v.name ~= GoldRival.name then
--                         table.insert(GoldShowBattleRivals[battleIndex], v)
--                     end
--                 end
--                 if #GoldShowBattleRivals[battleIndex] == 2 then
--                     battleIndex = battleIndex + 1
--                 end
--             end
--         end
--         math(self.GoldWinnerRivalInfo) -- 胜者组匹配
--         math(self.GoldFailerRivalInfo) -- 败者组匹配
--     end

--     local jsonStr = MiscService:Table2JsonStr(GoldShowBattleRivals)
--     Archive:SetPlayerData(playerId, Archive.TYPE.String, "GoldShowBattleInfo", jsonStr)
--     Log:PrintDebug("StartGoldMatch zzzzzzz GoldShowBattleInfo", jsonStr)
--     for i, v in ipairs(GoldShowBattleRivals) do
--         for i2, v2 in ipairs(v) do
--             Log:PrintDebug("GoldShowBattleRivals["..i2.."] = "..v2.name.." "..v2.failCount)
--         end
--     end

--     -- 发送信号，通知战斗端数据已经准备好
--     Log:PrintDebug("FireSignEvent: Battle Storage ", MapId, Scene_ID)
--     System:FireSignEvent("Battle Storage")

--     if GoldRound == 0 then
--         -- 打开黄金赛分组界面
--         UI:SetVisible(MatchUI_Start,true)

--         -- 加载表演
--         local a = 1
--         local timer =  TimerManager:AddLoopTimer(0.5,function ()
--             a = a + 1
--             local onesString = string.rep(".", a)
--             UI:SetText({109967},"正在加载其他玩家"..onesString)
--             if a == 3 then
--                 a = 0
--             end
--         end)

--         TimerManager:AddTimer(3,function ()
--             UI:SetVisible({109969},true)
--             TimerManager:RemoveTimer(timer)
--             TimerManager:AddTimer(0.5,function ()
--                 UI:SetVisible({109969},false)
--                 UI:SetVisible(MatchUI_Start,false)
--                 -- 开始匹配倒计时
--                 MathCountDown(GoldRival, myWeapon.weaponId)
--             end)
--         end)
--     else
--         -- 开始匹配倒计时
--         MathCountDown(GoldRival, myWeapon.weaponId)
--     end
-- end

-- -- 黄金赛Top3展示
-- local function ShowGoldTop3(top3Players)
--     Element:SetVisibility(GoldSceneConfig[MapId].Podium, true) --显示领奖台

--     local function CreateFakePlayer(top, Equipments)
--         local PosElemnt = GoldSceneConfig[MapId]["Top"..top]
--         local pos = Element:GetPosition(PosElemnt)
--         local rot = Element:GetRotation(PosElemnt)
--         local UID = FakeCharacter:CreateCharacter(pos, rot-Engine.Vector(0,0,90), Engine.Vector(1,1,1), false)

--         if Equipments then
--             local bodyIds = {}
--             for i, v in pairs(Equipments) do
--                 if EquipmentConfig[v] and EquipmentConfig[v].EquipID then
--                     table.insert(bodyIds, EquipmentConfig[v].EquipID)
--                 end
--             end
--             FakeCharacter:ChangeCharacterBody(UID, bodyIds)
--         end
--     end

--     for i, v in ipairs(top3Players) do
--         local equipments = v.equipments
--         if v.isSelf then
--             equipments = {}
--             table.insert(equipments, Part_Num)
--             table.insert(equipments, Bottoms_Num)
--             table.insert(equipments, Cloth_Num)
--         end
--         CreateFakePlayer(i, equipments)
--     end

--     Camera:MovieCameraStart(GoldSceneConfig[MapId].Camera)
--     -- 移动相机
--     local pos = Element:GetPosition(GoldSceneConfig[MapId].Podium)
--     Element:MoveTo(GoldSceneConfig[MapId].Camera,pos+Engine.Vector(2000,0,1000),1,Element.CURVE.linear)
-- end

-- -- 黄金赛某个人判负
-- local function GoldRivalDefeat(name)
--     for i = #self.GoldFailerRivalInfo, 1, -1 do
--         if self.GoldFailerRivalInfo[i].name == name then
--             -- 淘汰
--             self.GoldFailerRivalInfo[i].failCount = 2
--             table.remove(self.GoldFailerRivalInfo, i)
--             break
--         end
--     end
--     for i = #self.GoldWinnerRivalInfo, 1, -1 do
--         if self.GoldWinnerRivalInfo[i].name == name then
--             -- 放入败者组
--             self.GoldWinnerRivalInfo[i].failCount = 1
--             table.insert(self.GoldFailerRivalInfo, self.GoldWinnerRivalInfo[i])
--             table.remove(self.GoldWinnerRivalInfo, i)
--             break
--         end
--     end
-- end

-- --继续黄金赛
-- --黄金赛比赛规则，每个人有2次比赛机会，如果2次比赛都失败，则被淘汰
-- --如果玩家一直获胜，则到了最后会变成，第三局结束之后胜者组只剩玩家一人，玩家需要从败者组中的最后2位中随机一个对手，进行决赛局，获胜则冠军，失败则亚军。
-- System:RegisterSignEvent("GoldBattleContinue",function ()
--     GoldRound = GoldRound + 1
--     IsGoldFinalBattle = false
--     if GoldCurResult then
--         if GoldRound > 3 then --从第四轮起，都显示决赛
--             -- 胜者组为空，决赛开始
--             UI:SetVisible({110085,110082},true)
--             UI:SetVisible({110074,110078},false)
--             UI:SetText({110081},"决赛")
--             if self.GoldFailCount == 0 and GoldRound == 4 then --一直在胜者组，第四轮就是最后一局
--                 IsGoldFinalBattle = true
--             elseif self.GoldFailCount == 1 and GoldRound == 5 then --败者组，第5轮就是最后一局
--                 IsGoldFinalBattle = true
--             end
--         else
--             if self.GoldFailCount == 0 then --没有失败过，在胜者组
--                 UI:SetVisible({110085,110082},true)
--                 UI:SetVisible({110074,110078},false)
--                 UI:SetText({110081},"胜者组"..string.rep("丨", GoldRound ))
--             else
--                 UI:SetVisible({110074,110078},true)
--                 UI:SetVisible({110085,110082},false)
--                 UI:SetText({110075},"败者组"..string.rep("丨", GoldRound ))
--             end
--         end
--     else
--         if GoldRound == 5 then --败者组，第5轮就是最后一局
--             -- 胜者组为空，决赛开始
--             UI:SetVisible({110085,110082},true)
--             UI:SetVisible({110074,110078},false)
--             UI:SetText({110081},"决赛")
--             IsGoldFinalBattle = true
--         else
--             UI:SetVisible({110074,110078},true)
--             UI:SetVisible({110085,110082},false)
--             UI:SetText({110075},"败者组"..string.rep("丨", GoldRound-1 ))
--         end
--     end

--     Log:PrintDebug("self.GoldWinnerRivalInfo:")
--     for i, v in pairs(self.GoldWinnerRivalInfo) do
--         Log:PrintDebug("self.GoldWinnerRivalInfo["..i.."] = "..v.name.." "..v.failCount)
--     end
--     Log:PrintDebug("self.GoldFailerRivalInfo:")
--     for i, v in pairs(self.GoldFailerRivalInfo) do
--         Log:PrintDebug("self.GoldFailerRivalInfo["..i.."] = "..v.name.." "..v.failCount)
--     end
    
--     UI:SetVisible(MatchUI_Next,true)
-- end)

-- -- 黄金赛失败
-- local function OnGoldFail()
--     GoldCurResult = false
--     self.GoldFailCount = self.GoldFailCount + 1


--     if IsGoldFinalBattle then --决赛失败
--         -- 最后一局，决出排名
--         local top3Players = {}
--         table.insert(top3Players, GoldRival) -- 第1名本局对手
--         table.insert(top3Players, {isSelf = true}) -- 第2名自己
--         table.insert(top3Players, GetGoldBattleRivalInfo()) -- 第3名从剩下的人中随便取一个

--         ShowGoldTop3(top3Players)
--         -- 通知局内，已经结束了，公布排名
--         local jsonStr = MiscService:Table2JsonStr(top3Players)
--         Archive:SetPlayerData(playerId, Archive.TYPE.String, "Top3Players", jsonStr)
--         TimerManager:AddFrame(1, function()
--             System:FireSignEvent("Game End")
--         end)
--         return
--     end

--     if self.GoldFailCount == 2 then -- 失败2次，被淘汰
--         -- 公布排名
--         local Rank = 0
--         if GoldRound == 2 then
--             Rank = 8
--         elseif GoldRound == 3 then
--             Rank = 6
--         elseif GoldRound == 4 then
--             Rank = 4
--         end
--         UI:SetVisible({110204},true)
--         UI:SetText({110206},"第"..Rank.."名")
--         TimerManager:AddFrame(1, function()
--             System:FireSignEvent("Game End")
--         end)
--         return
--     end

--     -- 其他表演对手随机判定为负
--     for i, v in pairs(GoldShowBattleRivals) do
--         local index = math.random(1, 2)
--         GoldRivalDefeat(v[index].name)
--     end

--     UI:SetVisible({105659,105654,105656,105662},false)
    
--     UI:SetVisible({110085,110082},false)
--     UI:SetVisible({110074,110078},true)

--     TimerManager:AddTimer(1.5,function ()
--         UI:SetVisible({110038,110037,109970},false)
--         -- 通知局内，进行镜头表演
--         System:FireSignEvent("Gold Show")
--     end)
-- end

-- -- 黄金赛胜利
-- local function OnGoldVictory()
--     GoldCurResult = true

--     if IsGoldFinalBattle then --决赛胜出
--         -- 最后一局，决出排名
--         local top3Players = {}
--         table.insert(top3Players, {isSelf = true}) -- 第一名自己
--         table.insert(top3Players, GoldRival) -- 第二名本局对手
--         table.insert(top3Players, GetGoldBattleRivalInfo()) -- 第3名从剩下的人中随便取一个

--         ShowGoldTop3(top3Players)
--         -- 通知局内，已经结束了，公布排名
--         local jsonStr = MiscService:Table2JsonStr(top3Players)
--         Archive:SetPlayerData(playerId, Archive.TYPE.String, "Top3Players", jsonStr)
--         TimerManager:AddFrame(1, function()
--             System:FireSignEvent("Game End")
--         end)
--         return
--     end

--     -- 当前对手判定为负
--     GoldRivalDefeat(GoldRival.name)
--     -- 其他表演对手随机判定为负
--     for i, v in pairs(GoldShowBattleRivals) do
--         local index = math.random(1, 2)
--         GoldRivalDefeat(v[index].name)
--     end

--     UI:SetVisible({105659,105654,105656,105662},false)

--     UI:SetVisible({110038,110037,109970},true)
--     UI:PlayUIAnimation(110037,1,0)

--     TimerManager:AddTimer(1.5,function ()
--         UI:SetVisible({110038,110037,109970},false)
--         -- 通知局内，进行镜头表演
--         System:FireSignEvent("Gold Show")
--     end)
-- end

return GameMath