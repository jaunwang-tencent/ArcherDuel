--游戏系统状态机【局外】
local SystemFSM = UGCS.RTTI.Class("SystemFSM", UGCS.Framework.FSM)
local SceneConfigTable = UGCS.Target.ArcherDuel.Config.SceneConfig

local function shuffle(t)
    for i = #t, 2, -1 do
        local j = math.random(1, i)
        t[i], t[j] = t[j], t[i]
    end
    return t
end

-- 返回一个新的被打乱的数组（不修改原数组）
local function shuffled_copy(src)
    local t = {}
    for i = 1, #src do t[i] = src[i] end
    return shuffle(t)
end

--- 构造
---@param Context 上下文
function SystemFSM:OnCreate(Context)
    SystemFSM.super.OnCreate(self, Context)

    --初始化系统设置
    self:InitSetting()

    Context = {
        --场景
        Scene = {
            --战斗情境
            Situation = 1,    --1-海岛，2-雪地，3-城市，4-天空遗迹，5-沙漠，6-太空，7-室外，8-室内
            --战斗场景
            Index = 1
        },
        --武器
        Weapon = {
            Index = UMath:GetRandomInt(1, 3),
        },
        Character = {
            Index = 1
        },
        --对手信息
        RivalInfo = {
            Name = "神箭手",
            WeaponId = 1,
            Equipments = {}
        },
        --黄金赛信息
        GoldInfos = nil,
    }

    -- 获取对手信息
    System:RegisterSignEvent(_GAME.Sign.BattleStorage, function()
        local playerId = Character:GetLocalPlayerId()

        --获取当前地图
        local MapId = Archive:GetPlayerData(playerId, Archive.TYPE.Number, "BattleStage")
        Log:PrintLog("SystemFSM:OnCreate, Get BattleStage", MapId)
        if MapId and MapId > 0 then
            Context.Scene.Situation = MapId
        end
        --获取战斗场景
        local Scene_ID = Archive:GetPlayerData(playerId, Archive.TYPE.Number, "BattleStage_Ordinal")
        Log:PrintLog("SystemFSM:OnCreate, Get BattleStage_Ordinal", Scene_ID)
        if Scene_ID and Scene_ID > 0 then
            Context.Scene.Index = Scene_ID
        end
        -- 获取战斗武器
        local weaponId = Archive:GetPlayerData(playerId, Archive.TYPE.Number, "BattleWeapon")
        Log:PrintLog("SystemFSM:OnCreate, Get BattleWeapon", weaponId)
        if weaponId and weaponId > 0 then
            Context.Weapon.Index = weaponId
        end
        -- 获取对手信息
        Context.RivalInfo.WeaponId = Context.Weapon.Index
        local jsonStr = Archive:GetPlayerData(playerId, Archive.TYPE.String, "BattleRivalInfo")
        Log:PrintLog("SystemFSM:OnCreate, Get BattleRivalInfo", jsonStr)
        local RivalInfo = MiscService:JsonStr2Table(jsonStr)
        if RivalInfo then
            if RivalInfo.name then
                Context.RivalInfo.Name = RivalInfo.name
            end
            if RivalInfo.weaponId then
                Context.RivalInfo.WeaponId = RivalInfo.weaponId
            end
            if RivalInfo.equipments then
                Context.RivalInfo.Equipments = RivalInfo.equipments
            end
        end

        -- 是否为黄金赛
        if SceneConfigTable[Context.Scene.Situation] and SceneConfigTable[Context.Scene.Situation].IsGold then
            -- 打乱黄金赛场景排序
            local sceneArr = shuffled_copy({1,2,3,4})
            -- 第一个场景给主角
            Context.Scene.Index = 1--sceneArr[1]

            --黄金赛表演场景
            local jsonStr = Archive:GetPlayerData(playerId, Archive.TYPE.String, "GoldBattleRivals")
            Log:PrintLog("SystemFSM:OnCreate, Get GoldBattleRivals", jsonStr)
            local goldBattleRivals = MiscService:JsonStr2Table(jsonStr)

            -- test
            goldBattleRivals = {
                {
                    name = "Player1",
                    weaponType = 1,
                    weaponId = 1,
                },
                {
                    name = "Player2",
                    weaponType = 1,
                    weaponId = 1,
                },
            }
            if goldBattleRivals and #goldBattleRivals > 0 then
                local num = math.floor(#goldBattleRivals/2)
                Context.GoldInfos = {}
                for i = 1, num do
                    local goldContext = {
                        Player1 = goldBattleRivals[i * 2 - 1],
                        Player2 = goldBattleRivals[i * 2],
                        Situation = Context.Scene.Situation,
                        SceneIndex = 1,--sceneArr[i+1],
                        CharacterIndex = 1,
                    }
                    table.insert(Context.GoldInfos, goldContext)
                end
            end
        end

        self:SwitchState(UGCS.Target.ArcherDuel.System.States.MatchState, Context)
    end)

    self.bRestart = false
    -- 战斗开始
    System:RegisterSignEvent(_GAME.Sign.BattleStart, function()
        if self.bRestart then
            self:SwitchState(UGCS.Target.ArcherDuel.Room.States.LoadingState, Context)
        else
            --进入局内
            self:SwitchState(UGCS.Target.ArcherDuel.System.States.RoomState, Context)
            self.bRestart = true
        end
    end)

    --再来一局
    System:RegisterSignEvent(_GAME.Sign.BattleAgain, function()
        -- 重新开始匹配
        System:FireSignEvent(_GAME.Sign.BattleMatching)
    end)

    -- 镜头表演
    System:RegisterSignEvent(_GAME.Sign.GoldShow, function()
    end)
end

--- 销毁
function SystemFSM:OnDestroy()
    SystemFSM.super.OnDestroy(self)
end

--- 刷新状态机时
---@param DeltaTime 时间戳
function SystemFSM:OnUpdate(DeltaTime)

end

--- 初始化系统设置
function SystemFSM:InitSetting()
    --关闭系统界面
    UI:SetNativeInterfaceVisible(UI.UIType.Countdown, false)
    UI:SetNativeInterfaceVisible(UI.UIType.Settings, false)
    UI:SetNativeInterfaceVisible(UI.UIType.EmotesAndActions, false)

    --禁止控制相机
    Camera:SetControlMode(Camera.CONTROL_MODE.None)
end

return SystemFSM