--战场，他负责管理场景中动态创建的元素以及回合管理（在这里，玩法由场景决定）
local Battle = UGCS.RTTI.Class("Battle", UGCS.Framework.Scene)

--- 构造
---@param Context 上下文
function Battle:OnCreate(Context)
    Battle.super.OnCreate(self, Context)

    --获取场景配置【只读】
    self.Config = UGCS.Target.ArcherDuel.Config.SceneConfig[Context.Scene.Situation]
    local UISetting = UGCS.Target.ArcherDuel.Config.GameConfig.UISetting
    local BattleView = UISetting and UISetting.BattleView
    self.CriticalHitReward = BattleView and BattleView.CriticalHitReward
    if self.CriticalHitReward then
        UI:SetVisible({self.CriticalHitReward.ID}, true)
    end

    --战斗场景
    self.SceneIndex = Context.Scene.Index

    --加载角色
    self:LoadCharacter(Context)
end

--- 销毁
function Battle:OnDestroy()
    Battle.super.OnDestroy(self)

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
            self:LookPlayer(Actor:SyncLocation())
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
function Battle:GetResource()
    if self.SceneIndex then
        local SceneResource = self.Config and self.Config.Resource
        local TargetResource = SceneResource and SceneResource[self.SceneIndex]
        return TargetResource
    end
end

--- 加载角色
---@param Context 上下文
function Battle:LoadCharacter(Context)
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
            Controlled = true,
            Situation = Context.Scene.Situation,
            CharacterConfigID = Context.Character.Index,
            WeaponConfigID = Context.Weapon.Index
        })

        --对方
        local EnemyPosition = Element:GetPosition(SceneResource.BirthPoint.Enemy)
        local EnemyRotation = Element:GetRotation(SceneResource.BirthPoint.Enemy)
        Element:SetVisibility(SceneResource.BirthPoint.Enemy, false)
        self.NextTurn = self:AddActor(UGCS.Target.ArcherDuel.World.Actor.Player, {
            Location = EnemyPosition,
            Rotation = EnemyRotation,
            Scale = Engine.Vector(1, 1, 1),
            Controlled = false,
            Situation = Context.Scene.Situation,
            CharacterConfigID = Context.Character.Index,
            WeaponConfigID = Context.Weapon.Index
        })

        --首次应用状态
        ApplyTurnState(self)
    else
        Log:PrintError("没有指定场景的配置信息")
    end
end

--- 切换回合
---@return Success 回合切换是否成功
function Battle:SwitchTurn()
    if self.CurrentTurn and self.NextTurn then
        --这里根据状态加一层保护
        local TempTurn = self.CurrentTurn
        self.CurrentTurn = self.NextTurn
        self.NextTurn = TempTurn

        --设置回合状态
        ApplyTurnState(self)

        --对外抛出事件
        if self.OnSwitchTurn then
            self.OnSwitchTurn()
        end
        return true
    else
        return false
    end
end

--- 判定当前回合是否为本地控制
---@return Controlled 当前回合角色是否为本地控制角色
function Battle:IsCurrentTurnControlled()
    local Player = self:GetActor(self.CurrentTurn)
    return Player and Player:IsControlled()
end

--- 获取当前回合角色
---@return 当前回合角色
function Battle:GetCurrentTurnPlayer()
    return self:GetActor(self.CurrentTurn)
end

--- 获取下一回合角色
---@return 下一回合角色
function Battle:GetNextTurnPlayer()
    return self:GetActor(self.NextTurn)
end

--- 获取攻击者到受击者之间的位移
---@return Displacement 攻击者到受击者之间的位移【单位：厘米】
function Battle:GetDisplacement()
    if self.CurrentTurn and self.NextTurn then
        local AttackPlayer = self:GetActor(self.CurrentTurn)
        local TargetPlayer = self:GetActor(self.NextTurn)
        if AttackPlayer and TargetPlayer then
            local Displacement = AttackPlayer:GetLocation() - TargetPlayer:GetLocation()
            return Displacement
        end
    end
end

--- 观察目标
---@param CameraSceneId 相机元件标识
---@param Position 位置
---@param Offset 偏移
---@param NeetSwitch 是否切镜
local function LookTarget(CameraSceneId, Position, Offset, NeetSwitch)
    --开启影视相机
    if NeetSwitch then
        Camera:MovieCameraStart(CameraSceneId)
    end
    Element:SetPosition(CameraSceneId, Position, Element.COORDINATE.World)
    Element:SetForward(CameraSceneId, -Offset)
end

--- 观察玩家(敌人)
---@param Position 位置
function Battle:LookPlayer(Position)
    local SceneResource = self:GetResource()
    local CameraConfig = SceneResource and SceneResource.Camera
    if CameraConfig then
        -- Log:PrintLog("TXPerform(LookPlayer)")
        local NeetSwitch = false
        if self.CurrentRunningCamera ~= CameraConfig.CharacterCameraSceneId then
            NeetSwitch = true
            self.CurrentRunningCamera = CameraConfig.CharacterCameraSceneId
        end
        --设置影视相机位置与朝向
        local CharacterCameraPosition = Position + CameraConfig.Offset
        local CharacterCameraOffset
        if self:IsCurrentTurnControlled() then
            --己方看对方
            local NextPlayer = self:GetActor(self.NextTurn)
            local NextPosition = FakeCharacter:GetPosition(NextPlayer.UID)
            CharacterCameraOffset = CharacterCameraPosition - (Position + NextPosition)/2
        else
            --对方看中间
            CharacterCameraOffset = CameraConfig.Offset
        end

        --朝向反算
        LookTarget(self.CurrentRunningCamera, CharacterCameraPosition, CharacterCameraOffset, NeetSwitch)
    end
end

--- 观察投掷物
---@param Position 位置
function Battle:LookProjectile(Position)
    local SceneResource = self:GetResource()
    local CameraConfig = SceneResource and SceneResource.Camera
    if CameraConfig then
        -- Log:PrintLog("TXPerform(LookProjectile)")
        local NeetSwitch = false
        if self.CurrentRunningCamera ~= CameraConfig.ProjectileCameraSceneId then
            NeetSwitch = true
            self.CurrentRunningCamera = CameraConfig.ProjectileCameraSceneId
        end
        --设置影视相机位置与朝向
        local CharacterCameraPosition = Position + CameraConfig.Offset
        LookTarget(self.CurrentRunningCamera, CharacterCameraPosition, CameraConfig.Offset, NeetSwitch)
    end
end

--- 爆头提示
function Battle:HeadShot()
    --爆头提示
    if self.CriticalHitReward then
        UI:SetVisible({self.CriticalHitReward.HeadShotUI}, true)
        System:FireSignEvent(_GAME.Sign.HeadShot)
    end
end

return Battle