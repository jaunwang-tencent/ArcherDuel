--战场，他负责管理场景中动态创建的元素以及回合管理（在这里，玩法由场景决定）
local Battle = UGCS.RTTI.Class("Battle", UGCS.Framework.Scene)

--- 构造
---@param Context 上下文
function Battle:OnCreate(Context)
    Battle.super.OnCreate(self, Context)

    --获取场景配置【只读】
    self.Config = UGCS.Target.ArcherDuel.Config.SceneConfig[Context.Scene.Situation]
    local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
    local BattleView = UIConfig and UIConfig.BattleView
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

--- 是否禁用可移动物体【这里主要是为了解决角色被命中后，将角色的碰撞胶囊挪回网格体位置时在途径过程中发生碰撞】
---@param Enable 是
function Battle:EnableMovable(Enable)
    local SceneResource = self:GetResource()
    local Obstacle = SceneResource and SceneResource.Obstacle
    local MovableList = Obstacle and Obstacle.MovableList
    if MovableList then
        for SceneID, _ in pairs(MovableList) do
            Element:SetPhysics(SceneID, Enable, true, Enable)
        end
    end
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
        local CurrentEquipments = {}
        local PlayerID = Character:GetLocalPlayerId()
        table.insert(CurrentEquipments, Archive:GetPlayerData(PlayerID, Archive.TYPE.Number, "Equipped_Part_Num"))
        table.insert(CurrentEquipments, Archive:GetPlayerData(PlayerID, Archive.TYPE.Number, "Equipped_Bottoms_Num"))
        table.insert(CurrentEquipments, Archive:GetPlayerData(PlayerID, Archive.TYPE.Number, "Equipped_Cloth_Num"))
        self.CurrentTurn = self:AddActor(UGCS.Target.ArcherDuel.World.Actor.Player, {
            Location = LocalPosition,
            Rotation = LocalRotation,
            Scale = Engine.Vector(1, 1, 1),
            Controlled = true,
            Situation = Context.Scene.Situation,
            CharacterConfigID = Context.Character.Index,
            WeaponConfigID = Context.Weapon.Index,
            Equipments = CurrentEquipments,
        })
        --主控视角是否反向
        self.ControlledViewTurn = math.abs(LocalRotation.Z) > 90

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
            WeaponConfigID = Context.RivalInfo.WeaponId,
            Equipments = Context.RivalInfo.Equipments,
        })

        local CurrentTurnPlayer = self:GetCurrentTurnPlayer()
        self:LookPlayer(CurrentTurnPlayer)
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

        --看我
        local CurrentTurnPlayer = self:GetCurrentTurnPlayer()
        self:LookPlayer(CurrentTurnPlayer)

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
        System:FireGameEvent(_GAME.Events.HeadShot)
    end
end

---------------------------------------------以下为相机相关操作---------------------------------------------
--- 观察目标
---@param Position 位置
---@param Forward 朝向
function Battle:LookTarget(CameraSceneId, Position, Forward)
    --切相机
    if self.CurrentRunningCamera ~= CameraSceneId then
        --记录当前时刻
        local CurrentTimestamp = UGCS.Framework.Application.current:Watch()
        --存储相机
        self.CurrentRunningCamera = CameraSceneId
        --开启影视相机
        Camera:MovieCameraStart(CameraSceneId)
        --记录历史时刻
        self.LastSwitchTimestamp = CurrentTimestamp
    end
    --设置影视相机位置与朝向
    Element:SetPosition(CameraSceneId, Position, Element.COORDINATE.World)
    Element:SetForward(CameraSceneId, Forward)
end

--- 观察玩家(敌人)
---@param Player 目标玩家
function Battle:LookPlayer(Player)
    --真正的执行看
    local ExecuteLook = function()
        local SceneResource = self:GetResource()
        local CameraConfig = SceneResource and SceneResource.Camera
        if CameraConfig then
            Log:PrintLog("TXPerform(LookPlayer)")
            --当前角色位置
            local Location = Player:GetLocation()
            local Offest = Engine.Vector(CameraConfig.Offset.X, CameraConfig.Offset.Y, CameraConfig.Offset.Z)
            if Player:IsControlled() then
                --己方看中间
                local NextPlayer = self:GetActor(self.NextTurn)
                local NextLocation = NextPlayer:GetLocation()
                Location = (Location + NextLocation)/2
            else
                --对方看对方
                Offest.X = -Offest.X
                Offest.Y = -Offest.Y
            end
            local Position = Player:GetOffsetPosition(Offest.X, Offest.Y, Offest.Z)
            local Forward = Location - Position
            self:LookTarget(CameraConfig.CharacterCameraSceneId, Position, Forward)
        end
    end

    --获取当前时刻
    local CurrentTimestamp = UGCS.Framework.Application.current:Watch()
    --计算时间戳
    local DelayTime = 0
    local BlendTime = 1.2
    if self.LastSwitchTimestamp then
        --当相机切换时间差小于混合时间时，这会导致相机瞬移
        local DeltaTime = CurrentTimestamp - self.LastSwitchTimestamp
        --补齐混合时间
        DelayTime = BlendTime - DeltaTime
        if DelayTime > 0 then
            --补齐混合时间
            DelayTime = DelayTime + 0.2
        end
    end
    if DelayTime > 0 then
        UGCS.Framework.Executor.Delay(DelayTime, function()
            ExecuteLook()
        end)
    else
        return ExecuteLook()
    end
end

--- 观察投掷物
---@param Position 位置
function Battle:LookProjectile(Position)
    local SceneResource = self:GetResource()
    local CameraConfig = SceneResource and SceneResource.Camera
    if CameraConfig then
        --Log:PrintLog("TXPerform(LookProjectile)")
        --相机偏移【主控视角】
        local Offset = Engine.Vector(CameraConfig.Offset.X, CameraConfig.Offset.Y, CameraConfig.Offset.Z)
        if self.ControlledViewTurn then
            Offset.X = -Offset.X
            Offset.Y = -Offset.Y
        end
        Position = Position + Offset
        self:LookTarget(CameraConfig.ProjectileCameraSceneId, Position, -Offset)
    end
end

-- 表演场景，从对手占位前面面扫过
function Battle:OnGoldShow(showTime)
    local SceneResource = self:GetResource()
    if SceneResource then
        local LocalPosition = Element:GetPosition(SceneResource.BirthPoint.Enemy)
        local LocalRotation = Element:GetRotation(SceneResource.BirthPoint.Enemy)

		local startOffest = {X = 600, Y = 200, Z = 250} -- 起始偏移点
		local endOffest = {X = 600, Y = -200, Z = 250} -- 结束偏移点
		local Forward = UMath:RotatorToForward(LocalRotation)
		local Up = Engine.Vector(0, 0, 1)
		local Right = UMath:GetNormalize(UMath:GetVectorCross(Up, Forward))
		local OffsetPosition1 = LocalPosition + Forward * startOffest.X + Right * startOffest.Y + Up * startOffest.Z
		local OffsetPosition2 = LocalPosition + Forward * endOffest.X + Right * endOffest.Y + Up * endOffest.Z

		local CameraConfig = SceneResource and SceneResource.Camera
		if CameraConfig then
			local CameraSceneId= CameraConfig.ProjectileCameraSceneId
			Camera:MovieCameraStart(CameraSceneId)
			Element:SetForward(CameraSceneId, -Forward)
			-- 移动相机
			Element:MoveTo(CameraSceneId,OffsetPosition2,showTime,Element.CURVE.linear,OffsetPosition1)
		end
	end
end
---------------------------------------------以上为相机相关操作---------------------------------------------

return Battle