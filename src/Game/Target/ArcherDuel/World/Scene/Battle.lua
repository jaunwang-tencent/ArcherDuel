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
                local Scale = Element:GetScale(SceneID)
                --计算质量【按缩放计算】
                local Mass = Obstacle.Density * Scale.X * Scale.Y * Scale.Z
                Element:SetMass(SceneID, Mass)
                Element:SetFriction(SceneID, Obstacle.Friction)
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
function Battle:OnDestroy()
    Battle.super.OnDestroy(self)
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
            Actor:SyncLocation()
            if Actor:IsControlled() then
                self:LookStart()
            else
                self:LookPlayer(Actor.Transform)
            end
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
        self.cameraOffestTurn = math.abs(LocalRotation.Z) > 90

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
            local Displacement = TargetPlayer:GetLocation() - AttackPlayer:GetLocation()
            return Displacement
        end
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

---------------------------------------------以下为相机相关操作---------------------------------------------
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
    --设置影视相机位置与朝向
    local CharacterCameraPosition = Position + Offset
    Element:SetPosition(CameraSceneId, CharacterCameraPosition, Element.COORDINATE.World)
    Element:SetForward(CameraSceneId, -Offset)
end

--- 观察玩家(敌人)
---@param Tranfrom 位置
function Battle:LookPlayer(Tranfrom)
    local SceneResource = self:GetResource()
    local CameraConfig = SceneResource and SceneResource.Camera
    if CameraConfig then
        -- Log:PrintLog("TXPerform(LookPlayer)")
        local NeetSwitch = false
        if self.CurrentRunningCamera ~= CameraConfig.CharacterCameraSceneId then
            NeetSwitch = true
            self.CurrentRunningCamera = CameraConfig.CharacterCameraSceneId
        end

        --开启影视相机
        if NeetSwitch then
            Camera:MovieCameraStart(self.CurrentRunningCamera)
        end

        local forward = UMath:GetNormalize(UMath:RotatorToForward(Tranfrom.Rotation))
        local up = Engine.Vector(0, 0, 1)
        local right = UMath:GetNormalize(UMath:GetVectorCross(up, forward))
        local offest = CameraConfig.EnemyOffset

        --设置影视相机位置与朝向
        local CharacterCameraPosition = Tranfrom.Location + forward * offest.X + right * offest.Y + up * offest.Z
        Element:SetPosition(self.CurrentRunningCamera, CharacterCameraPosition, Element.COORDINATE.World)
        Element:SetForward(self.CurrentRunningCamera, Tranfrom.Location-CharacterCameraPosition)
    end
end

--- 起始视角
function Battle:LookStart()
    -- 获取两个角色的位置
    local curPosition, curRotation
    local Position = nil
    if self.CurrentTurn and self.NextTurn then
        local CurrentPlayer = self:GetActor(self.CurrentTurn)
        local NextPlayer = self:GetActor(self.NextTurn)
        if CurrentPlayer and NextPlayer then
            curPosition = FakeCharacter:GetPosition(CurrentPlayer.UID)
            curRotation = CurrentPlayer.Transform.Rotation
            local nextPosition = FakeCharacter:GetPosition(NextPlayer.UID)
            Position = (curPosition + nextPosition)/2
        end
    end
    local SceneResource = self:GetResource()
    local CameraConfig = SceneResource and SceneResource.Camera
    if CameraConfig then
        -- Log:PrintLog("TXPerform(LookPlayer)")
        local NeetSwitch = false
        if self.CurrentRunningCamera ~= CameraConfig.CharacterCameraSceneId then
            NeetSwitch = true
            self.CurrentRunningCamera = CameraConfig.CharacterCameraSceneId
        end

        --开启影视相机
        if NeetSwitch then
            Camera:MovieCameraStart(self.CurrentRunningCamera)
        end

        local forward = UMath:GetNormalize(UMath:RotatorToForward(curRotation))
        local up = Engine.Vector(0, 0, 1)
        local right = UMath:GetNormalize(UMath:GetVectorCross(up, forward))
        local offest = CameraConfig.Offset

        --设置影视相机位置与朝向
        local CharacterCameraPosition = curPosition + forward * offest.X + right * offest.Y + up * offest.Z
        Element:SetPosition(self.CurrentRunningCamera, CharacterCameraPosition, Element.COORDINATE.World)
        Element:SetForward(self.CurrentRunningCamera, Position-CharacterCameraPosition)
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

        local offest = Engine.Rotator()
        offest.X = self.cameraOffestTurn and -CameraConfig.Offset.X or CameraConfig.Offset.X
        offest.Y = self.cameraOffestTurn and -CameraConfig.Offset.Y or CameraConfig.Offset.Y
        offest.Z = CameraConfig.Offset.Z
        LookTarget(self.CurrentRunningCamera, Position, offest, NeetSwitch)
    end
end
---------------------------------------------以上为相机相关操作---------------------------------------------

return Battle