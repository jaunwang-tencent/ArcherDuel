--游戏系统状态机【局外】
local SystemFSM = UGCS.RTTI.Class("SystemFSM", UGCS.Framework.FSM)

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
            -- Index = 2,
        },
        Character = {
            Index = 1
        },
    }

    -- 获取对手信息
    System:RegisterSignEvent(_GAME.Sign.BattleStorage, function()
        local playerId = Character:GetLocalPlayerId()
        local jsonStr = Archive:GetPlayerData(playerId, Archive.TYPE.String, "BattleWeapon")
        local battle_weapon = MiscService:JsonStr2Table(jsonStr)
        if battle_weapon and battle_weapon.weaponRandomNumber then
            Context.Weapon.Index = battle_weapon.weaponRandomNumber
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