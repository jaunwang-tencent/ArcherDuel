--武器
local Weapon = UGCS.RTTI.Class("Weapon", UGCS.Framework.Actor)

-- 武器投掷物实例池
local ProjectilesPool = {}

--- 获取投掷物
---@param SceneID 投掷物模型场景标识【类型】
---@param CallBack 回调函数
local function GetProjectile(SceneID, CallBack)
    if SceneID and CallBack then
        local Pool =  ProjectilesPool[SceneID]
        if Pool and #Pool > 0 then
            local ElementID = table.remove(Pool)
            CallBack(ElementID)
        else
            Element:SpawnElementWithTransform(Element.SPAWN_TYPE.Prefab, SceneID, function(ElementID)
                CallBack(ElementID)
            end)
        end
    end
end

--- 销毁投掷物实例
---@param ElementID 投掷物实例场景标识【实例】
---@param SceneID 投掷物模型场景标识【类型】
local function RemoveProjectile(ElementID, SceneID)
    if SceneID and ElementID then
        local Pool =  ProjectilesPool[SceneID]
        if not Pool then
            Pool = {}
            ProjectilesPool[SceneID] = Pool
        end
        Element:SetPosition(ElementID, Engine.Vector(1000, 1000, 1000), Element.COORDINATE.World)
        table.insert(Pool, ElementID)
    end
end

function Weapon:OnCreate(Context)
    Weapon.super.OnCreate(self, Context)
    --在此创建武器
    --1、获取武器配置【只读】
    self.Config = UGCS.Target.ArcherDuel.Config.WeaponConfig[Context.WeaponConfigID]
    self.Situation = Context.Situation

    --2、创建武器外观
    self:LoadAppearance()
    --3、武器属性，比如质量，射速，这里提供默认值，可以在具体的武器中调整数值，也可以考虑从外部透传进来【商业化卖武器】
    self.Attributes = {}
    if self.Config.Attributes then
        for key, value in pairs(self.Config.Attributes) do
            self.Attributes[key] = value
        end
    end
    --4、该武器所属角色
    self.OwnerPlayer = Context and Context.OwnerPlayer
    --5、获取当前武器所在的场景
    self.CurrentScene = self.OwnerPlayer.OwnerScene
    --6、投掷物实例
    self.Projectiles = {}
end

function Weapon:OnDestroy()
    Weapon.super.OnDestroy(self)
    --在此销毁武器
    self.Attributes = nil
    self.OwnerPlayer = nil
    self.CurrentScene = nil
    self.Situation = nil

    --TODO：在此销毁武器外观
    self.UID = nil

    --销毁投掷物实例
    for ElementID, ScenenID in pairs(self.Projectiles) do
        RemoveProjectile(ElementID, ScenenID)
    end
    self.Projectiles = nil
    self.Config = nil
    if self.HeldItemEffectID then
        Particle:StopParticle(self.HeldItemEffectID)
        self.HeldItemEffectID = nil
    end
end

--- 调整武器方向
---@param Velocity 当前武器速度
function Weapon:AdjustForward(Velocity)
    Element:SetForward(self.ProjectileInstance.ElementID, Velocity)
end

--- 根据俯仰角度采样位置的X,Z分量
---@param PitchRadian 俯仰角【单位：弧度】
---@param Time 时刻【单位：秒】
---@return 位置坐标【单位：米】
function Weapon:SamplePosition(PitchRadian, Velocity, Gravity, Time)
    local X = Velocity * math.cos(PitchRadian) * Time
    local Z = Velocity * math.sin(PitchRadian) * Time - 0.5 * Gravity * Time * Time

    --Y轴偏移修正
    if self.CurrentScene then
        --获取攻击者和受击者位移
        local Displacement = self.CurrentScene:GetDisplacement()
        if Displacement then
            local OffsetY = Displacement.Y
            if Displacement.X < 0 then
                OffsetY = -OffsetY
            end
            local WeaponResource = self:GetResource()
            local ProjectileConfig = WeaponResource and WeaponResource.Projectile
            local Y = ProjectileConfig.Offset.Y + OffsetY
            local Distance = math.abs(Displacement.X) * 0.01
            Y = -Y * 0.01 * X / Distance

            --反转
            if Displacement.X > 0 then
                X = -X
                Y = -Y
            end
            return Engine.Vector(X, Y, Z)
        end
    end
