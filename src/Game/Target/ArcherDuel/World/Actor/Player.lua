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

    -- 是否只做表演
    self.OnlyShow = Context and Context.OnlyShow or false
    --是否为本地控制
    local Controlled = Context and Context.Controlled or false
    --在此创建假人【这个非常耗】
    self.UID = FakeCharacter:CreateCharacter(self.Transform.Location, self.Transform.Rotation, self.Transform.Scale, false)
    self:SetFakeCharacterRotation(self.Transform.Rotation)
    -- 给假人换装
    if Controlled then
        local LocalPlayerUID = Character:GetLocalPlayerId()
        Character:SetAttributeEnabled(LocalPlayerUID, Character.ATTR_ENABLE.CanMove, false)
        Character:SetAttributeEnabled(LocalPlayerUID, Character.ATTR_ENABLE.MeshVisibility, false)
        FakeCharacter:ChangeBodyFromPlayer(self.UID, LocalPlayerUID)
    else
        self:ChangeCharacterBody(Context.Equipments)
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

    --创建角色后，分配角色状态机
    self.FSM = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.Character.FSM, {
        OwnerPlayer = self
    })

    --创建武器
    self.WeaponConfig = UGCS.Target.ArcherDuel.Config.WeaponConfig[Context.WeaponConfigID]
    self.Weapon = UGCS.RTTI.CreateInstanceByTypeName(self.WeaponConfig.TypeName, {
        WeaponConfigID = Context.WeaponConfigID,
        Situation = Context.Situation,
        OwnerPlayer = self
    })

    --引用武器配置中的动画【因为持有不同武器播放的动画不一样，所以就设计在武器配置中了】
    self.Animations = self.WeaponConfig.Animations
    self.Audios = self.WeaponConfig.Audios

    -- 设置角色初始血量
    self:SetPlayerHP()

    --创建曲线
    if self.Attributes.Controlled then
        self.HistorySplineId = Element:AddSpline()
        self.CurrentSplineId = Element:AddSpline()
    end

    --待机动画
    self:PlayAnim(self.Animations.Idle)
end

function Player:OnDestroy()
    UGCS.Framework.Executor.Cancel(self.FireTimer)
    UGCS.Framework.Executor.Cancel(self.StandupTimer)
    UGCS.Framework.Updator.Free(self.StandupTimer2, true)
    UGCS.Framework.Executor.Cancel(self.HitTimer)
    UGCS.Framework.Updator.Free(self.FallbackTimer, true)

    --清空配置
    self.Config = nil
    self.Animations = nil
    self.Audios = nil

    self.Weapon:Destroy()
    self.Weapon = nil

    --清空属性
    self.Attributes = nil
    self.UI_HP = nil
    self.UI_Damage = nil

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

function Player:ShowDamage(Damage)
    if self.OnlyShow then return end
    if self.UI_Damage ~= nil then
        UI:SetVisible({self.UI_Damage}, true)
        UI:SetText({self.UI_Damage}, string.format("-%d", math.floor(Damage)))
        UI:PlayUIAnimation(self.UI_Damage, 1, 0)
    end
end

--- 设置血量
---@param Health 血量
function Player:SetHealth(Health)
    if self.OnlyShow then return end
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

--- 检测当前角色是否与目标元件接触
---@param ElementID 元件标识
function Player:CheckContact(ElementID)
    --在此判定与角色之间的关系
    local Start = self:GetLocation()
    local End = Start + Engine.Vector(0, 0, -1000)
    local HitIDs = PlayInteractive:GetHitResultsWithCapsule(PlayInteractive.HIT_TYPE.Element, Start, End, 50, 50)
    for _, ID in pairs(HitIDs) do
        if ID == ElementID then
            return true
        end
    end
    return false
end

--- 移动探针
function Player:ProbeMovement()
    self.LastPosition = nil
    self.LastTimestamp = nil
    self.MovementState = nil
    self.IdleTimestamp = nil
end

