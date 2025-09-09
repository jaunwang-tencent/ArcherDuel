--游戏整体配置【包括信号、UI、特效、音效】
local GameConfig = {
    --音效设置
    SoundSetting = {
        --游戏开始【吹哨子】
        GameStart = 700356,
        --游戏匹配【齿轮转动】
        GameMatch = 700373
    },
    --物理
    Physics = {
        --重力加速度【单位：米每平方秒】
        Gravity = 10,
        --地面摩擦系数【单位：1】
        FrictionFactor = 0.2,
    },
    --各个部位质量分布
    MassDistribution = {
        --标准体形【总质量：395KG】
        [1] = {
            --臀部
            [Character.SOCKET_NAME.Pelvis] = 60,
            --左大腿
            [Character.SOCKET_NAME.ThighL] = 20,
            --右大腿
            [Character.SOCKET_NAME.ThighR] = 20,
            --脊柱
            [Character.SOCKET_NAME.Spine] = 80,
            --胸部
            [Character.SOCKET_NAME.Spine1] = 50,
            --脖子
            [Character.SOCKET_NAME.Neck] = 15,
            --头
            [Character.SOCKET_NAME.Head] = 30,
            --左上臂
            [Character.SOCKET_NAME.UpperArm_L] = 30,
            --右上臂
            [Character.SOCKET_NAME.UpperArm_R] = 30,
            --左前臂
            [Character.SOCKET_NAME.Forearm_L] = 30,
            --右前臂
            [Character.SOCKET_NAME.Forearm_R] = 30,
        },
        --3&3.5头身【总质量：415KG】
        [2] = {
            --臀部
            [Character.SOCKET_NAME.Pelvis] = 60,
            --左大腿
            [Character.SOCKET_NAME.ThighL] = 20,
            --右大腿
            [Character.SOCKET_NAME.ThighR] = 20,
            --左小腿
            [Character.SOCKET_NAME.Calf_L] = 10,
            --右小腿
            [Character.SOCKET_NAME.Calf_R] = 10,
            --脊柱
            [Character.SOCKET_NAME.Spine] = 80,
            --胸部
            [Character.SOCKET_NAME.Spine1] = 50,
            --脖子
            [Character.SOCKET_NAME.Neck] = 15,
            --头
            [Character.SOCKET_NAME.Head] = 30,
            --左上臂
            [Character.SOCKET_NAME.UpperArm_L] = 30,
            --右上臂
            [Character.SOCKET_NAME.UpperArm_R] = 30,
            --左前臂
            [Character.SOCKET_NAME.Forearm_L] = 30,
            --右前臂
            [Character.SOCKET_NAME.Forearm_R] = 30,
        },
        --Chiilkawa【总质量：280KG】
        [3] = {
            --臀部
            [Character.SOCKET_NAME.Pelvis] = 60,
            --左大腿
            [Character.SOCKET_NAME.ThighL] = 20,
            --右大腿
            [Character.SOCKET_NAME.ThighR] = 20,
            --脊柱
            [Character.SOCKET_NAME.Spine] = 80,
            --头
            [Character.SOCKET_NAME.Head] = 40,
            --左上臂
            [Character.SOCKET_NAME.UpperArm_L] = 30,
            --右上臂
            [Character.SOCKET_NAME.UpperArm_R] = 30,
        }
    },
    --普通场胜利累加积分
    VictoryAddScore = 50,
    --普通场失败累加积分
    FailAddScore = -20,
}

return GameConfig