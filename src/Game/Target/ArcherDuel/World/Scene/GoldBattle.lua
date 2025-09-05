--黄金赛战场，他负责管理场景中动态创建的元素以及回合管理（在这里，玩法由场景决定）
local GoldBattle = UGCS.RTTI.Class("GoldBattle", UGCS.Framework.Scene)

--- 构造
---@param Context 上下文
function GoldBattle:OnCreate(Context)
    GoldBattle.super.OnCreate(self, Context)

    --获取场景配置【只读】
    self.Config = UGCS.Target.ArcherDuel.Config.SceneConfig[Context.Situation]
    self.CharacterConfig = UGCS.Target.ArcherDuel.Config.CharacterConfig[Context.CharacterIndex]
    -- local UISetting = UGCS.Target.ArcherDuel.Config.GameConfig.UISetting
    -- local BattleView = UISetting and UISetting.BattleView
    -- self.CriticalHitReward = BattleView and BattleView.CriticalHitReward
    -- if self.CriticalHitReward then
    --     UI:SetVisible({self.CriticalHitReward.ID}, true)
    -- end

    --战斗场景
    self.SceneIndex = Context.SceneIndex

    --加载角色
    self:LoadCharacter(Context)

    --备份所有障碍物位置
    local SceneResource = self:GetResource()
    local Obstacle = SceneResource and SceneResource.Obstacle
    if Obstacle then
        self.ObstacleTransformList = {}
        --可移动物体
        local MovableList = Obstacle.MovableList
        if MovableList then
            for SceneID, _ in pairs(MovableList) do
                self.ObstacleTransformList[SceneID] = {
                    Position = Element:GetPosition(SceneID),
                    Rotation = Element:GetRotation(SceneID)
                }
                --全部打开【通过脚本打开可移动的障碍物】
                Element:SetMass(SceneID, 2500)
                Element:SetFriction(SceneID, 0.2)
                Element:SetPhysics(SceneID, true, true, true)
            end
        end

        --备份所有活体位置
        local BodyList = Obstacle.BodyList
        if BodyList then
            for SceneID, _ in pairs(BodyList) do
                self.ObstacleTransformList[SceneID] = {
                    Position = Element:GetPosition(SceneID),
                    Rotation = Element:GetRotation(SceneID)
                }
            end
        end
    end
end

--- 销毁
function GoldBattle:OnDestroy()
    GoldBattle.super.OnDestroy(self)
    if self.ObstacleTransformList then
        for SceneID, Tranfrom in pairs(self.ObstacleTransformList) do
            Element:SetPosition(SceneID, Tranfrom.Position, Element.COORDINATE.World)
            Element:SetRotation(SceneID, Tranfrom.Rotation, Element.COORDINATE.World)
        end
        self.ObstacleTransformList = nil
    end

    if self.CriticalHitReward then
        UI:SetVisible({self.CriticalHitReward.ID}, true)
        self.CriticalHitReward = nil
    end

    self.Config = nil
    self.CurrentTurn = nil
    self.NextTurn = nil

    self.SceneIndex = nil
    self.BattleSceneConfig = nil
end

--- 设置轮回这状态
---@param self 自身实例
---@param ActorID 角色标识
---@param State 状态
local function SetTurnState(self, ActorID, State)
    local Actor = self:GetActor(ActorID)
    if Actor then
        Actor.MyTurn = State
        --看我
        if State then
            -- if Actor:IsControlled() then
            --     Actor:SyncLocation()
            --     self:LookStart()
            -- else
            --     Actor:SyncLocation()
            --     self:LookPlayer(Actor.Transform)
            -- end
        end
    end
end

--- 应用回合状态
---@param self 自身实例
local function ApplyTurnState(self)
    --设置回合状态
    SetTurnState(self, self.CurrentTurn, true)
    SetTurnState(self, self.NextTurn, false)
end

--- 获取指定战斗阶段资源配置
function GoldBattle:GetResource()
    if self.SceneIndex then
        local SceneResource = self.Config and self.Config.Resource
        local TargetResource = SceneResource and SceneResource[self.SceneIndex]
        return TargetResource
    end
end

--- 加载角色
---@param Context 上下文
function GoldBattle:LoadCharacter(Context)
    --己方
    --这里根据具体场景获取相应出生点
    local SceneResource = self:GetResource()
    if SceneResource then
        local LocalPosition = Element:GetPosition(SceneResource.BirthPoint.Local)
        local LocalRotation = Element:GetRotation(SceneResource.BirthPoint.Local)
        Element:SetVisibility(SceneResource.BirthPoint.Local, false)
        self.CurrentTurn = self:AddActor(UGCS.Target.ArcherDuel.World.Actor.Player, {
            Location = LocalPosition,
            Rotation = LocalRotation,
            Scale = Engine.Vector(1, 1, 1),
            Situation = Context.Situation,
            CharacterConfigID = Context.CharacterIndex,
            WeaponConfigID = Context.Player1.weaponId,
            Controlled = false,
			OnlyShow = true,
        })

        --对方
        local EnemyPosition = Element:GetPosition(SceneResource.BirthPoint.Enemy)
        local EnemyRotation = Element:GetRotation(SceneResource.BirthPoint.Enemy)
        Element:SetVisibility(SceneResource.BirthPoint.Enemy, false)
        self.NextTurn = self:AddActor(UGCS.Target.ArcherDuel.World.Actor.Player, {
            Location = EnemyPosition,
            Rotation = EnemyRotation,
            Scale = Engine.Vector(1, 1, 1),
            Situation = Context.Situation,
            CharacterConfigID = Context.CharacterIndex,
            WeaponConfigID = Context.Player2.weaponId,
            Controlled = false,
			OnlyShow = true,
        })

        --首次应用状态
        ApplyTurnState(self)
        self:OnSwitchTurn()
    else
        Log:PrintError("没有指定场景的配置信息")
    end