--- 获取指定玩家移动状态【浮空、着地移动，着地停止】
---@param ActorID 角色标识
---@return 移动类型
function Player:UpdateMovementState()
    --只要不是静止状态，则探测移动状态
    if self.MovementState ~= EMovement.Idle then
        local CurrentTimestamp = UGCS.Framework.Application.current:Watch()
        local Start = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.ProbeBone)
        local End = Start + Engine.Vector(0, 0, -100000)
        --最终移动状态
        local MovementState

        --移动探针
        local MovementProbe = self.Config and self.Config.MovementProbe
        if MovementProbe then
            local ID, Result = PlayInteractive:GetHitResultWithRaycast(PlayInteractive.HIT_TYPE.Element, Start, End)
            if ID then
                local Height = Start.Z - Result.hitPos.Z
                if Height > MovementProbe.LandingProbe then
                    --浮空态
                    self.IdleTimestamp = nil
                    MovementState = EMovement.Float
                end
            else
                --浮空态
                self.IdleTimestamp = nil
                MovementState = EMovement.Float
            end

            if not MovementState then
                --进一步检测非浮空态位移态
                if self.LastPosition then
                    --检测到距离上一次位移差超过容错值则判定为移动态
                    local Distance = UMath:GetDistance(Start, self.LastPosition)
                    local DeltaTime = CurrentTimestamp - self.LastTimestamp
                    local Velocity = Distance / DeltaTime
                    --Log:PrintLog("TXPerform(Velocity)", Velocity)
                    if Velocity < MovementProbe.ProbeTolerance then
                        if self.IdleTimestamp then
                            local IdlePassTime = CurrentTimestamp - self.IdleTimestamp
                            if IdlePassTime > MovementProbe.CheckIdleTime then
                                MovementState = EMovement.Idle
                            end
                        else
                            self.IdleTimestamp = CurrentTimestamp
                        end
                    else
                        self.IdleTimestamp = nil
                        MovementState = EMovement.Move
                    end
                end
            end
        end

        --更新移动状态
        if MovementState then
            if self.MovementState ~= MovementState then
                self.MovementState = MovementState
                Log:PrintLog("TXPerform(MovementStateChanged)", MovementState)
            end

            if MovementState == EMovement.Idle then
                --只有在待机态时才刷新位置
                self:SyncLocation()
                --延迟初始化时设置镜头的时机
                if self.LookAtFlag == true and self.OwnerScene ~= nil then
                    local CurrentTurnPlayer = self.OwnerScene:GetCurrentTurnPlayer()
                    if CurrentTurnPlayer == self then
                        self.OwnerScene:LookPlayer(CurrentTurnPlayer)
                    end
                    self.LookAtFlag = false
                end
            end
        end

        --更新探针骨骼位置与时刻
        self.LastPosition = Start
        self.LastTimestamp = CurrentTimestamp
    end
end

--- 同步位置
---@return 玩家位置
function Player:SyncLocation()
    local Position = FakeCharacter:GetPosition(self.UID)
    self:SetLocation(Position)
    return Position
end

--- 设置假人旋转【逆时针旋转90度】
---@param Rotation 欧拉角
function Player:SetFakeCharacterRotation(Rotation)
    Rotation = Rotation - Engine.Rotator(0, 0, 90)
    if Rotation.Z > 180 then
        Rotation.Z = Rotation.Z - 360
    elseif Rotation.Z  < -180 then
        Rotation.Z = Rotation.Z + 360
    end
    FakeCharacter:SetRotation(self.UID, Rotation)
end


-- 获取玩家装备数据
function Player:SetPlayerHP()
    local equipData = self:GetEquipData()
    self.Attributes.Health = self.Attributes.Health + equipData.hp

    --抬头血量显示
    local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
    local BattleView = UIConfig and UIConfig.BattleView
    if BattleView then
        local PlayerView = self.Attributes.Controlled and BattleView.LocalPlayer or BattleView.EnemyPlayer
        if PlayerView then
            self.UI_HP = PlayerView.HPValue
            local HUD_HPList = {self.UI_HP}
            self.hpMax = self.Attributes.Health
            UI:SetProgressMaxValue(HUD_HPList, self.hpMax)
            UI:SetProgressCurrentValue(HUD_HPList, self.hpMax)
            self.UI_Damage = PlayerView.DeductHP
        end
    end