end

--- 根据俯仰角度采样线速度的X,Z分量【位置的一阶导数】
---@param PitchRadian 俯仰角【单位：弧度】
---@param Time 时刻【单位：秒】
---@return 当前速度【单位：米】
function Weapon:SampleVelocity(PitchRadian, Velocity, Gravity, Time)
    local X = Velocity * math.cos(PitchRadian)
    local Z = Velocity * math.sin(PitchRadian) - Gravity * Time

    --反转
    local Displacement = self.CurrentScene:GetDisplacement()
    if Displacement and Displacement.X < 0 then
        X = -X
    end
    return Engine.Vector(X, 0, Z)
end

--- 计算XOY平面两点间距离
---@param A A点
---@param B B点
---@return 两点间距
local function GetXOYDistance(A, B)
    local C = A - B
    C.Z = 0
    local XYLength = UMath:GetVectorLength(C) * 0.01
    return XYLength
end

--- 根据当前角度构建样条轨迹
---@param PitchDegree 角度
---@param IsAimTrack 是否位瞄准轨迹【瞄准轨迹不允许摆动】
---@param LimitDistance 限制距离【XOY平面，不填则不限制】
function Weapon:BuildSplineCurve(PitchDegree, IsAimTrack, LimitDistance)
    --玩家角色配置
    local CharacterConfig = self.OwnerPlayer.Config
    local AimSetting = CharacterConfig and CharacterConfig.AimSetting
    if AimSetting.SampleSpline then
        --计算两点间距
        local Displacement = self.CurrentScene:GetDisplacement()
        if Displacement then
            local Distance = UMath:GetVectorLength(Displacement)
            local HitSpline = AimSetting.HitSpline
            local SplineSetting = self.CurrentScene.Config.SplineSetting
            if HitSpline and SplineSetting then
                --重新计算命中区域
                local LowerDegree, UpperDegree = UGCS.Target.ArcherDuel.Helper.GameUtils.ComputeHitRange(HitSpline, Displacement)
                --经过小孔（相机）投射到纸片（屏幕空间）上的高度
                local ImageHeight = UpperDegree - LowerDegree
                --纸片（屏幕空间）距离小孔（相机）之间的距离
                local ImageLength = ImageHeight * Distance / (HitSpline.CharacterHeight * 100)
                --中点
                local MiddleDegree = 0.5 * (UpperDegree + LowerDegree)
                local CenterOffset = (PitchDegree - MiddleDegree) / ImageLength * Distance

                --获取目标点坐标位置
                local StartPoint = self:GetSpawnerOffset()
                --必经点
                local EndPoint = Displacement
                --终点偏移计算
                EndPoint.Z = EndPoint.Z + CenterOffset
                if not IsAimTrack then
                    --Y轴随机偏移【策划要求】
                    local Swing = AimSetting.Swing * 100
                    EndPoint.Y = EndPoint.Y + UMath:GetRandomFloat(-Swing, Swing)
                end

                --计算XOY平面距离
                local XYDistance = GetXOYDistance(StartPoint, EndPoint)
                local K = XYDistance / HitSpline.L

                --计算振幅
                local Amplitude = K * SplineSetting.Amplitude
                --中点【这一步很重要】
                local MiddlePoint = (StartPoint + EndPoint) * 0.5
                --首尾朝向
                local Forward = EndPoint - StartPoint
                Forward.Y = 0
                Forward = UMath:GetNormalize(Forward)
                --计算法线
                local Normal = Engine.Vector(-Forward.Z, 0, Forward.X)
                --法线始终朝上
                if Normal.Z < 0 then
                    Normal = -Normal
                end
                --法线朝向偏移一定振幅
                MiddlePoint = MiddlePoint + Normal * Amplitude * 100

                --曲率
                local Curvature = K * SplineSetting.Curvature

                --样条采样
                --Log:PrintLog(string.format("GenerateCurve(PitchDegree=%f, CenterOffset = %f, Curvature = %f, Amplitude = %f)", PitchDegree, CenterOffset, Curvature, Amplitude))
                local Segment = LimitDistance and HitSpline.AimTrackSegment or HitSpline.Segment
                local CurvePoints = UGCS.Target.ArcherDuel.Helper.GameUtils.GenerateCurve(StartPoint, MiddlePoint, EndPoint, Segment, Curvature, 1)

                if CurvePoints then
                    local PointCount = #CurvePoints
                    XYDistance = GetXOYDistance(CurvePoints[1], CurvePoints[PointCount])
                    --计算飞行总时间
                    local TotalTime = XYDistance / self.Attributes.Velocity
                    if PointCount > 0 then
                        local SplineCurve = {
                            [1] = {
                                Time = 0,
                                Point = CurvePoints[1]
                            }
                        }
                        local DeltaTime = TotalTime / (PointCount - 1)
                        for Index = 2, PointCount do
                            local SplineKey = {
                                Time = DeltaTime * (Index - 1),
                                Point = CurvePoints[Index]
                            }
                            SplineCurve[Index] = SplineKey

                            --越界处理
                            if LimitDistance and GetXOYDistance(CurvePoints[1], SplineKey.Point) > LimitDistance then
                                --跳出
                                break
                            end
                        end

                        --打印处样条曲线
                        --[[
                        for Index, SplineKey in pairs(SplineCurve) do
                            Log:PrintLog("SplineKey", Index, SplineKey.Time, SplineKey.Point)
                        end
                        --]]
                        self.LastSplineCurve = SplineCurve
                        return SplineCurve
                    end
                end
            end
        end
    end
