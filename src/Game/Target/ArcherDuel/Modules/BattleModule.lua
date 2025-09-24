--战斗模块
local BattleModule = {}
--所需配置
local CharacterConfigTable = UGCS.Target.ArcherDuel.Config.CharacterConfig
local SceneConfigTable = UGCS.Target.ArcherDuel.Config.SceneConfig
local WeaponConfigTable = UGCS.Target.ArcherDuel.Config.WeaponConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
local TaskEvents = UGCS.Target.ArcherDuel.Task.TaskEvents

--- 打开
---@param Context 上下文【透传数据】
function BattleModule:Open(Context)
    self.CharacterConfig = CharacterConfigTable[Context.Character.Index]
    self.SceneConfig = SceneConfigTable
    self.WeaponConfig = WeaponConfigTable[Context.Weapon.Index]
    --持有房间状态机
    self.RoomFSM = Context.RoomFSM

    self.IsGold = self.SceneConfig[Context.Scene.Situation].IsGold -- 是否为黄金赛

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
    --黄金赛结束
    System:RegisterGameEvent(_GAME.Events.GoldEnd, self.OnGoldEnd, self)

    --从场景中萃取【固定的】
    self.SceneGravity = self.BattleScene:GetGravity()
    --获取刻度尺
    local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
    local BattleView = UIConfig and UIConfig.BattleView
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

    System:UnregisterGameEvent(_GAME.Events.GameEnd, self.OnGameEnd)
    System:UnregisterGameEvent(_GAME.Events.GoldShow, self.OnGoldShow)
    System:UnregisterGameEvent(_GAME.Events.GoldEnd, self.OnGoldEnd)

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
    if not self:ReciveTouch() then
        return
    end

    self.LastY = Y
    self.OnPressY = Y
    local Player = self.BattleScene:GetCurrentTurnPlayer()
    if Player and Player:IsControlled() then
        if Archive:GetPlayerData(Character:GetLocalPlayerId(),Archive.TYPE.Number,"TutorialbRestart") == 2 then --判定是否是新手教程
            System:FireSignEvent("TutorialbRestart_2_Off")
        end
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
    if not self:ReciveTouch() or not self.OnPressY then
        return
    end

    if self.LastY ~= Y then
        self.LastY = Y
        local Player = self.BattleScene:GetCurrentTurnPlayer()
        if Player and Player:IsControlled() then
            --只有主控角色才能执行用户输入
            self.PitchDegree = self:GetPitchDegree(Y)
            self:AdjustPitchCursor(self.PitchDegree)
            Player:Aim(self.PitchDegree)
            if not self.AimCDExecutorID then
                Player:DrawCurrentTrack(self.PitchDegree)
            end
        end
    end
end

function BattleModule:OnTouchReleased(_, Y)
    if not self:ReciveTouch() or not self.OnPressY then
        return
    end

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
end

function BattleModule:OnGameEnd()
    local curPlayer = self.BattleScene:GetCurrentTurnPlayer()
    local nextPlayer = self.BattleScene:GetNextTurnPlayer()
    local winPlayer = nil
    if curPlayer:IsInState(UGCS.Target.ArcherDuel.Character.States.DeathState) then
        winPlayer = nextPlayer
    elseif nextPlayer:IsInState(UGCS.Target.ArcherDuel.Character.States.DeathState) then
        winPlayer = curPlayer
    end
    if winPlayer then
        local win = winPlayer:IsControlled()

        System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.BattleComplete) -- 完成比赛
        if win then -- 对局胜利
            System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.BattleWin)
            local hpRate = winPlayer:GetPlayerHPRate()
            if hpRate > 0.6 then -- 血量大于60%获得胜利
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.WinBloodline60)
            end
            if hpRate > 0.8 then -- 血量大于80%获得胜利
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.WinBloodline80)
            end
            if hpRate == 1 then -- 无伤获得胜利
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.WinBloodline100)
            end
            if self.WeaponConfig.TypeName == "Bow" then -- 使用弓获得胜利
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.BattleWinUseBow)
            elseif self.WeaponConfig.TypeName == "Axe" then -- 使用斧获得胜利
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.BattleWinUseAxe)
            elseif self.WeaponConfig.TypeName == "Spear" then -- 使用矛获得胜利
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.BattleWinUseSpear)
            end
        end
    end

    if self.RoomFSM then
        --切换到结算状态
        self.RoomFSM:SwitchState(UGCS.Target.ArcherDuel.Room.States.ResultState)
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
        System:FireGameEvent(_GAME.Events.BlackScreen)
    end)
    delayTime = delayTime + 2
    -- 黄金赛镜头表演
    TimerManager:AddTimer(delayTime, function()
        if self.BattleScene then
            self.BattleScene:OnGoldShow(showTime)
        end
    end)
    delayTime = delayTime + showTime
    -- 表演结束，继续游戏
    TimerManager:AddTimer(delayTime, function()
        self:OnGameEnd()
        System:FireGameEvent(_GAME.Events.GoldBattleContinue)
    end)
end

-- 黄金赛结束
function BattleModule:OnGoldEnd()
end

--- 获取俯仰角弧度
---@param TouchY 纵向触屏偏移量
function BattleModule:GetPitchDegree(TouchY)
    local AimSetting = self.CharacterConfig.AimSetting
    local PitchDegree = 0
    if self.OnPressY then
        local DeltaY = self.OnPressY - TouchY
        PitchDegree = DeltaY * AimSetting.AnglePrePixel
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

--- 调整俯仰角游标
---@param PitchDegree 俯仰角【单位：角度】
function BattleModule:AdjustPitchCursor(PitchDegree)
    if self.PitchCursorPoint and self.PitchRulerSize then
        local AimSetting = self.CharacterConfig.AimSetting
        local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
        local BattleView = UIConfig and UIConfig.BattleView
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
        if AimSetting then
            local LowerDegree, UpperDegree = GameUtils.ComputeHitRange(AimSetting, Displacement)
            local LowerDegree2 = LowerDegree - AimSetting.AIAimSpread
            local UpperDegree2 = UpperDegree + AimSetting.AIAimSpread
            local PitchDegree = UMath:GetRandomFloat(LowerDegree2, UpperDegree2)
            Log:PrintLog(string.format("GetAIAimPitchDegree(PitchDegree=%f)", PitchDegree))
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