end

-- 获取玩家血量百分比
function Player:GetPlayerHPRate()
    if self.Attributes and self.Attributes.Health and self.hpMax then
        return self.Attributes.Health/self.hpMax
    end
    return 0
end

function Player:GetDefaultData(PlayerID, KeyStr, DefaultValue)
    local data = Archive:GetPlayerData(PlayerID, Archive.TYPE.Number, KeyStr)
    if not data or data == 0 then
        data = DefaultValue
    end
    return data
end

-- 获取玩家装备数据
function Player:GetEquipData(ForceUpdate)
    if ForceUpdate or not self.EquipData then
        local PlayerID = Character:GetLocalPlayerId()
        local Part_Num = self:GetDefaultData(PlayerID, "Equipped_Character_ID", 1)
        local Bottoms_Num = self:GetDefaultData(PlayerID, "Equipped_Bottoms_ID", 38)
        local Cloth_Num = self:GetDefaultData(PlayerID, "Equipped_Top_ID", 15)
        local Bow_Lv = self:GetDefaultData(PlayerID, "Equipped_Bow_Lv", 1)
        local Spear_Lv = self:GetDefaultData(PlayerID, "Equipped_Spear_Lv", 1)
        local Axe_Lv = self:GetDefaultData(PlayerID, "Equipped_Axe_Lv", 1)
        local Part_Lv = self:GetDefaultData(PlayerID, "Equipped_Part_Lv", 1)
        local Bottoms_Lv = self:GetDefaultData(PlayerID, "Equipped_Bottoms_Lv", 1)
        local Cloth_Lv = self:GetDefaultData(PlayerID, "Equipped_Top_Lv", 1)

        local Weapon_Lv
        -- todo self.WeaponType is nil
        if self.WeaponType == 1 then
            Weapon_Lv = Bow_Lv
        elseif self.WeaponType == 2 then
            Weapon_Lv = Spear_Lv
        else
            Weapon_Lv = Axe_Lv
        end

        -- Log:PrintLog("self.WeaponConfig.TypeName", self.WeaponConfig.TypeName)

        local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
        local ClothConfig = EquipmentConfig and EquipmentConfig[Cloth_Num]
        local PartConfig = EquipmentConfig and EquipmentConfig[Part_Num]
        local BottomsConfig = EquipmentConfig and EquipmentConfig[Bottoms_Num]

        -- 基础伤害
        local damage = 20
        -- 头部伤害倍率
        local head_damageRate = 1
        -- 身体伤害倍率
        local body_damageRate = 1
        if self.WeaponConfig ~= nil then
            head_damageRate = self.WeaponConfig.Attributes.HeadShotIncrease
            body_damageRate = self.WeaponConfig.Attributes.BodyShotIncrease
            if PartConfig ~= nil then
                damage = self.WeaponConfig.Attributes.Attack + self.WeaponConfig.Attributes.Growth * ( Weapon_Lv - 1)
                            + PartConfig.Attributes.Attack + PartConfig.Attributes.Growth * ( Part_Lv - 1)
            end
        end

        -- 血量加成
        local hp = 100
        if ClothConfig ~= nil then
            hp = ClothConfig.Attributes.Heal + ClothConfig.Attributes.Growth * Cloth_Lv
        end

        -- 头部保护
        local head_protection = 0
        if ClothConfig ~= nil and PartConfig ~= nil and BottomsConfig ~= nil then
            head_protection = PartConfig.Attributes.HeadShotReduction + ClothConfig.Attributes.DamageReduction
                                + BottomsConfig.Attributes.DamageReduction
        end

        -- 身体保护
        local body_protection = 0
        if ClothConfig ~= nil and BottomsConfig ~= nil then
            body_protection = ClothConfig.Attributes.BodyShotReduction + BottomsConfig.Attributes.BodyShotReduction
                                + ClothConfig.Attributes.DamageReduction + BottomsConfig.Attributes.DamageReduction
        end

        if self:IsControlled() then -- 玩家自身的属性
            self.EquipData = {
                damage = damage,
                head_damageRate = head_damageRate,
                body_damageRate = body_damageRate,
                hp = hp,
                head_protection = head_protection,
                body_protection = body_protection
            }
        else -- 玩家对手的属性
            local rate = math.random(8, 10)
            rate = rate / 10
            self.EquipData = {
                damage = damage * rate,
                head_damageRate = head_damageRate,
                body_damageRate = body_damageRate,
                hp = hp * rate,
                head_protection = head_protection,
                body_protection = body_protection,
            }
        end
    end
    return self.EquipData
