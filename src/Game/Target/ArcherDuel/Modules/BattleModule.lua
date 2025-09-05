--战斗模块
local BattleModule = {}
--所需配置
local CharacterConfigTable = UGCS.Target.ArcherDuel.Config.CharacterConfig
local SceneConfigTable = UGCS.Target.ArcherDuel.Config.SceneConfig
local WeaponConfigTable = UGCS.Target.ArcherDuel.Config.WeaponConfig

--- 打开
---@param Context 上下文【透传数据】
function BattleModule:Open(Context)
    self.CharacterConfig = CharacterConfigTable[Context.Character.Index]
    self.SceneConfig = SceneConfigTable
    self.WeaponConfig = WeaponConfigTable[Context.Weapon.Index]
    --持有房间状态机
    self.RoomFSM = Context.RoomFSM

    --创建战场
    self.BattleScene = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.World.Scene.Battle, Context)
    if Context.GoldInfos and #Context.GoldInfos > 0 then
        self.GoldBattleScenes = {}
        for _, v in ipairs(Context.GoldInfos) do
            table.insert(self.GoldBattleScenes, UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.World.Scene.GoldBattle, v))
        end
    end

    --来到战场之后，注册输入事件
    System:RegisterEvent(Events.ON_TOUCH_SCREEN_PRESSED, function (x, y) self:OnTouchPressed(x, y) end)
    System:RegisterEvent(Events.ON_TOUCH_SCREEN_MOVED, function (x, y) self:OnTouchMove(x, y) end)
    System:RegisterEvent(Events.ON_TOUCH_SCREEN_RELEASED, function (x, y, _) self:OnTouchReleased(x, y) end)
    --Hook
    self.BattleScene.OnSwitchTurn = function()
        self:OnSwitchTurn()
    end

    --游戏结束
    System:RegisterGameEvent(_GAME.Events.GameEnd, self.OnGameEnd, self)
    --黄金赛镜头表演
    System:RegisterGameEvent(_GAME.Events.GoldShow, self.OnGoldShow, self)

    --从场景中萃取【固定的】
    self.SceneGravity = self.BattleScene:GetGravity()
    --获取刻度尺
    local UISetting = UGCS.Target.ArcherDuel.Config.GameConfig.UISetting
    local BattleView = UISetting and UISetting.BattleView
    if BattleView then
        --显示主控界面
        self.BattleViewIDList = {
            BattleView.LocalPlayer.ID,
            BattleView.EnemyPlayer.ID,
            BattleView.AimPitch.ID
        }
        UI:SetVisible(self.BattleViewIDList, true)

        -- 设置玩家昵称
        UI:SetText({BattleView.LocalPlayer.NickName}, Chat:GetCustomName(Character:GetLocalPlayerId()))
        UI:SetText({BattleView.EnemyPlayer.NickName}, Context.RivalInfo.Name)

        local AimPitch = BattleView.AimPitch
        if AimPitch then
            self.PitchRulerSize = UI:GetSize(AimPitch.Ruler)
            self.PitchCursorPoint = UI:GetPosition(AimPitch.Cursor)
        end
    end
end

function BattleModule:Update(DeltaTime)
    self.BattleScene:Update(DeltaTime)
    if self.GoldBattleScenes then
        for _, v in ipairs(self.GoldBattleScenes) do
            v:Update(DeltaTime)
        end
    end
end

--- 关闭
function BattleModule:Close()
    --关闭主控界面
    if self.BattleViewIDList then
        UI:SetVisible(self.BattleViewIDList, false)
        self.BattleViewIDList = nil
    end
    --重置刻度尺
    self:AdjustPitchCursor(0)

    --注销输入事件
    System:UnregisterEvent(Events.ON_TOUCH_SCREEN_PRESSED)
    System:UnregisterEvent(Events.ON_TOUCH_SCREEN_MOVED)
    System:UnregisterEvent(Events.ON_TOUCH_SCREEN_RELEASED)

    self.RoomFSM = nil

    self.BattleScene:Destroy()
    self.BattleScene = nil

    if self.GoldBattleScenes then
        for _, v in ipairs(self.GoldBattleScenes) do
            v:Destroy()
        end
        self.GoldBattleScenes = nil
    end

    self.SceneGravity = nil
    self.PitchRulerSize = nil
    self.PitchCursorPoint = nil
    self.CharacterConfig = nil
    self.SceneConfig = nil
    self.WeaponConfig = nil
end

function BattleModule:ReciveTouch()
    local Player = self.BattleScene:GetCurrentTurnPlayer()
    if Player and Player:IsControlled() then
        if Player:IsInState(UGCS.Target.ArcherDuel.Character.States.IdleState) 
        or Player:IsInState(UGCS.Target.ArcherDuel.Character.States.AimState) then
            return true
        end
    end
    return false
end

