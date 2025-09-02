--玩家角色
local Player = UGCS.RTTI.Class("Player", UGCS.Framework.Actor)

--移动状态
local EMovement = {
    --浮空态
    Float = "Float",
    --移动态
    Move = "Move",
    --待机态
    Idle = "Idle"
}

function Player:OnCreate(Context)
    Player.super.OnCreate(self, Context)

    --是否为本地控制
    local Controlled = Context and Context.Controlled or false
    --在此创建假人【这个非常耗】
    self.UID = FakeCharacter:CreateCharacter(self.Transform.Location, self.Transform.Rotation, self.Transform.Scale, not Controlled)
    self:SetFakeCharacterRotation(self.Transform.Rotation)
    if Controlled then
        local LocalPlayerUID = Character:GetLocalPlayerId()
        Character:SetAttributeEnabled(LocalPlayerUID, Character.ATTR_ENABLE.CanMove, false)
        FakeCharacter:ChangeBodyFromPlayer(self.UID, LocalPlayerUID)
    end

    --获取角色配置【只读】
    self.Config = UGCS.Target.ArcherDuel.Config.CharacterConfig[Context.CharacterConfigID]

    self.DamageRateList = self.Config.DamageRateList

    --角色属性
    self.Attributes = {
        --控制【本地】
        Controlled = Controlled
    }
    --拷贝属性
    if self.Config and self.Config.Attributes then
        for key, value in pairs(self.Config.Attributes) do
            self.Attributes[key] = value
        end
    end

    -- 读取玩家装备数据
    local equipData = self:GetEquipData()
    if equipData and equipData.hp then
        self.Attributes.Health = self.Attributes.Health + equipData.hp
    end

    --抬头血量显示
    local UISetting = UGCS.Target.ArcherDuel.Config.GameConfig.UISetting
    local BattleView = UISetting and UISetting.BattleView
    if BattleView then
        local PlayerView = self.Attributes.Controlled and BattleView.LocalPlayer or BattleView.EnemyPlayer
        if PlayerView then
            self.UI_HP = PlayerView.HPValue
            local HUD_HPList = {self.UI_HP}
            UI:SetProgressMaxValue(HUD_HPList, self.Attributes.Health)
            UI:SetProgressCurrentValue(HUD_HPList, self.Attributes.Health)
        end
    end

    --创建角色后，分配角色状态机
    self.FSM = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.Character.FSM, {
        OwnerPlayer = self
    })

    --创建武器
    local WeaponConfig = UGCS.Target.ArcherDuel.Config.WeaponConfig[Context.WeaponConfigID]
    self.Weapon = UGCS.RTTI.CreateInstanceByTypeName(WeaponConfig.TypeName, {
        WeaponConfigID = Context.WeaponConfigID,
        Situation = Context.Situation,
        OwnerPlayer = self
    })

    --引用武器配置中的动画【因为持有不同武器播放的动画不一样，所以就设计在武器配置中了】
    self.Animations = WeaponConfig.Animations

    --创建曲线
    if self.Attributes.Controlled then
        self.HistorySplineId = Element:AddSpline()
        self.CurrentSplineId = Element:AddSpline()
    end

    --待机动画
    Log:PrintLog("TXPerform(Animation = Idle)", self.UID)
    FakeCharacter:PlayAnim(self.UID, self.Animations.Idle)
end

function Player:OnDestroy()
    --清空配置
    self.Config = nil
    self.Animations = nil

    self.Weapon:Destroy()
    self.Weapon = nil

    --清空属性
    self.Attributes = nil
    self.UI_HP = nil

    --销毁角色状态机
    self.FSM:Destroy()
    self.FSM = nil
    self.LastFirePitchRadian = nil

    --在此销毁假人
    FakeCharacter:DestroyCharacter(self.UID)
    self.UID = nil

    if self.HistorySplineId then
        Element:RemoveSpline(self.HistorySplineId)
        self.HistorySplineId = nil
    end
    if self.CurrentSplineId then
        Element:RemoveSpline(self.CurrentSplineId)
        self.CurrentSplineId = nil
    end

    Player.super.OnDestroy(self)
end

function Player:Update(DeltaTime)
    --刷新角色状态机
    self.FSM:Update(DeltaTime)

    --角色位置移动探针
    self:UpdateMovementState()
end

--- 获取血量
---@return Health 血量
function Player:GetHealth()
    return self.Attributes.Health
