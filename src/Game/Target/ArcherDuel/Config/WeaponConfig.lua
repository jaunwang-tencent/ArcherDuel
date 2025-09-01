--武器配置
local WeaponLeftHand = "Prop_L"
local WeaponRightHand = "Prop_R"
local WeaponConfig = {
    [1] = {
        --箭
        TypeName = "Bow",
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --海岛
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 916,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 917,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 856,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = WeaponLeftHand,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 918,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                }
            },
            --雪地
            [2] = {

            },
            --城市
            [3] = {

            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 1478,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 1479,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 1418,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = WeaponLeftHand,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 1480,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    Particle = 269,
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
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
        --所持武器对应的动作
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
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 30,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            --伤害值
            Damage = 100
        },
    },
    [2] = {
        --斧
        TypeName = "Axe",
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 1034,
                    --右手持斧
                    BindBone = WeaponRightHand,
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 1035,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {

            },
            --城市
            [3] = {

            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 2095,
                    --右手持斧
                    BindBone = WeaponRightHand,
                },
                --投射物
                Projectile = {
                    Root = 2096,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度，只有斧子才有
                    RotationalSpeed = -8,
                    Particle = 271,
                    ParticleOffset = Engine.Vector(500, 0, 300),
                }
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
        --所持武器对应的动作
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
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 30,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            --伤害值
            Damage = 100
        },
    },
    [3] = {
        --矛
        TypeName = "Spear",
        --武器所需资源
        Resource = {
            --海岛
            [1] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 892,
                    --右手持矛
                    BindBone = WeaponRightHand,
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 891,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --雪地
            [2] = {

            },
            --城市
            [3] = {

            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 2094,
                    --右手持矛
                    BindBone = WeaponRightHand,
                },
                --投射物
                Projectile = {
                    Root = 2093,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                    Particle = 270,
                    ParticleOffset = Engine.Vector(-1500,0,0),
                }
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
        --所持武器对应的动作
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
        --属性参数
        Attributes = {
            --线速率【单位：米每秒】
            Velocity = 30,
            --武器质量【单位：千克】（反推，非真实）
            Mass = 15000,
            --伤害值
            Damage = 100
        },
    },
}

return WeaponConfig