end

--- 位置和速度采样
---@param Timestamp 时间戳
function Weapon:SamplePositionAndVelocity(Timestamp)
    local SplineCurve = self.ProjectileInstance and self.ProjectileInstance.SplineCurve
    if SplineCurve then
        local KeyPointCount = #SplineCurve
        for KeyIndex = 1, KeyPointCount do
            local Current = SplineCurve[KeyIndex]
            if Current.Time < Timestamp then
                local Next = SplineCurve[KeyIndex + 1]
                if Next then
                    if Next.Time > Timestamp then
                        local TimeLerp = (Timestamp - Current.Time) / (Next.Time - Current.Time)
                        local Position = Current.Point * (1 - TimeLerp) + Next.Point * TimeLerp
                        local Velocity = Next.Point - Current.Point
                        return Position, Velocity, false
                    end
                else
                    local Previous = SplineCurve[KeyIndex - 1]
                    if Previous then
                        local Position = Current.Point
                        local Velocity = Current.Point - Previous.Point
                        return Position, Velocity, true
                    end
                end
            end
        end
    end
end

--- 刷新武器
---@param DeltaTime 时间戳
function Weapon:Update(DeltaTime)
    if self.ProjectileInstance and self.CurrentScene then
        --当前时刻
        local CurrentTimestamp = UGCS.Framework.Application.current:Watch()
        local PassTime = CurrentTimestamp - self.ProjectileInstance.SpwanTimestamp

        --位置速度采样
        local RelativePosition, Velocity, IsOver = self:SamplePositionAndVelocity(PassTime)
        local SpawnerPosition
        if RelativePosition then
            SpawnerPosition = self.OwnerPlayer:GetLocation()
            if IsOver then
                self:HitTarget(nil, { hitPos = SpawnerPosition + RelativePosition })
                return
            end
            Velocity.Y = 0
        else
            --采样速度
            local InitVelocity = self.Attributes.Velocity
            local Gravity = self.CurrentScene:GetGravity()
            --根据流逝时间采样投射物位置
            local PitchRadian = UMath:DegToRad(self.ProjectileInstance.PitchDegree)
            RelativePosition = self:SamplePosition(PitchRadian, InitVelocity, Gravity, PassTime) * 100
            Velocity =  self:SampleVelocity(PitchRadian, InitVelocity, Gravity, PassTime)
            SpawnerPosition = self:GetSpawnerPosition()
        end
        --校正武器朝向
        if UMath:GetVectorLength(Velocity) ~= 0 then
            self:AdjustForward(Velocity)
        end
        --挪到发射器位置
        local CurrentPosition = SpawnerPosition + RelativePosition
        --刷新相机【相机跟随投掷物】
        self.CurrentScene:LookProjectile(CurrentPosition)

        --投掷物实例
        local ProjectileInstanceID = self.ProjectileInstance.ElementID
        local NeedRecordPosition = true
        if self.LastProjectilePosition then
            --使用上一帧位置与当前帧位置连线来检测碰撞
            local Start = self.LastProjectilePosition
            local End = CurrentPosition
            --优先命中人
            local ID, Result = PlayInteractive:GetHitResultWithRaycast(PlayInteractive.HIT_TYPE.Character, Start, End)
            if ID then
                --后续由API层提供
                local RayLine = (End - Start) * 10
                Result.HitBody = FakeCharacter:CheckPartWithRaycast(ID, Start - RayLine, End + RayLine)
                if Result.HitBody then
                    Log:PrintLog("TXPerform(HitBody)", Result.HitBody)
                    --命中类型
                    Result.HitType = PlayInteractive.HIT_TYPE.Character
                    --当前命中速度
                    Result.HitImpulse = Velocity * self.Attributes.Mass
                    Result.ProjectileID = ProjectileInstanceID
                    --命中目标
                    self:HitTarget(ID, Result)
                else
                    --没有检测到具体骨骼，不算命中!
                    ID = nil
                end
            else
                --再命中场景
                ID, Result = PlayInteractive:GetHitResultWithRaycast(PlayInteractive.HIT_TYPE.Element, Start, End)
                if ID and ID ~= ProjectileInstanceID then
                    --命中类型
                    Result.HitType = PlayInteractive.HIT_TYPE.Element
                    --当前命中速度
                    Result.HitImpulse = Velocity * self.Attributes.Mass
                    Result.ProjectileID = ProjectileInstanceID
                    --命中目标
                    self:HitTarget(ID, Result)
                end
            end

            if ID then
                --箭矢位置校正
                CurrentPosition = Result.hitPos
                NeedRecordPosition = false
            end
        end

        --设置位置【只有在管理器中的实例才允许更新位置】
        if self.Projectiles[ProjectileInstanceID] then
            Element:SetPosition(ProjectileInstanceID, CurrentPosition, Element.COORDINATE.World)
        end

        --备份上一帧位置
        if NeedRecordPosition then
            self.LastProjectilePosition = CurrentPosition
        end
    end