end

--- 设置血量
---@param Health 血量
function Player:SetHealth(Health)
    self.Attributes.Health = Health
    if self.UI_HP then
        --刷新血条
        local HUD_HPList = {self.UI_HP}
        UI:SetProgressCurrentValue(HUD_HPList, self.Attributes.Health)
    end
end

--- 获取伤害倍率
---@param BodyType 身体部位类型
function Player:GetDamageRate(BodyType)
    local DamageRate = self.DamageRateList and BodyType and self.DamageRateList[BodyType] or 1.0
    return DamageRate
end

--- 判定当前角色是否被控制
function Player:IsControlled()
    return self.Attributes and self.Attributes.Controlled or false
end

--- 判定角色是否处于目标状态
---@param StateType 状态类型
function Player:IsInState(StateType)
    if self.FSM then
        return self.FSM:IsState(StateType)
    else
        return false
    end
end

--- 获取指定玩家移动状态【浮空、着地移动，着地停止】
---@param ActorID 角色标识
---@return 移动类型
function Player:UpdateMovementState()
    local Start = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.ProbeBone)
    local End = Start + Engine.Vector(0, 0, -100000)
    self.MovementState = nil
    local ID, Result = PlayInteractive:GetHitResultWithRaycast(PlayInteractive.HIT_TYPE.Element, Start, End)
    if ID then
        local Height = Start.Z - Result.hitPos.Z
        if Height > self.Config.MovementProbe.LandingProbe then
            --浮空态
            self.MovementState = EMovement.Float
        end
    else
        --浮空态
        self.MovementState = EMovement.Float
    end

    if not self.MovementState then
        --进一步检测非浮空态位移态
        if self.LastSocketPosition then
            --检测到距离上一次位移差超过容错值则判定为移动态
            local Distance = UMath:GetDistance(Start, self.LastSocketPosition)
            if Distance < self.Config.MovementProbe.ProbeTolerance then
                self.MovementState = EMovement.Idle
            else
                self.MovementState = EMovement.Move
            end
        else
            --第一次刷新，判定为待机态
            self.MovementState = EMovement.Idle
        end
    end
    --更新探针骨骼
    self.LastSocketPosition = Start
    if self.MovementState == EMovement.Idle then
        --只有在待机态时才刷新位置
        self:SyncLocation()
    end
end

--- 同步位置
---@return 玩家位置
function Player:SyncLocation()
    local Position = FakeCharacter:GetPosition(self.UID)
    self:SetLocation(Position)
    return Position
end

--- 待机状态
---@return Success 状态是否切换成功
function Player:Idle()
    if self.FSM then
        local IdleState = UGCS.Target.ArcherDuel.Character.States.IdleState
        return self.FSM:SwitchState(IdleState)
    else
        return false
    end
end

--- 角色瞄准
---@param PitchDegree 俯仰角【单位：角度】
---@return Success 状态是否切换成功
function Player:Aim(PitchDegree)
    if self.FSM then
        local AimState = UGCS.Target.ArcherDuel.Character.States.AimState
        return self.FSM:SwitchState(AimState, {PitchDegree = PitchDegree, LastFirePitchDegree = self.LastFirePitchDegree})
    else
        return false
    end
end

--- 角色射击
---@param PitchDegree 俯仰角【单位：角度】
---@return Success 状态是否切换成功
function Player:Fire(PitchDegree)
    if self.FSM then
        --记录上一次发射角度
        self.LastFirePitchDegree = PitchDegree
        local FireState = UGCS.Target.ArcherDuel.Character.States.FireState
        return self.FSM:SwitchState(FireState, {PitchDegree = PitchDegree})
    else
        return false
    end
end

--- 角色命中
---@param Result 命中信息
---@return Success 状态是否切换成功
function Player:Hit(Result)
    if self.FSM then
        local HitState = UGCS.Target.ArcherDuel.Character.States.HitState
        return self.FSM:SwitchState(HitState, {HitInfo = Result})
    else
        return false
    end
end

--- 角色命中
---@return Success 状态是否切换成功
function Player:Death()
    if self.FSM then
        local DeathState = UGCS.Target.ArcherDuel.Character.States.DeathState
        self.FSM:SwitchState(DeathState, {})

        -- 发送游戏结束事件
        System:FireGameEvent(_GAME.Events.GameEnd, self:IsControlled())
    end
end

