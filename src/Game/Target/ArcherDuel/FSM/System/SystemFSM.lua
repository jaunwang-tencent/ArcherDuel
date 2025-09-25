--游戏系统状态机【局外】
local SystemFSM = UGCS.RTTI.Class("SystemFSM", UGCS.Framework.FSM)
local SceneConfigTable = UGCS.Target.ArcherDuel.Config.SceneConfig
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter

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
            Situation = 7,    --1-海岛，2-雪地，3-城市，4-天空遗迹，5-沙漠，6-太空，7-室外，8-室内
            --战斗场景
            Index = 1
        },
        --武器
        Weapon = {
            Index = UMath:GetRandomInt(1, 3),
        },
        Equipments = {}, --装备
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

    -- 匹配信息已经准备
    System:RegisterGameEvent(_GAME.Events.MatchInfoReady, function(MatchInfo)
        --获取战斗场景
        Context.Scene.Situation = MatchInfo.MapId
        Context.Scene.Index = MatchInfo.SceneId
        -- 获取战斗武器
        Context.Weapon.Type = MatchInfo.BattleWeapon.weaponType
        Context.Weapon.Index = MatchInfo.BattleWeapon.weaponId
        -- 获取装备
        Context.Equipments = MatchInfo.Equipments
        -- 获取对手信息
        Context.RivalInfo.Name = MatchInfo.BattleRivalInfo.name
        Context.RivalInfo.WeaponId = MatchInfo.BattleRivalInfo.weaponId
        Context.RivalInfo.Equipments = MatchInfo.BattleRivalInfo.equipments

        -- 是否为黄金赛
        if SceneConfigTable[MatchInfo.MapId] and SceneConfigTable[MatchInfo.MapId].IsGold then
            -- 打乱黄金赛场景排序
            local sceneArr = shuffled_copy({1,2,3,4})
            -- 第一个场景给主角
            Context.Scene.Index = sceneArr[1]

            Context.GoldInfos = {}
            if MatchInfo.GoldShowBattleRivals and #MatchInfo.GoldShowBattleRivals > 0 then
                for i = 1, #MatchInfo.GoldShowBattleRivals do
                    local goldContext = {
                        Player1 = MatchInfo.GoldShowBattleRivals[i][1],
                        Player2 = MatchInfo.GoldShowBattleRivals[i][2],
                        Situation = Context.Scene.Situation,
                        SceneIndex = sceneArr[i+1],
                        CharacterIndex = 1,
                    }
                    table.insert(Context.GoldInfos, goldContext)
                end
            end
        end

        self:SwitchState(UGCS.Target.ArcherDuel.System.States.MatchState, Context)
    end)

    -- 战斗开始
    self.bRestart = false
    System:RegisterGameEvent(_GAME.Events.BattleStart, function()
        --判定是否要进入新手教程
        if DataCenter.GetNumber("TutorialbRestart", true) == 1 then
            System:FireSignEvent("TutorialbRestart_2")
            DataCenter.SetNumber("TutorialbRestart", 2)
        end
        if self.bRestart then
            self:SwitchState(UGCS.Target.ArcherDuel.Room.States.LoadingState, Context)
        else
            --进入局内
            self:SwitchState(UGCS.Target.ArcherDuel.System.States.RoomState, Context)
            self.bRestart = true
        end
    end)

    --根据元件脚本属性类型切换状态
    local ElementID =  System:GetScriptParentID()
    local MapId = CustomProperty:GetCustomProperty(ElementID, "MapId", CustomProperty.PROPERTY_TYPE.Number)
    Log:PrintDebug("zzzzz111 MapId: ", MapId )
    if MapId == 0 then
        -- 大厅场景进去外围
        self:SwitchState(UGCS.Target.ArcherDuel.System.States.LobbyState)
    else
        -- 战斗场景开始进行匹配
        TimerManager:AddFrame(1, function()
            System:FireGameEvent(_GAME.Events.StartMatch)
        end)
    end
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
    UI:SetNativeInterfaceVisible(UI.UIType.GameSetting, false)
    UI:SetNativeInterfaceVisible(UI.UIType.MoreSetting, false)
    --禁止控制相机
    Camera:SetControlMode(Camera.CONTROL_MODE.None)
end

return SystemFSM