function BattleModule:OnTouchPressed(_, Y)
    if not self:ReciveTouch() then return end

    self.LastY = Y
    self.OnPressY = Y
    local V = self:GetCurrentTurnCharacterProjectileVelocity()
    local G = self.SceneGravity
    local Displacement = self.BattleScene:GetDisplacement()
    local L = math.abs(Displacement.X) * 0.01
    self.PressedHeight = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputeHeight(V, G, L, 0)

    local Player = self.BattleScene:GetCurrentTurnPlayer()
    if Player and Player:IsControlled() then
        --只有主控角色才能执行用户输入
        self.PitchDegree = self:GetPitchDegree(Y)
        self:AdjustPitchCursor(self.PitchDegree)
        Player:Aim(self.PitchDegree)

        --瞄准计时
        UGCS.Framework.Executor.Cancel(self.AimCDExecutorID)
        local AimSetting = self.CharacterConfig.AimSetting
        self.AimCDExecutorID = UGCS.Framework.Executor.Delay(AimSetting.CoolDownTime, function()
            self.AimCDExecutorID = nil
            Log:PrintLog("TXAllowFire()")
            Player:DrawCurrentTrack(self.PitchDegree)
        end)
    end
end

function BattleModule:OnTouchMove(_, Y)
    if not self:ReciveTouch() then return end

    if self.LastY ~= Y then
        self.LastY = Y
        local Player = self.BattleScene:GetCurrentTurnPlayer()
        if Player and Player:IsControlled() then
            --只有主控角色才能执行用户输入
            self.PitchDegree = self:GetPitchDegree(Y)
            self:AdjustPitchCursor(self.PitchDegree)
            local V1 = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputeVelocity(14, 10, 50, 0)
            local V2 = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputeVelocity(19, 10, 50, 2.3)
            Log:PrintLog("V1,V2", V1, V2)
            Player:Aim(self.PitchDegree)
            if not self.AimCDExecutorID then
                Player:DrawCurrentTrack(self.PitchDegree)
            end
        end
    end
end

function BattleModule:OnTouchReleased(_, Y)
    if not self:ReciveTouch() then return end

    local Player = self.BattleScene:GetCurrentTurnPlayer()
    if Player and Player:IsControlled() then
        if self.AimCDExecutorID then
            --还在瞄准CD中，切回待机状态
            Player:Idle()
        else
            self.PitchDegree = self:GetPitchDegree(Y)
            self:AdjustPitchCursor(self.PitchDegree)
            Player:Fire(self.PitchDegree)
            
            if not self.AimCDExecutorID then
                Player:DrawCurrentTrack()
            end
            Player:DrawHistoryTrack()
            --记录本次曲线
            self.HistoryPitchDegree = self.PitchDegree
        end
    end
    UGCS.Framework.Executor.Cancel(self.AimCDExecutorID)
    self.AimCDExecutorID = nil
    self.LastY = nil
    self.OnPressY = nil
    self.PressedHeight = nil
end

function BattleModule:OnGameEnd(IsControlledDead)
    if self.RoomFSM then
        local Sign = IsControlledDead and _GAME.Sign.GameOver or _GAME.Sign.GameVictory
        --切换到结算状态
        self.RoomFSM:SwitchState(UGCS.Target.ArcherDuel.Room.States.ResultState, {OpenResult = Sign})
    end
end

-- 黄金赛镜头表演
function BattleModule:OnGoldShow()
    local delayTime, showTime = 0, 1
    -- 黄金赛镜头表演
    if self.GoldBattleScenes and self.GoldBattleScenes[1] then
        self.GoldBattleScenes[1]:OnGoldShow(showTime)
    end
    delayTime = delayTime + showTime
    -- 黑屏表演
    TimerManager:AddTimer(delayTime, function()
        System:FireSignEvent(_GAME.Sign.BlackScreen)
    end)
    delayTime = delayTime + 1
    -- 黄金赛镜头表演
    TimerManager:AddTimer(delayTime, function()
        if self.BattleScene then
            self.BattleScene:OnGoldShow(showTime)
        end
    end)
    delayTime = delayTime + showTime
    -- 表演结束，继续游戏
    TimerManager:AddTimer(delayTime, function()
        System:FireSignEvent(_GAME.Sign.GoldBattleContinue)
    end)
end

