--角色配置
local CharacterConfig = {
    [1] = {
        --表演
        Perform = {
            --AI待机到瞄准时间【单位：秒】
            AIIdleToAimTime = 0.5,
            --AI瞄准到射击时间【单位：秒】
            AIAimToFireTime = 2,
            --拉弓弦所需时间【单位：秒，只针对箭】
            PullStringTime = 1.5,
            --射击到待机时长【单位：秒】
            FireToIdleTime = 1,
            --趟地停留时长,被被击倒躺在地上【单位：秒】
            LandingKeepTime = 2,
            --物理混合时长,躺着一段时间后恢复意识【单位：秒】
            PhysicsBlendWeightTime = 0.3,
            --受击到待机时长【单位：秒】
            HitToIdleTime = 2,
            --面相目标所需时长【单位：秒】
            FaceToTargetTime = 0.5,
        },
        --移动探针
        MovementProbe = {
            --着陆点探针【注意：需要要加上98的偏移，单位：厘米】
            LandingProbe = 50,
            --移动探针容差值
            ProbeTolerance = 10,
            --检查待机时间
            CheckIdleTime = 1
        },
        --身体部位设置【可考虑独立出来】
        BodySetting = {
            --探針骨骼
            ProbeBone = Character.SOCKET_NAME.Root,
            --胶囊偏移
            OffsetBone = Character.SOCKET_NAME.Pelvis,
            --面相朝向
            FaceBone = Character.SOCKET_NAME.Head,
            --胸部骨骼
            ChestBone = Character.SOCKET_NAME.Spine1,
            --武器左持
            WeaponLeftHand = Character.SOCKET_NAME.Prop_L,
            --武器右持
            WeaponRightHand = Character.SOCKET_NAME.Prop_R
        },
        --瞄准设置
        AimSetting = {
            --人物的高度【单位：米】
            CharacterHeight = 1.92,
            --角度下限（打脚）【单位：角度】
            LowerDegree = 14,
            --角度上限（打头）【单位：角度】
            UpperDegree = 19,
            --AI命中区间【单位：角度】
            AIAimSpread = 5,
            --标准间距【单位：米】
            StandardDistance = 50,
            --瞄准系数
            Coefficient = {
                --纵向偏移系数
                K1 = 1,
                --横向偏移系数
                K2 = 1,
                --横向缩放系数
                S = 0.01,
            },
            --瞄准冷却时间【单位：秒】
            CoolDownTime = 0.8,
            --样条采样方案
            SampleSpline = true,
            --命中样条【贝塞尔曲线】限定参数
            HitSpline = {
                --样条分段量【数值越小越平滑，性能越差，反之亦然】
                Segment = 100,
                --瞄准线分段量【数值越小越平滑，性能越差，反之亦然】
                AimTrackSegment = 50,
            },
            --瞄准优化【非样条曲线方案才生效】
            Optimization = true,
            --单元像素角度【像素到角度的换算系数，这个数值决定操作灵敏度】
            AnglePrePixel = 0.2,
            --單元角度Z轴偏移量【像素到世界偏移的换算系数，手感优化】
            OffsetZPrePixel = 0.1,
            --最小俯仰角【单位：角度】
            MinPitchDegree = -80,
            --最大俯仰角【单位：角度】
            MaxPitchDegree = 80,
            --显示轨迹长度【水平方向距离，单位：米】
            ShowTrackLength = 4,
            --显示轨迹时间步伐【单位：秒】
            ShowTrackTimeStep = 0.1,
            --当前轨迹颜色
            CurrentTrackColor = "#00E3FF",
            --历史轨迹颜色
            HistoryTrackColor = "#C1C1C1FF",
            --起始透明度
            StartAlpha = 0.8,
            --结束透明度
            EndAlpha = 0.1,
            --Y轴上的摆浮【策划需求，单位：米】
            Swing = 0.2,
        },
        --伤害倍率
        DamageRateList = {
            --伤害倍率表
            --头部
            [Character.SOCKET_NAME.Head] = 2,
            --胸部
            [Character.SOCKET_NAME.Spine1] = 1,
            --臀部
            [Character.SOCKET_NAME.Pelvis] = 1,
            --左大腿
            [Character.SOCKET_NAME.ThighL] = 1,
            --右大腿
            [Character.SOCKET_NAME.ThighR] = 1
        },
        --角色属性参数
        Attributes = {
            --健康值
            Health = 10,
        },
    }
}

return CharacterConfig