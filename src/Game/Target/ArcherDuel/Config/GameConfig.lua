--游戏整体配置【包括信号、UI、特效、音效】
local GameConfig = {
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
                Ruler = 109693,
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
        --游戏开始【吹哨子】
        GameStart = 700356,
        --游戏匹配【齿轮转动】
        GameMatch = 700373
    },
    --物理
    Physics = {
        --重力加速度【单位：米每平方秒】
        Gravity = 20,
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
    --冲量设置
    --[-[
    ImpulseSetting = {
        --命中部位
        -- 爆头方案（包含Head）
        [Character.SOCKET_NAME.Head] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 10
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 126000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 49200,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 270000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 20
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighR,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 270000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Pelvis,
                    --冲量大小
                    ImpulseValue = 100000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 10
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 110
                }
            },
            [4] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 270000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                }
            }
        },
        -- 躯干部分（包含Neck、Spine、Spine1）
        [Character.SOCKET_NAME.Neck] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 60
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 200000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_L,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -15
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 210000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 30000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 270000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 10
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighR,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 160
                }
            }
        },
        [Character.SOCKET_NAME.Spine] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 60
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 200000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_L,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -15
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 210000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 30000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 270000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 10
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighR,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 160
                }
            }
        },
        [Character.SOCKET_NAME.Spine1] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 60
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 200000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_L,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -15
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 210000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 30000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 270000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 10
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighR,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 160
                }
            }
        },
        -- 打脚方案（包含Pelvis、ThighL、ThighR）
        [Character.SOCKET_NAME.Pelvis] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 250000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -135
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 120000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -150
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 160000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 30
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 60
                }
            },
            [4] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 60000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 40
                }
            }
        },
        [Character.SOCKET_NAME.ThighL] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 250000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -135
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 120000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -150
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 160000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 30
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 60
                }
            },
            [4] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 60000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 40
                }
            }
        },
        [Character.SOCKET_NAME.ThighR] = {
            --方案1【随机方案】
            [1] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Neck,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Calf_L,
                    --冲量大小
                    ImpulseValue = 250000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 0
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.UpperArm_R,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                }
            },
            --方案2
            [2] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 80000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -135
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 70
                }
            },
            [3] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 120000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = -150
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 160000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 30
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 180000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 60
                }
            },
            [4] = {
                --实际物理作用，可能有多个，游戏师自定义
                [1] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Head,
                    --冲量大小
                    ImpulseValue = 40000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 90
                },
                [2] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.Spine,
                    --冲量大小
                    ImpulseValue = 240000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 50
                },
                [3] = {
                    --冲量作用部位
                    BodyType = Character.SOCKET_NAME.ThighL,
                    --冲量大小
                    ImpulseValue = 60000,
                    --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                    ForwardDegree = 40
                }
            }
        },
    }
}

return GameConfig