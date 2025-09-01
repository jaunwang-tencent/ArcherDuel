--场景配置
local SceneConfig = {
    [1] = {
        --场景所需资源
        Resource = {
            --海岛
            [1] = {

            },
            --雪地
            [2] = {

            },
            --城市
            [3] = {

            },
            --天空遗迹
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1526,
                    Enemy = 1525
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1527,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2085,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1000, 125, 250),
                },
            },
            --沙漠
            [5] = {

            },
            --太空
            [6] = {

            },
            --室外
            [7] = {

            },
            --室内
            [8] = {

            },
        },
        --物理
        Physics = {
            --重力加速度【单位：米每平方秒】
            Gravity = 20,
            --地面摩擦系数【单位：1】
            FrictionFactor = 0.1,
        },
        --界面
        UISetting = {
            --加载页面
            LoadingView = {
                --根节点页面ID
                ID = 106412,
                --加载进度条
                LoadProcess = 106413
            },
            --战斗页面
            BattleView = {
                --暴击奖励
                CriticalHitReward = {
                    --根节点页面ID
                    ID = 105662,
                    --奖励宝箱【常驻】
                    RewardBox= 105661,
                    --爆头提示【动效播放】
                    HeadShotUI = 105660,
                },
                --本地玩家
                LocalPlayer = {
                    --根节点页面ID
                    ID = 105654,
                    NickName = 105652,
                    HPValue = 105650,
                },
                --敌方玩家
                EnemyPlayer = {
                    --根节点页面ID
                    ID = 105659,
                    NickName = 105653,
                    HPValue = 105649,
                },
                --瞄准角度
                AimPitch = {
                    --根节点页面ID
                    ID = 105656,
                    --俯仰角刻度尺
                    Ruler = 105655,
                    --俯仰角刻度游标
                    Cursor = 106037,
                    --俯仰角刻度游标文本
                    Text = 105658,
                }
            },
            --结算页面
            ResultView = {
                ID = 106509
            }
        },
        --音效设置
        SoundSetting = {

        },
        --特效设置
        EffectSetting = {
            --命中角色
            HitCharacter = 1,
            --命中其它
            HitOther = 2,
        },
    }
}

return SceneConfig