--- 瞄准校正
---@param PitchDegree 俯仰角【单位：角度】
function Player:AimAdjust(PitchDegree)
    --旋转身体
    PitchDegree = PitchDegree or 0
    local Rotator = Engine.Rotator(-PitchDegree, 0, 0)
    FakeCharacter:SetCharacterBoneRotator(self.UID, Rotator)
end

--表演瞄准
function Player:PerformAim()
    Log:PrintLog("TXPerform(Animation = Aim)", self.UID)
    FakeCharacter:PlayAnim(self.UID, self.Animations.Aim)

    --瞄准时武器表演
    self.Weapon:Perform(self.Config.Perform.PullStringTime)
end

--- 发射投掷物
---@param PitchDegree 俯仰角【单位：角度】
function Player:FireProjectile(PitchDegree)
    self.Weapon:SpawnProjectile(PitchDegree)
end

--- 攻击表演
function Player:PerformFire()
    --播放使用对应的武器动作
    Log:PrintLog("TXPerform(Animation = Fire)", self.UID)
    FakeCharacter:PlayAnim(self.UID, self.Animations.Fire)

    --攻击时武器表演
    self.Weapon:Perform()

    --一段时间回到持有武器待机动作
    UGCS.Framework.Executor.Delay(self.Config.Perform.FireToIdleTime, function()
        Log:PrintLog("TXPerform(Animation = Idle)", self.UID)
        FakeCharacter:PlayAnim(self.UID, self.Animations.Idle)
    end)
end

-- 获取玩家装备数据
function Player:GetEquipData(ForceUpdate)
    if ForceUpdate or not self.EquipData then
        local PlayerID = Character:GetLocalPlayerId()
        local Bow_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Bow_Num")
        local Spear_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Spear_Num")
        local Axe_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Axe_Num")
        local Hat_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Hat_Num")
        local Glasses_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Glasses_Num")
        local Cloth_Num = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Cloth_Num")
        local Bow_Lv = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Bow_Lv")
        local Spear_Lv = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Spear_Lv")
        local Axe_Lv = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Axe_Lv")
        local Hat_Lv = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Hat_Lv")
        local Glasses_Lv = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Glasses_Lv")
        local Cloth_Lv = Archive:GetPlayerData(PlayerID,Archive.TYPE.Number, "Equipped_Cloth_Lv")

        self.EquipData = {
            damage = 150, -- 基础伤害
            head_damageRate = 0.2, -- 头部伤害倍率
            body_damageRate = 0.1, -- 身体伤害倍率
            hp = 200, -- 血量加成
            head_protection = 0.2, -- 头部保护
            body_protection = 0.1, -- 身体保护
        }
    end
    return self.EquipData
end

--- 命中伤害
---@param Damage 伤害值
---@param BodyType 身体部位
function Player:HitDamage(Damage, BodyType)
    local Health = self:GetHealth()
    local DamageRate = self:GetDamageRate(BodyType)
    Health = Health - Damage * DamageRate
    self:SetHealth(Health)
end

--- 受击表演开始
---@param Impulse 冲量
---@param BodyType 身体部位
function Player:PerformHitStart(Impulse, BodyType)
    --开始物理模拟【务必在施加冲量之前开启物理模拟】
    FakeCharacter:EnableSimulatePhysics(self.UID, true)
    FakeCharacter:SetAllBodiesPhysicsBlendWeight(self.UID, 1)

    --计算参照系骨骼偏移量
    local SocketPosition1 = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.OffsetBone)
    local Position1 = FakeCharacter:GetPosition(self.UID)
    local OffsetPosition = Position1 - SocketPosition1

    --施加冲量
    FakeCharacter:AddImpulse(self.UID, Impulse, BodyType)

    --躺地一段时间
    UGCS.Framework.Executor.Delay(self.Config.Perform.LandingKeepTime, function()
        --躺地一段时间后，移动胶囊体，对齐到可视化网格
        local SocketPosition2 = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.OffsetBone)
        if SocketPosition2 then
            --修正坐标
            local Position2 = SocketPosition2 + OffsetPosition
            FakeCharacter:SetPosition(self.UID, Position2)
            --刷新位置
            self:SetLocation(Position2)
        end

        --表演倒地
        self:PerformFallback()
    end)
end