end

--- 获取指定战斗阶段资源配置
function Weapon:GetResource()
    if self.Situation then
        local WeaponResource = self.Config and self.Config.Resource
        local TargetResource = WeaponResource and WeaponResource[self.Situation]
        return TargetResource
    end
end

--- 获取特效数据
---@param Name 特效名称
function Weapon:GetEffect(Name)
    --优先找资源里面的
    local WeaponResource = self.Config and self.Config.Resource
    local ResourceData = WeaponResource[Name]
    local EffectData = ResourceData and ResourceData.Effect
    
    --如果找不到则找特效
    if not EffectData then
        --武器资产
        local Effects = self.Config and self.Config.Effects
        --命中特效
        EffectData = Effects and Effects[Name]
    end
    return EffectData
end

--- 在元件身上播放特效
---@param ElementID 元件标识
---@param EffectName 特效名称
function Weapon:PlayEffectOnElement(ElementID, EffectName)
    local EffectData = self:GetEffect(EffectName)
    if EffectData and ElementID then
        --投掷特效
        local EffectID = Particle:PlayOnActor(EffectData.ID, ElementID, false)
        local Size = EffectData.Size and EffectData.Size or 1
        Particle:SetParticleScale(EffectID, Engine.Vector(Size, Size, Size))
        Particle:SetParticlePosition(EffectID, EffectData.Offset)
        return EffectID
    end
end