end

--- 播放音效【2D】
---@param SFXType 音效类型
function Player:PlayAudio(SFXType)
    if SFXType then
        Log:PrintLog(string.format("TXPerform(Audio = %d, UID = %d)", SFXType, self.UID))
        Audio:PlaySFXAudio2D(SFXType, 4, 100, 0)
    end
end

--- 播放动画
---@param AnimName 动画名称
function Player:PlayAnim(AnimName)
    if AnimName then
        Log:PrintLog(string.format("TXPerform(Animation = %s, UID = %d)", AnimName, self.UID))
        FakeCharacter:PlayAnim(self.UID, AnimName)
    end
end

--- 待机状态
---@return Success 状态是否切换成功
function Player:Idle()
    --播放动画
    self:PlayAnim(self.Animations.Idle)

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
---@param Attacker 攻击者
---@param AttackImpulse 攻击冲量
---@param BodyType 身体部位
---@return Success 状态是否切换成功
function Player:Hit(Attacker, AttackImpulse, BodyType)
    if self.FSM then
        local HitState = UGCS.Target.ArcherDuel.Character.States.HitState
        return self.FSM:SwitchState(HitState, { Attacker = Attacker, AttackImpulse = AttackImpulse, BodyType = BodyType})
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

        -- 发送游戏结果信号
        local EventName = self:IsControlled() and _GAME.Events.BattleFail or _GAME.Events.BattleVictory
        System:FireGameEvent(EventName)
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
    --播放音效
    self:PlayAudio(self.Audios.PullString)

    --播放动作
    self:PlayAnim(self.Animations.Aim)

    --瞄准时武器表演
    self.Weapon:Perform(self.Config.Perform.PullStringTime)
end

--- 发射投掷物
---@param PitchDegree 俯仰角【单位：角度】
function Player:FireProjectile(PitchDegree)
    --播放音效
    self:PlayAudio(self.Audios.Fly)
    self.Weapon:SpawnProjectile(PitchDegree)
end

--- 攻击表演
function Player:PerformFire()
    --播放音效
    self:PlayAudio(self.Audios.Fire)

    --播放使用对应的武器动作
    self:PlayAnim(self.Animations.Fire)

    --攻击时武器表演
    self.Weapon:Perform()

    --一段时间回到持有武器待机动作
    self.FireTimer = UGCS.Framework.Executor.Delay(self.Config.Perform.FireToIdleTime, function()
        self:PlayAnim(self.Animations.Idle)
    end)
end

--- 处理伤害【关于伤害计算相关的数值计算全部收敛到这里，外面就不要搞了】
---@param Attacker 攻击者
---@param BodyType 身体部位
function Player:HandleDamage(Attacker, BodyType)
    --1、获取攻击者装备
    local AttackerEquipData = Attacker:GetEquipData()
    --2、获取防御者装备
    local DefenderEquipData = self:GetEquipData()

    --3、伤害计算
    --3.1、基础伤害
    local Damage = AttackerEquipData and AttackerEquipData.damage or Attacker.Weapon.Attributes.Attack
    --3.2、伤害加成
    if AttackerEquipData and DefenderEquipData then
        if BodyType == Character.SOCKET_NAME.Head then
            --爆头
            Damage = Damage * (1 + AttackerEquipData.head_damageRate or 0)
            Damage = Damage * (1 - DefenderEquipData.head_protection or 0)
        else
            --打身
            Damage = Damage * (1 + AttackerEquipData.body_damageRate or 0)
            Damage = Damage * (1 - DefenderEquipData.body_protection or 0)
        end
    end
    --3.3、伤害倍率
    local DamageRate = self:GetDamageRate(BodyType)
    Damage = Damage * DamageRate

    --4、扣血计算
    local Health = self:GetHealth()
    Health = Health - Damage

    --5、伤害UI跳字
    self:ShowDamage(Damage)

    self:SetHealth(Health)
