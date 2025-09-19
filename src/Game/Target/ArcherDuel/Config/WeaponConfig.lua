local Prop_L = "Prop_L"
local Prop_R = "Prop_R"
--武器配置
local WeaponConfig = {
    [61] = {
        --箭
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 1,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7631,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 7632,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 7633,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7598,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2794,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2795,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2796,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2761,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =22958,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 22959,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 22960,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 22925,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7925,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 7926,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 7927,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7892,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4536,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4537,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4538,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4503,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 1970,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 1971,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 1972,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2268,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2269,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2270,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2235,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7711,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =7712,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 7713,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7678,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 37,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 7,
        },
    },
    [62] = {
        --箭2
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 2,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3584,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3592,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3593,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3595,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2832,    
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2840,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2841,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2843,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =22996,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23004,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23005,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23007,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7963,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 7971,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 7972,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7974,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4574,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4582,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4583,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4585,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2008,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2016,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2017,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2306,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2314,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2315,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2317,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7749,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =7757,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 7758,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7760,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 42,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 10,
        },
    },
    [63] = {
        --箭3
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 3,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3662,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3663,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3664,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3674,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2980,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2981,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2982,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2992,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23144,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23145,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23146,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23156,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8111,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8112,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8113,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8123,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4722,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4723,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4724,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4734,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2156,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2157,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2158,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2454,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2455,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2456,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2466,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7897,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =7898,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 7899,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7909,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 42,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 10,
        },
    },
    [64] = {
        --箭4
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 4,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3704,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3705,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3706,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3767,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3105,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3106,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3107,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3067,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23269,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23270,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23271,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23231,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8236,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8237,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8238,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8198,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4847,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4848,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4849,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4809,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2281,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2282,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2283,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2579,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2580,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2581,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2541,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8022,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8023,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8024,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7984,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 42,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 1,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 10,
        },
    },
    [65] = {
        --箭5
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 5,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3830,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3831,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3832,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3855,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3164,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3165,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3166,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3143,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23328,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23329,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23330,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23307,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8295,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8296,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8297,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8274,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4906,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4907,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4908,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4885,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2340,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2341,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2342,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2638,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2639,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2640,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2617,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8081,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8082,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8083,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8060,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 46,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 12,
        },
    },
    [66] = {
        --箭6
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 6,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3915,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3903,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3913,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3921,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3233,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3221,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3231,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3239,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23397,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23385,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23395,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23403,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8364,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8352,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8362,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8370,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4975,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4907,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4973,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4981,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2409,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2397,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2407,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2707,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2695,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2705,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2713,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8150,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8138,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8148,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8156,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 49,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 11,
        },
    },
    [67] = {
        --箭7
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 7,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4089,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4089,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4092,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4092,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3360,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3361,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3363,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3286 ,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23524,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23525,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23527,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23450,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8491,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8492,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8494,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8417,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5102,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5103,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5105,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5028,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2536,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2537,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2539,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2834,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2835,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2837,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2760,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8277,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8278,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8280,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8203,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 1,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 8,
        },
    },
    [68] = {
        --箭8
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 8,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4694,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4695,
                    -- 弓下方弓弦连接点立方体实例id
                    Down =4646,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4704,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3632,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3633,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3584,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3642,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23625,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23626,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23577,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23635,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8592,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8593,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8544,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8602,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5203,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5204,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5155,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5213,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2637,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2638,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2589,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2935,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2936,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2887,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2945,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8378,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8379,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8330,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8388,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 52,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth =10,
        },
    },
    [69] = {
        --箭9
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 9,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5286,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5287,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5278,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5383,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3763,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3764,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3755,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3724,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23756,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23757,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23748,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23717,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8723,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8724,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8715,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8684,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5334,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5335,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5326,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5295,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2768,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2769,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2760,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3066,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3067,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3058,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3027,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8509,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8510,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8501,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8470,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 279, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 50,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 13,
        },
    },
    [70] = {
        --箭10
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 10,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5824,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5885,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5889,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root =5878,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3914,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3975,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3881,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3968,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =23907,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 23968,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 23874,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 23961,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8874,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 8935,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8841,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8928,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5485,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5546,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5452,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5539,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2919,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2980,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 2886,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3217,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3278,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3184,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3271,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8660,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8721,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8627,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8714,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 285, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 305, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 50,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 13,
        },
    },
    [71] = {
        --箭11
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 11,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5471,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5472,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5434,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5501,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4054,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4055,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4017,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4084,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =24047,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 24048,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 24010,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 24077,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9014,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 9015,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8977,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9044,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5625,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5626,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5588,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5655,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3059,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3060,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3022,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3357,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3358,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3320,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3387,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 8800,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =8801,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8763,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 8830,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 282, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 46,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 2,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 16,
        },
    },
    [72] = {
        --箭12
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 12,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3966,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3967,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3970,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4039,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4314,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4315,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4226,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4295,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =24307,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 24308,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 24219,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 24288,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9274,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 9275,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 9186,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9255,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5885,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5886,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5797,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5866,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3319,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3320,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3231,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3617,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3618,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3529,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3598,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9060,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =9061,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 8972,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9041,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 303, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 273, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 11,
        },
    },
    [73] = {
        --箭13
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 13,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5932,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5953,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5954,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6032,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4352,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4373,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4374,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4452,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =24345,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 24366,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 24367,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 24445,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9312,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 9333,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 9334,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9412,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5923,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5944,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5945,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6023,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3357,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3378,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3379,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3655,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3676,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3677,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3755,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9098,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =9119,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 9120,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9198,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 311, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 281, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 60,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 10,
        },
    },
    [74] = {
        --箭14
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 14,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5748,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 5749,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 5756,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5752,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4612,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4613,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4620,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4616,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =24605,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 24606,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 24613,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 24609,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 10382,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 10383,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 10390,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 10386,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6183,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 6184,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 6191,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6187,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3617,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3618,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3625,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3915,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3916,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3923,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3919,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9358,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =9359,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 9366,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9362,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 333, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 281, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 49,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 2,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 13,
        },
    },
    [75] = {
        --箭15
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 15,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4187,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4218,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4182,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4230,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4701,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4732,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4696,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4657,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =24694,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 24725,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 24689,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 24650,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 10471,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 10502,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 10466,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 10427,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6272,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 6303,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 6267,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6228,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3706,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3737,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3701,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4004,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4035,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3999,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 3960,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9447,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =9478,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 9442,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9403,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 307, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 277, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 55,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 10,
        },
    },
    [76] = {
        --箭16
        TypeName = "Bow",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 16,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4305,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4299,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4344,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效数据
                    Effect = { ID = 333, Offset = Engine.Vector(50, 0, 0), Size = 5 }
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4520,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效数据
                    Effect = { ID = 269, Offset = Engine.Vector(-500, 0, 0), Size = 5 }
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4791,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4785,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4830,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5006,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =24784,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 24778,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 24823,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 24999,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 10561,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 10555,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 10600,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 10776,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6362,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 6356,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 6401,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6577,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 3796,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 3790,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 3835,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 4094,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 4088,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 4133,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 4309,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 9537,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =9531,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 9576,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 9752,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "BowStartAttack",
            --攻击动作
            Fire = "BowAttack",
            --待机动作
            Idle = "BowIdle",
        },
        --音效设置
        Audios = {
            --拉弓
            PullString = 700359,
            --投掷
            Fire = 700360,
            --飞行
            Fly = 700361,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 312, Offset = Engine.Vector(0, 0, 0), Size = 8 },
            --投掷物特效
            Projectile = { ID = 274, Offset = Engine.Vector(-500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 63,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 8,
        },
    },
    [77] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 33,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7533,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 7532,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5063,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5062,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25056,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25055,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 12984,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 12983,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6634,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6633,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4068,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4067,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4366,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4365,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9809,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9808,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 42,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 10,
        },
    },
    [78] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 34,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6093,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6082,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5082,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5071,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25075,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25064,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13003,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 12992,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6653,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6642,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4087,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4076,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4385,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4374,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9828,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9817,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 47,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 12,
        },
    },
    [79] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 35,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6105,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6104,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5102,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5101,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25095,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25094,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13023,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13022,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6673,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6672,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4107,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4106,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4405,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4404,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9848,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9847,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 47,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 12,
        },
    },
    [80] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 36,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6124,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6125,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5118,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5119,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25111,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25112,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13039,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13040,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6689,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6690,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4123,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4124,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4421,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4422,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9864,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9865,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 47,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 1,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 12,
        },
    },
    [81] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 37,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6250,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root =6245,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5153,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5148,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25146,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25141,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13074,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13069,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6724,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6719,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4158,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4153,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4456,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4451,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9899,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9894,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 13,
        },
    },
    [82] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 38,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6217,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6207,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5187,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5215,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25180,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25208,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13108,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13136,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6758,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6786,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4192,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4220,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4539,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4567,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9933,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9961,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 49,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 14,
        },
    },
    [83] = {
        --斧
        TypeName = "Axe",   
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 39,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6348,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6349,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5286,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5287,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25230,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25231,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13158,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13159,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6808,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6809,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4242,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4243,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4589,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4590,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 9983,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 9984,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 53,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 1,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 12,
        },
    },
    [84] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 40,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6161,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6160,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5309,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5308,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25253,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25252,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13181,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13180,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6831,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6830,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4265,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4264,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4647,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4646,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10006,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10005,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 13,
        },
    },
    [85] = {
        --斧
        TypeName = "Axe", 
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 41,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6326,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6325,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5344,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5343,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25288,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25287,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13216,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13215,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6866,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6865,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4300,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4299,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4682,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4681,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10041,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10040,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 331, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 301, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 55,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [86] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 42,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6396,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6395,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5394,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5393,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25338,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25337,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13266,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13265,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6916,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6915,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4350,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4349,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4732,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4731,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10091,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10090,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 325, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 295, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 57,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 14,
        },
    },
    [87] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 43,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6429,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6430,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5430,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5431,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25374,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25375,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13302,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13303,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6952,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6953,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4386,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4387,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4768,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4769,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10127,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10128,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 326, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 296, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 53,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 2,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 16,
        },
    },
    [88] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 44,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6462,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6457,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5458,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5453,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25402,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25397,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 14393,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 14388,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 6980,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 6975,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4414,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4409,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4796,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4791,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10155,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10150,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 323, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 293, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 54,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [89] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 45,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6572,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6573,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5479,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5480,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25423,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25424,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13321,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13322,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7001,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7002,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4435,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4436,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4817,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4818,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10176,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10177,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 327, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 297, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 70,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,
        },
    },
    [90] = {
        --斧
        TypeName = "Axe",   
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 46,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6292,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6293,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5517,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5518,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26451,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 26452,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13359,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13360,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7039,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7040,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4473,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4474,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4855,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4856,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10214,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10215,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 326, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 294, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 52,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 2,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 16,
        },
    },
    [91] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 47,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6497,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6496,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5582,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5583,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25480,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25481,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13424,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13425,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7104,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7105,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4538,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4539,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4920,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4921,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10279,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10280,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 335, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 271, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 55,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [92] = {
        --斧
        TypeName = "Axe",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 48,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6577,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 6578,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5643,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 5642,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25541,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 25540,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13485,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13484,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7165,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7164,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4664,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4663,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 4981,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4980,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10340,
                    --右手持斧
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10339,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "AxeStartAttack",
            --攻击动作
            Fire = "AxeAttack",
            --待机动作
            Idle = "AxeIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700358,
            --飞行
            Fly = 700363,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 324, Offset = Engine.Vector(50, 500, -200), Rotation = Engine.Rotator(90, -90, 0), Size = 14 },
            --投掷物特效
            Projectile = { ID = 294, Offset = Engine.Vector(500, 0, 300), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 58,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 13,
        },
    },
    [93] = {
        --矛
        TypeName = "Spear", 
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 17,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7554,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7555,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5684,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5685,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25582,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25583,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13526,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13527,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7206,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7207,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4705,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4706,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5022,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5023,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10381,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10382,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 41,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 8,
        },
    },
    [94] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 18,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6649,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6650,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5716,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5717,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25614,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25615,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13558,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13559,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7238,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7239,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4737,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4738,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5054,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5055,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10413,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10414,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 47,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 12,
        },
    },
    [95] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 19,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6683,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6684,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5744,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5745,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25642,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25643,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13586,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13587,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7266,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7267,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4765,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4766,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5082,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5083,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10441,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10442,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 47,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 12,
        },
    },
    [96] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 20,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6715,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6716,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5780,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5781,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25678,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25679,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13622,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13623,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7302,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7303,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4801,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4802,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5118,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5119,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10477,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10478,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 47,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 1,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 12,
        },
    },
    [97] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 21,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6853,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6831,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5798,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5821,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25696,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25719,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13640,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13663,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7320,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7343,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4819,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4842,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5136,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5159,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10495,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10518,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 13,
        },
    },
    [98] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 22,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6896,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6897,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5887,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5888,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25785,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25786,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13729,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13730,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7409,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7410,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4908,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4909,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5225,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5226,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10584,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10585,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 46,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 16,
        },
    },
    [99] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 23,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6743,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6744,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5918,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5919,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25816,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25817,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13760,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13761,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7440,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7441,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 4939,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 4940,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5256,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5257,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10615,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10616,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 1,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 13,
        },
    },
    [100] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 24,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6808,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6809,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 5983,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 5984,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25881,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25882,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13825,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13826,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7505,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7506,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5004,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5005,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5321,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5322,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10680,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10681,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 270, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 51,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 13,
        },
    },
    [101] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 25,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7376,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7377,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6041,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6042,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 25939,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 25940,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13883,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13884,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7563,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7564,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5062,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5063,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5379,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5380,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10738,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10739,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID =319, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 289 , Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 55,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [102] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 26,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7062,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7063,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6108,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6109,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26006,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26007,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13950,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13951,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7630,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7631,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5129,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5130,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5446,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5447,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10805,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10806,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 315, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 285, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 55,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [103] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 27,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7178,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7181,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6154,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6157,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26052,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26055,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 13996,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 13999,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7676,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7679,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5175,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5178,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5492,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5495,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10851,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10854,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
            -- HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 292, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 55,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 2,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [104] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 28,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7017,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6986,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6244,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6213,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26142,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26111,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 14086,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 14055,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7766,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7735,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5265,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5234,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5582,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5551,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 10941,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 10910,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 320, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 290, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 58,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 14,
        },
    },
    [105] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 29,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7494,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7486,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6343,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6335,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26241,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26233,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 14185,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 14177,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7865,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7857,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5364,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5356,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5681,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5673,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 11040,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 11032,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 321, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 291, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 60,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 10,
        },
    },
    [106] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 30,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6952,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6951,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6389,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6388,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26287,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26286,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 14231,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 14230,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7911,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7910,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5410,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5409,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5727,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5726,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 11086,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 11085,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 334, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 286, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack =55,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 2,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 15,
        },
    },
    [107] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 31,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7281,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7282,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6422,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6423,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26320,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26321,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 14264,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 14265,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 7944,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 7945,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5443,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5444,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5760,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5761,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 11119,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 11120,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 313, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 283, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 58,
            -- 头部额外增伤
            HeadShotIncrease = 5,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 14,
        },
    },
    [108] = {
        --矛
        TypeName = "Spear",
        --资产名称
        AssetName = "weapon_icon",
        --资产序列
        AssetIndex = 32,
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 7111,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 7112,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 6489,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 6490,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 26387,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 26388,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 14331,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 14332,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 8011,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 8012,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 5510,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5511,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 5827,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 5828,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 11186,
                    --右手持矛
                    BindBone = Prop_R,
                },
                --投射物
                Projectile = {
                    Root = 11187,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
        },
        --动作设置
        Animations = {
            --击退后仰动作
            HitBackLoop = "CommonFallBackLoop",
            --击退后仰起身
            HitBackToIdle = "CommonFallBackToIdle",
            --击退前倾动作
            HitFrontLoop = "CommonFallFrontLoop",
            --击退前倾起身
            HitFrontToIdle = "CommonFallFrontToIdle",
            --瞄准动作
            Aim = "SpearStartAttack",
            --攻击动作
            Fire = "SpearAttack",
            --待机动作
            Idle = "SpearIdle",
        },
        --音效设置
        Audios = {
            --投掷
            Fire = 700357,
            --飞行
            Fly = 700362,
            --命中
            Hit = 700374
        },
        --特效设置
        Effects = {
            --手持物特效
             HeldItem = { ID = 314, Offset = Engine.Vector(0, -800, 0), Rotation = Engine.Rotator(-90,0,0),  Size = 8 },
            --投掷物特效
            Projectile = { ID = 284, Offset = Engine.Vector(-1500, 0, 0), Size = 5 },
            --爆炸特效
            Explosion = { ID = 8, Offset = Engine.Vector(0, 0, 0), Size = 1 },
            --命中特效
            Hit = { ID = 201, Offset = Engine.Vector(250,0,0), Size = 8 },
        },
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 25,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 57,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 1,
            --额外增伤
            ShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 14,
        },
    },


}

return WeaponConfig