--- 设置假人旋转【逆时针旋转90度】
---@param Rotation 欧拉角
function Player:SetFakeCharacterRotation(Rotation)
    Rotation = Rotation - Engine.Rotator(0, 0, 90)
    FakeCharacter:SetRotation(self.UID, Rotation)
end

--- 倒地表演
function Player:PerformFallback()
    local FacePosition = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.FaceBone)
    local FaceRotation = FakeCharacter:GetSocketRotation(self.UID, self.Config.BodySetting.FaceBone)
    local ChestPosition = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.ChestBone)
    local TargetRotation = Engine:Rotator()
    if FacePosition and ChestPosition then
        local BodyForword = ChestPosition - FacePosition
        BodyForword.Z = 0
        if math.abs(self.Transform.Rotation.Z) > 90 then
            BodyForword = -BodyForword
        end
        Log:PrintLog("TXPerform(BodyRotation, BodyForword)", BodyForword)
        local BodyRotation = UMath:ForwardToRotator(BodyForword)
        Log:PrintLog("TXPerform(BodyRotation, 1)", BodyRotation)
        BodyRotation = BodyRotation - self:GetRotation()
        if FaceRotation.X <= 0 then
            Log:PrintLog("TXPerform(BodyRotation, 2)", BodyRotation)
            BodyRotation.Z = BodyRotation.Z + 180
        end

        if BodyRotation.Z - self.Transform.Rotation.Z > 180 then
            BodyRotation.Z = BodyRotation.Z -360
        elseif BodyRotation.Z - self.Transform.Rotation.Z < -180 then
            BodyRotation.Z = BodyRotation.Z +360
        end
        Log:PrintLog("TXPerform(BodyRotation, 3)", BodyRotation)
        self:SetFakeCharacterRotation(BodyRotation)
        TargetRotation = BodyRotation
    end

    --只有在活着的时候才表演动作，避免诈尸现象
    --根据健康值判定下一状态【要么站起，要么死亡】
    local Health = self:GetHealth()
    if Health > 0 then
        --倒下时，以命中身体部位决定到底姿态
        if FaceRotation.X > 0 then
            --面朝上
            Log:PrintLog("TXPerform(Animation = HitBackLoop)", self.UID)
            FakeCharacter:PlayAnim(self.UID, self.Animations.HitBackLoop)
        else
            --面朝下
            Log:PrintLog("TXPerform(Animation = HitFrontLoop)", self.UID)
            FakeCharacter:PlayAnim(self.UID, self.Animations.HitFrontLoop)
        end

        --播放起身动作
        Log:PrintLog("TXPerform(UpdateHitState, HitToIdle)")
        --关闭物理
        if self.Config.Perform.PhysicsBlendWeightTime <= 0 then
            self:PerformStandup(TargetRotation)
        else
            UGCS.Framework.Updator.Alloc(self.Config.Perform.PhysicsBlendWeightTime, nil, function(Process)
                --Log:PrintLog("TXPerform(PhysicsBlendWeight)", 1 - Process)
                FakeCharacter:SetAllBodiesPhysicsBlendWeight(self.UID, 1 - Process)
            end, function()
                self:PerformStandup(TargetRotation)
            end)
        end
    else
        --死亡，回合结束
        self:Death()
    end
end

--- 起身表演
---@param TargetRotation 目标旋转
function Player:PerformStandup(TargetRotation)
    --站起来后关闭物理模拟
    --FakeCharacter:EnableSimulatePhysics(self.UID, false)

    --站起时以面向朝向来决定站起
    local FaceRotation = FakeCharacter:GetSocketRotation(self.UID, self.Config.BodySetting.FaceBone)
    if FaceRotation.X > 0 then
        --面朝上
        Log:PrintLog("TXPerform(Animation = HitBackToIdle)", self.UID)
        FakeCharacter:PlayAnim(self.UID, self.Animations.HitBackToIdle)
    else
        --面朝下
        Log:PrintLog("TXPerform(Animation = HitFrontToIdle)", self.UID)
        FakeCharacter:PlayAnim(self.UID, self.Animations.HitFrontToIdle)
    end

    UGCS.Framework.Executor.Delay(self.Config.Perform.HitToIdleTime, function()
        --原始朝向
        local Rotation = self:GetRotation()
        --受击倒地后站起来再将旋转调整回来
        if self.Config.Perform.FaceToTargetTime <= 0 then
            --瞬時旋转
            self:PerformHitOver()
        else
            UGCS.Framework.Updator.Alloc(self.Config.Perform.FaceToTargetTime, nil, function(Progress)
                local BlendRotation = Rotation * Progress + TargetRotation * (1 - Progress)
                self:SetFakeCharacterRotation(BlendRotation)
            end, function()
                self:PerformHitOver()
            end)
        end
    end)