--- 获取俯仰角弧度
---@param TouchY 纵向触屏偏移量
function BattleModule:GetPitchDegree(TouchY)
    local AimSetting = self.CharacterConfig.AimSetting
    local PitchDegree = 0
    if self.OnPressY then
        local DeltaY = self.OnPressY - TouchY
        if AimSetting.Optimization and not AimSetting.SampleSpline then
            local Displacement = self.BattleScene:GetDisplacement()
            if Displacement then
                local DeltaH = DeltaY * AimSetting.OffsetZPrePixel
                local V = self:GetCurrentTurnCharacterProjectileVelocity()
                local G = self.SceneGravity
                local L = math.abs(Displacement.X) * 0.01
                local H = self.PressedHeight + DeltaH
                PitchDegree = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputePitch(V, G, L, H)
            else
                PitchDegree = DeltaY * AimSetting.AnglePrePixel
            end
        else
            PitchDegree = DeltaY * AimSetting.AnglePrePixel
        end
        -- Log:PrintLog(string.format("TXPerform(DeltaY=%d, PitchDegree = %f)", DeltaY, PitchDegree))
    end

    --夹逼
    if PitchDegree < AimSetting.MinPitchDegree then
        PitchDegree = AimSetting.MinPitchDegree
    elseif PitchDegree > AimSetting.MaxPitchDegree then
        PitchDegree = AimSetting.MaxPitchDegree
    end

    return PitchDegree
end

--- 获取当前回合角色手持武器投掷物速度
function BattleModule:GetCurrentTurnCharacterProjectileVelocity()
    local CurrentTurnPlayer = self.BattleScene:GetCurrentTurnPlayer()
    local WeaponAttributes = CurrentTurnPlayer.Weapon.Attributes
    return WeaponAttributes and WeaponAttributes.Velocity
end

--- 调整俯仰角游标
---@param PitchDegree 俯仰角【单位：角度】
function BattleModule:AdjustPitchCursor(PitchDegree)
    if self.PitchCursorPoint and self.PitchRulerSize then
        local AimSetting = self.CharacterConfig.AimSetting
        local UISetting = UGCS.Target.ArcherDuel.Config.GameConfig.UISetting
        local BattleView = UISetting and UISetting.BattleView
        local AimPitch = BattleView and BattleView.AimPitch
        if AimPitch then
            --计算俯仰角比例
            local PitchDegreeRatio = PitchDegree / (AimSetting.MaxPitchDegree - AimSetting.MinPitchDegree)
            local RulerOffset = self.PitchRulerSize.Y * PitchDegreeRatio
            UI:SetPosition({AimPitch.Cursor}, self.PitchCursorPoint.X, self.PitchCursorPoint.Y - RulerOffset)
            --刷新游标刻度值
            local CursorText = string.format("%d°", math.ceil(PitchDegree))
            UI:SetText({AimPitch.Text}, CursorText)
        end
    end
end

--- 回合切换事件
function BattleModule:OnSwitchTurn()
    local NextTurnPlayer = self.BattleScene:GetNextTurnPlayer()
    if NextTurnPlayer then
        NextTurnPlayer:Idle()
    end

    --获取当前回合，要么绘制历史轨迹，要么模拟AI
    local CurrentTurnPlayer = self.BattleScene:GetCurrentTurnPlayer()
    if CurrentTurnPlayer:IsControlled() then
        --绘制历史曲线
        CurrentTurnPlayer:DrawHistoryTrack(self.HistoryPitchDegree)
    else
        self:SimulateAI(CurrentTurnPlayer)
    end
end

--- 获取AI瞄准俯仰角
function BattleModule:GetAIAimPitchDegree()
    local Displacement = self.BattleScene:GetDisplacement()
    if Displacement then
        local AimSetting = self.CharacterConfig.AimSetting
        if AimSetting.SampleSpline then
            local LowerDegree, UpperDegree = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputeHitRange(AimSetting, Displacement)
            local PitchDegree = math.random(math.floor(LowerDegree * 10) - 50, math.floor(UpperDegree * 10) + 50) * 0.1
            Log:PrintLog(string.format("GetAIAimPitchDegree(PitchDegree=%f)", PitchDegree))
            return PitchDegree
        else
            local V = self:GetCurrentTurnCharacterProjectileVelocity()
            local G = self.SceneGravity
            local L, H = math.abs(Displacement.X) * 0.01, Displacement.Z * 0.01
            local Foot, Head = H - 0.5, H + AimSetting.CharacterHeight + 0.5
            local TH = UMath:GetRandomFloat(Foot, Head)
            local PitchDegree = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputePitch(V, G, L, -TH)
            return PitchDegree
        end
    end
end

--- 模拟AI
function BattleModule:SimulateAI(TargetCharacter)
    local Perform = self.CharacterConfig.Perform
    --模拟瞄准
    UGCS.Framework.Executor.Delay(Perform.AIIdleToAimTime, function()
        local AIAimPitchDegree = self:GetAIAimPitchDegree()
        Log:PrintLog("TXPerform(AIAim)", AIAimPitchDegree)
        --非玩家攻击回合
        TargetCharacter:Aim(AIAimPitchDegree)
        --瞄准一定时间后
        UGCS.Framework.Executor.Delay(Perform.AIAimToFireTime, function()
            Log:PrintLog("TXPerform(AIFire)", AIAimPitchDegree)
            TargetCharacter:Fire(AIAimPitchDegree)
        end)
    end)
end

return BattleModule