--- 在指定位置播放特效
---@param Position 指定位置
---@param EffectName 特效名称
function Weapon:PlayEffectOnPosition(Position, EffectName)
    local EffectData = self:GetEffect(EffectName)
    if EffectData and Position then
        --投掷特效
        local Size = EffectData.Size and EffectData.Size or 1
        local EffectID = Particle:PlayAtPosition(EffectData.ID, Position + EffectData.Offset, Size, true, 100)
        return EffectID
    end
end

--- 加载武器外观
function Weapon:LoadAppearance()
    local WeaponResource = self:GetResource()
    local HeldItem = WeaponResource and WeaponResource.HeldItem
    local Rotation = Element:GetRotation(HeldItem.Root)
    local Scale = Element:GetScale(HeldItem.Root)
    Element:SpawnElementWithTransform(Element.SPAWN_TYPE.Prefab, HeldItem.Root, function(ElementID)
        self.UID = ElementID
        --绑定到玩家身上
        local CharacterUID = self.OwnerPlayer.UID
        Element:BindingToCharacterOrNPC(ElementID, CharacterUID, HeldItem.BindBone, Character.SOCKET_MODE.SnapToTarget)
        --播放手持物特效
        self.HeldItemEffectID = self:PlayEffectOnElement(ElementID, "HeldItem")
        --绑定结束
        self:OnLoadAppearanceCompleted(ElementID)
    end, nil, Rotation, Scale)
end

--- 武器外观加载完毕
---@param ElementID 外观元件
function Weapon:OnLoadAppearanceCompleted(ElementID)

end

--- 武器表演【目前只有瞄准阶段】
---@param DurationTime 持续时间，0表示一直持续
function Weapon:Perform(DurationTime)

end

--- 获取投掷物生成点偏移
function Weapon:GetSpawnerOffset()
    local WeaponResource = self:GetResource()
    local ProjectileData = WeaponResource and WeaponResource.Projectile
    local SpawnerOffset = Engine.Vector(ProjectileData.Offset.X, ProjectileData.Offset.Y, ProjectileData.Offset.Z)
    --获取位移
    local Displacement = self.CurrentScene:GetDisplacement()
    if Displacement and Displacement.X < 0 then
        SpawnerOffset.Y = -SpawnerOffset.Y
    end
    return SpawnerOffset
end

--- 获取投掷物发射器位置
---@return 发射器位置
function Weapon:GetSpawnerPosition()
    local WeaponResource = self:GetResource()
    local ProjectileData = WeaponResource and WeaponResource.Projectile
    local SpawnerPosition = self.OwnerPlayer:GetLocation()
    SpawnerPosition = SpawnerPosition + ProjectileData.Offset
    local Displacement = self.CurrentScene:GetDisplacement()
    if Displacement and Displacement.X < 0 then
        SpawnerPosition.Y = SpawnerPosition.Y - 2 * ProjectileData.Offset.Y
    end
    return SpawnerPosition
end