end

--- 受击表演开始
---@param Impulse 冲量
---@param BodyType 身体部位
function Player:PerformHitStart(Impulse, BodyType)
    --播放音效
    self:PlayAudio(self.Audios.Hit)

    --受击表演开始时清空移动状态，触发位置探针
    self:ProbeMovement()

    --开始物理模拟【务必在施加冲量之前开启物理模拟】
    FakeCharacter:EnableSimulatePhysics(self.UID, true)
    FakeCharacter:SetAllBodiesPhysicsBlendWeight(self.UID, 1)

    --计算参照系骨骼偏移量
    local SocketPosition1 = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.OffsetBone)
    local Position1 = FakeCharacter:GetPosition(self.UID)
    local OffsetPosition = Position1 - SocketPosition1

    if Impulse and BodyType then
        --施加冲量
        local HasAdded = false
        local ImpulseConfig = UGCS.Target.ArcherDuel.Config.ImpulseConfig
        --根据命中部位获取物理作用方案
        local ImpulsePolicy = ImpulseConfig and ImpulseConfig[BodyType]
        if ImpulsePolicy then
            --随机一套策略方案
            local PolicyCount = #ImpulsePolicy
            local PolicyIndex = UMath:GetRandomInt(1, PolicyCount)
            --拿到冲量策略
            local ImpulseList = ImpulsePolicy[PolicyIndex]

            --反向前向【朝后】【只关心X轴方向】
            local ReverseForward = -self:GetForward()
            for _, ImpulseItem in pairs(ImpulseList) do
                local ImpulseValue = ImpulseItem.ImpulseValue
                local ForwardDegree = ImpulseItem.ForwardDegree
                if ImpulseValue and ForwardDegree then
                    local ForwardRadian = UMath:DegToRad(ForwardDegree)
                    local ImpulseForward = Engine.Vector(math.cos(ForwardRadian), 0, math.sin(ForwardRadian))
                    if ReverseForward.X < 0 then
                        ImpulseForward.X = -ImpulseForward.X
                    end
                    HasAdded = true
                    FakeCharacter:AddImpulse(self.UID, ImpulseForward * ImpulseValue, BodyType)
                end
            end
        end

        --如果没有施加，则给一个默认冲量【速度相关】
        if not HasAdded then
            FakeCharacter:AddImpulse(self.UID, Impulse, BodyType)
        end
    end

    --躺地一段时间
    self.HitTimer = UGCS.Framework.Executor.Delay(self.Config.Perform.LandingKeepTime, function()
        --躺地一段时间后，移动胶囊体，对齐到可视化网格
        local SocketPosition2 = FakeCharacter:GetSocketPosition(self.UID, self.Config.BodySetting.OffsetBone)
        if SocketPosition2 then
            --先禁用可移动物体
            self.OwnerScene:EnableMovable(false)
            Log:PrintLog("TXPerform(ResetPosition, MovementState)", self.MovementState)
            --修正坐标【会影响接触的可移动障碍物】
            local Position2 = SocketPosition2 + OffsetPosition
            FakeCharacter:SetPosition(self.UID, Position2)
            --刷新位置
            self:SetLocation(Position2)
        end

        --表演倒地
        self:PerformFallback()
    end)
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
            self:PlayAnim(self.Animations.HitBackLoop)
        else
            --面朝下
            self:PlayAnim(self.Animations.HitFrontLoop)
        end

        --播放起身动作
        Log:PrintLog("TXPerform(UpdateHitState, HitToIdle)")
        --关闭物理
        if self.Config.Perform.PhysicsBlendWeightTime <= 0 then
            self:PerformStandup(TargetRotation)
        else
            self.FallbackTimer = UGCS.Framework.Updator.Alloc(self.Config.Perform.PhysicsBlendWeightTime, nil, function(Process)
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

    --先恢复可移动物体
    self.OwnerScene:EnableMovable(true)

    --站起时以面向朝向来决定站起
    local FaceRotation = FakeCharacter:GetSocketRotation(self.UID, self.Config.BodySetting.FaceBone)
    if FaceRotation.X > 0 then
        --面朝上
        self:PlayAnim(self.Animations.HitBackToIdle)
    else
        --面朝下
        self:PlayAnim(self.Animations.HitFrontToIdle)
    end

    self.StandupTimer = UGCS.Framework.Executor.Delay(self.Config.Perform.HitToIdleTime, function()
        --原始朝向
        local Rotation = self:GetRotation()
        --受击倒地后站起来再将旋转调整回来
        if self.Config.Perform.FaceToTargetTime <= 0 then
            --瞬時旋转
            self:PerformHitOver()
        else
            self.StandupTimer2 = UGCS.Framework.Updator.Alloc(self.Config.Perform.FaceToTargetTime, nil, function(Progress)
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
    
    --起来后同步位置
    self:SyncLocation()

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
                -- local ShowTrackLength = AimSetting.ShowTrackLength
                local SpawnerPosition = self:GetLocation()
                if AimSetting.SampleSpline then
                    local SplineCurve, MiddlePoint = self.Weapon:BuildSplineCurve(PitchDegree, true)
                    for i, v in ipairs(SplineCurve) do
                        if v.Point == MiddlePoint then
                            if SplineCurve[i + 2] then
                                table.insert(SplinePoints, SpawnerPosition + v.Point)
                                table.insert(SplinePoints, SpawnerPosition + SplineCurve[i + 2].Point)
                                break
                            end
                        end

                        if (i-1)%3 == 0 then
                            local RelativePosition = v.Point
                            local SplinePoint = SpawnerPosition + RelativePosition
                            table.insert(SplinePoints, SplinePoint)
                        end
                    end
                else
                    --计算起点【角色位置做一点偏移，即箭矢位置】
                    table.insert(SplinePoints, SpawnerPosition)

                    --分别计算X，Z分量
                    local DeltaTime = 0
                    local PitchRadian = UMath:DegToRad(PitchDegree)
                    local OwnerScene = self.OwnerScene
                    local InitVelocity = self.Weapon:ComputeVelocity(PitchDegree)
                    local Gravity = OwnerScene:GetGravity()
                    --这里确保有效性
                    ShowTrackLength = ShowTrackLength or 5
                    local TotalLength = 0
                    local LastPosition
                    local forward = OwnerScene:GetDisplacement()

                    while TotalLength < ShowTrackLength do
                        DeltaTime = DeltaTime + AimSetting.ShowTrackTimeStep
                        local RelativePosition = self.Weapon:SamplePosition(PitchRadian, InitVelocity, Gravity, DeltaTime)
                        if LastPosition then
                            TotalLength = TotalLength + UMath:GetDistance(LastPosition, RelativePosition)
                        end
                        LastPosition = RelativePosition
                        local SplinePoint = SpawnerPosition + (RelativePosition + Engine.Vector(0, forward.Y*TotalLength*0.1, 0)) * 100
                        table.insert(SplinePoints, SplinePoint)
                    end
                end
            end
        end
        --更新样条点
        Element:UpdateSplinePoints(SplineId, SplinePoints)
        if self.HistorySplineId == SplineId then
            Element:SetSplineSpeed(SplineId, 0)
        end

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

function Player:ChangeCharacterBody(Equipments)
    if Equipments then
        local bodyIds = {}
        local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
        for i, v in pairs(Equipments) do
            if EquipmentConfig[v] and EquipmentConfig[v].EquipID then
                table.insert(bodyIds, EquipmentConfig[v].EquipID)
            end
        end
        FakeCharacter:ChangeCharacterBody(self.UID, bodyIds)
    end
end

function Player:SetLookAt()
    self.LookAtFlag = true
end

return Player