end

--- 切换回合
---@return Success 回合切换是否成功
function GoldBattle:SwitchTurn()
    if self.CurrentTurn and self.NextTurn then
        --这里根据状态加一层保护
        local TempTurn = self.CurrentTurn
        self.CurrentTurn = self.NextTurn
        self.NextTurn = TempTurn

        --设置回合状态
        ApplyTurnState(self)

        self:OnSwitchTurn()
        return true
    else
        return false
    end
end

--- 获取当前回合角色
---@return 当前回合角色
function GoldBattle:GetCurrentTurnPlayer()
    return self:GetActor(self.CurrentTurn)
end

--- 获取下一回合角色
---@return 下一回合角色
function GoldBattle:GetNextTurnPlayer()
    return self:GetActor(self.NextTurn)
end

--- 获取攻击者到受击者之间的位移
---@return Displacement 攻击者到受击者之间的位移【单位：厘米】
function GoldBattle:GetDisplacement()
    if self.CurrentTurn and self.NextTurn then
        local AttackPlayer = self:GetActor(self.CurrentTurn)
        local TargetPlayer = self:GetActor(self.NextTurn)
        if AttackPlayer and TargetPlayer then
            local Displacement = AttackPlayer:GetLocation() - TargetPlayer:GetLocation()
            return Displacement
        end
    end
end

--- 回合切换事件
function GoldBattle:OnSwitchTurn()
    local NextTurnPlayer = self:GetNextTurnPlayer()
    if NextTurnPlayer then
        NextTurnPlayer:Idle()
    end

    -- 模拟AI
    local CurrentTurnPlayer = self:GetCurrentTurnPlayer()
    self:SimulateAI(CurrentTurnPlayer)
end

--- 观察投掷物
---@param Position 位置
function GoldBattle:LookProjectile(Position)
end

--- 获取AI瞄准俯仰角
function GoldBattle:GetAIAimPitchDegree()
    local Displacement = self:GetDisplacement()
    if Displacement then
        local AimSetting = self.CharacterConfig.AimSetting
        if AimSetting.SampleSpline then
            local LowerDegree, UpperDegree = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputeHitRange(AimSetting.HitSpline, Displacement)
            local PitchDegree = math.random(math.floor(LowerDegree * 10) - 50, math.floor(UpperDegree * 10) + 50) * 0.1
            Log:PrintLog(string.format("GetAIAimPitchDegree(PitchDegree=%f)", PitchDegree))
            return PitchDegree
        else
            local V = self:GetCurrentTurnCharacterProjectileVelocity()
            local G = self.SceneGravity
            local L, H = math.abs(Displacement.X) * 0.01, Displacement.Z * 0.01
            local PitchDegree = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputePitch(V, G, L, -H + AimSetting.AIHitZOffset)
            PitchDegree = PitchDegree + math.random(-5, 5)
            return PitchDegree
        end
    end
end

--- 模拟AI
function GoldBattle:SimulateAI(TargetCharacter)
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

-- 表演场景，从主角占位后面扫过
function GoldBattle:OnGoldShow(showTime)
    local SceneResource = self:GetResource()
    if SceneResource then
        local LocalPosition = Element:GetPosition(SceneResource.BirthPoint.Local)
        local LocalRotation = Element:GetRotation(SceneResource.BirthPoint.Local)

		local startOffest = {X = 500, Y = -500, Z = 250} -- 起始偏移点
		local endOffest = {X = 500, Y = 500, Z = 250} -- 结束偏移点
		local Forward = UMath:RotatorToForward(LocalRotation)
		local Up = Engine.Vector(0, 0, 1)
		local Right = UMath:GetNormalize(UMath:GetVectorCross(Up, Forward))
		local OffsetPosition1 = LocalPosition + Forward * startOffest.X + Right * startOffest.Y + Up * startOffest.Z
		local OffsetPosition2 = LocalPosition + Forward * endOffest.X + Right * endOffest.Y + Up * endOffest.Z

		local CameraConfig = SceneResource and SceneResource.Camera
		if CameraConfig then
			local CameraSceneId= CameraConfig.ProjectileCameraSceneId
			Camera:MovieCameraStart(CameraSceneId)
			Element:SetForward(CameraSceneId, Forward)
			-- 移动相机
			Element:MoveTo(CameraSceneId,OffsetPosition2,showTime,Element.CURVE.linear,OffsetPosition1)
		end
	end
end

return GoldBattle