--- 武器发射投掷物
---@param PitchDegree 发射角度
function Weapon:SpawnProjectile(PitchDegree)
    --武器投掷物
    local WeaponResource = self:GetResource()
    local ProjectileData = WeaponResource and WeaponResource.Projectile
    local StartPosition = self:GetSpawnerPosition()
    local Rotation = Element:GetRotation(ProjectileData.Root)
    local Scale = Element:GetScale(ProjectileData.Root)

    GetProjectile(ProjectileData.Root, function(ElementID)
        Element:SetPosition(ElementID,StartPosition,Element.COORDINATE.World)
        Element:SetRotation(ElementID,Rotation,Element.COORDINATE.World)
        Element:SetScale(ElementID,Scale)

        --当前投掷物实例信息
        self.ProjectileInstance = {
            --生成时刻`
            SpwanTimestamp = UGCS.Framework.Application.current:Watch(),
            --投掷物标识
            ElementID = ElementID,
            --投掷角度
            PitchDegree = PitchDegree,
        }
        --播放掷物物特效
        self.ProjectileInstance.EffectID = self:PlayEffectOnElement(ElementID, "Projectile")
        --构建样条曲线
        self.ProjectileInstance.SplineCurve = self:BuildSplineCurve(PitchDegree, false)
        if self.ProjectileInstance.SplineCurve then
            --初始化曲线光标【性能优化使用】
            self.ProjectileInstance.CurveCursor = 1
        end
        --首次刷新主相机
        self.CurrentScene:LookProjectile(StartPosition)

        --管理投掷物
        self.Projectiles[ElementID] = ProjectileData.Root
    end)
end

--- 命中目标ss
---@param ElementID 命中对象标识
---@param Result 命中结果信息
function Weapon:HitTarget(ElementID, Result)
    --在此播放命中特效
    if Result and Result.hitPos then
        self:PlayEffectOnPosition(Result.hitPos, "Hit")
    end

    --受击者相应
    if Result and Result.HitType == PlayInteractive.HIT_TYPE.Character then
        --调整冲量，未来走配置
        local ImpulseForward = UMath:GetNormalize(Result.HitImpulse)
        Result.HitImpulse = ImpulseForward * 375000

        --命中角色，由角色响应
        if self.CurrentScene then
            if Result.HitBody == Character.SOCKET_NAME.Head and self.OwnerPlayer:IsControlled() then
                --本人命中他人时，爆头提示
                self.CurrentScene:HeadShot()
            end
            local NextTurnPlayer = self.CurrentScene:GetNextTurnPlayer()
            if ElementID == NextTurnPlayer.UID then
                --将投射物附加到角色身上
                Element:BindingToCharacterOrNPC(Result.ProjectileID, ElementID, Result.HitBody, Character.SOCKET_MODE.KeepWorld)
                --角色命中
                NextTurnPlayer:Hit(self.OwnerPlayer, Result.HitImpulse, Result.HitBody)
            end
        end
    else
        --是否需要切回合
        local NeedSwitchTurn = true
        --场景资源
        local SceneResource = self.CurrentScene:GetResource()
        --障碍物
        local Obstacle = SceneResource and SceneResource.Obstacle
        if Obstacle and ElementID then
            --投掷物实例标识
            local ProjectileElementID = self.ProjectileInstance.ElementID

            --可移动物体
            local MovableList = Obstacle.MovableList
            if MovableList and MovableList[ElementID] then
                --绑定到障碍物元件
                Element:BindingToElement(ProjectileElementID, ElementID)
            
                --对方受击表演【假摔，没任何伤害!^_^!】
                local NextTurnPlayer = self.CurrentScene:GetNextTurnPlayer()                
                if NextTurnPlayer:CheckContact(ElementID) then
                    NextTurnPlayer:PerformHitStart()
                    NeedSwitchTurn = false
                end

                --施加力
                local ImpulseForward = UMath:GetNormalize(Result.HitImpulse)
                local HitForce = ImpulseForward * Obstacle.ForceSize
                Element:AddForce(ElementID, HitForce)
            end
            --空中活体
            local BodyList = Obstacle.BodyList
            if BodyList and BodyList[ElementID] then
                --移动到地面
                local Position = Element:GetPosition(ElementID)
                local DropPosition = Position + Obstacle.DropOffset
                --位置瞬移
                Element:SetPosition(ElementID, DropPosition, Element.COORDINATE.World)
                --播放特效
                Particle:PlayAtPosition(Obstacle.ExplosionEffect, Position, 1)

                --销毁投掷物
                local SceneID = self.Projectiles[ProjectileElementID]
                RemoveProjectile(ProjectileElementID, SceneID)
                self.Projectiles[ProjectileElementID] = nil
            end
        end
        --切换回合
        if NeedSwitchTurn and self.CurrentScene then
            --播放音效
            local Audios = self.Config and self.Config.Audios
            if Audios then
                self.OwnerPlayer:PlayAudio(Audios.Hit)
            end
            self.CurrentScene:SwitchTurn()
        end
    end
    Particle:StopParticle(self.ProjectileInstance.EffectID)
    self.ProjectileInstance = nil
    self.LastProjectilePosition = nil
end

return Weapon