end

--- 受击表演结束
function Player:PerformHitOver()
    --原始朝向
    local Rotation = self:GetRotation()
    Log:PrintLog("TXPerform(BodyRotation, Last)", Rotation)
    self:SetFakeCharacterRotation(Rotation)

    Log:PrintLog("TXPerform(Animation = Idle)", self.UID)
    FakeCharacter:PlayAnim(self.UID, self.Animations.Idle)

    --切换到待机状态
    self:Idle()

    --受击表演完之后再切换回合
    if self.OwnerScene then
        self.OwnerScene:SwitchTurn()
    end
end

--- 绘制瞄准轨迹
---@param SplineId 曲线标识
---@param PitchDegree 俯仰角度，如果为nil，则清空曲线
---@param TrackColor 轨迹颜色
local function DrawAimTrack(self, SplineId, PitchDegree, TrackColor)
    local AimSetting = self.Config.AimSetting
    if SplineId and AimSetting then
        local SplinePoints = {}
        if PitchDegree and AimSetting then
            if self.Weapon then
                if AimSetting.SampleSpline then
                    local SpawnerPosition = self:GetLocation()
                    local SplineCurve = self.Weapon:BuildSplineCurve(PitchDegree, AimSetting.ShowTrackLength)
                    for _, SplineKeyPoint in pairs(SplineCurve) do
                        local RelativePosition = SplineKeyPoint.Point
                        local SplinePoint = SpawnerPosition + RelativePosition
                        table.insert(SplinePoints, SplinePoint)
                    end
                else
                    --计算起点【角色位置做一点偏移，即箭矢位置】
                    local SpawnerPosition = self.Weapon:GetSpawnerPosition()
                    table.insert(SplinePoints, SpawnerPosition)

                    --分别计算X，Z分量
                    local DeltaTime = 0
                    local PitchRadian = UMath:DegToRad(PitchDegree)
                    local OwnerScene = self.OwnerScene
                    local InitVelocity = self.Weapon.Attributes.Velocity
                    local Gravity = OwnerScene:GetGravity()
                    while true do
                        DeltaTime = DeltaTime + AimSetting.ShowTrackTimeStep
                        local RelativePosition = self.Weapon:SamplePosition(PitchRadian, InitVelocity, Gravity, DeltaTime)
                        local SplinePoint = SpawnerPosition + RelativePosition * 100
                        table.insert(SplinePoints, SplinePoint)
                        RelativePosition.Z = 0
                        if UMath:GetVectorLength(RelativePosition) >= AimSetting.ShowTrackLength then
                            --退出
                            break
                        end
                    end
                end
            end
        end
        --更新样条点
        Element:UpdateSplinePoints(SplineId, SplinePoints)

        --设置轨迹颜色
        if TrackColor then
            local PointCount = #SplinePoints - 1
            for Index = 1, PointCount do
                local StartDelta = (Index - 1.0) / PointCount
                local EndDelta = Index / PointCount
                local StartAlpha = AimSetting.StartAlpha * (1 - StartDelta) + AimSetting.EndAlpha * StartDelta
                local EndAlpha = AimSetting.StartAlpha * (1 - EndDelta) + AimSetting.EndAlpha * EndDelta
                Element:UpdateSplineColor(SplineId, TrackColor, Index, StartAlpha, EndAlpha)
            end
        end
    end
end

--- 绘制当前瞄准曲线
---@param PitchDegree 瞄准俯仰角
function Player:DrawCurrentTrack(PitchDegree)
    local AimSetting = self.Config.AimSetting
    if AimSetting then
        local TrackColor = AimSetting.CurrentTrackColor
        DrawAimTrack(self, self.CurrentSplineId, PitchDegree, TrackColor)
    end
end

--- 绘制历史瞄准曲线
---@param PitchDegree 瞄准俯仰角
function Player:DrawHistoryTrack(PitchDegree)
    local AimSetting = self.Config.AimSetting
    if AimSetting then
        local TrackColor = AimSetting.HistoryTrackColor
        DrawAimTrack(self, self.HistorySplineId, PitchDegree, TrackColor)
    end
end

return Player