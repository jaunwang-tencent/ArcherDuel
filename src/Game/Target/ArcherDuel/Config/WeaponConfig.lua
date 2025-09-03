local Prop_L = "Prop_L"
local Prop_R = "Prop_R"
--武器配置
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
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 918,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 609,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 610,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 549,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 611,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root =1899,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 1900,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 1839,
                    --弓弦【默认：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 1901,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
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
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 1480,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 2019,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 2020,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 1959,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 2021,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 874,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 875,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 814,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 876,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
            },
            --室外
            [7] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 586,
                    -- 弓上方弓弦连接点立方体实例id
                    Up = 587,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 526,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 588,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
            },
            --室内
            [8] = {
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 1931,
                    -- 弓上方弓弦连接点立方体实例id
                    Up =1932,
                    -- 弓下方弓弦连接点立方体实例id
                    Down = 1871,
                    --弓弦【链式特效类型（火焰链）225】【专用：272】
                    Spring = 272,
                    --左手拿弓
                    BindBone = Prop_L,
                    --特效标识
                    Particle = 333,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 1933,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --特效偏移
                    Particle = 269,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-500, 0, 0),
                }
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
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
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
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 1035,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                },
            },
            --雪地
            [2] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 516,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 532,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 1806,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 斧刃立方体实例id
                    Root = 1822,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 2095,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 2096,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 1926,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 1942,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 781,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 797,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 493,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 509,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 1838,
                    --右手持斧
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 335,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 1854,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                    --旋转速度
                    RotationalSpeed = -8,
                    --特效偏移
                    Particle = 271,
                    --特效偏移
                    ParticleOffset = Engine.Vector(500, 0, 300),
                }
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
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
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
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
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
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 517,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 531,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --城市
            [3] = {
                --手持物
                HeldItem = {
                    -- 手持点立方体实例id
                    Root = 1932,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    -- 投射物尖端立方体实例id
                    Root = 1931,
                    --偏移量
                    Offset = Engine.Vector(0, 50, 80),
                },
            },
            --天空遗迹
            [4] = {
                --手持物
                HeldItem = {
                    Root = 2094,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 2093,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                    --特效标识
                    Particle = 270,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-1500,0,0),
                }
            },
            --沙漠
            [5] = {
                --手持物
                HeldItem = {
                    Root = 1927,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 1941,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                    --特效标识
                    Particle = 270,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-1500,0,0),
                }
            },
            --太空
            [6] = {
                --手持物
                HeldItem = {
                    Root = 782,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 796,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                    --特效标识
                    Particle = 270,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-1500,0,0),
                }
            },
            --室外
            [7] = {
                --手持物
                HeldItem = {
                    Root = 494,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 508,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                    --特效标识
                    Particle = 270,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-1500,0,0),
                }
            },
            --室内
            [8] = {
                --手持物
                HeldItem = {
                    Root = 1839,
                    --右手持矛
                    BindBone = Prop_R,
                    --特效标识
                    Particle = 334,
                    --特效偏移
                    ParticleOffset = Engine.Vector(50, 0, 0),
                },
                --投射物
                Projectile = {
                    Root = 1853,
                    --偏移量【与人之间的偏移，枪口】
                    Offset = Engine.Vector(0, 50, 80),
                    --特效标识
                    Particle = 270,
                    --特效偏移
                    ParticleOffset = Engine.Vector(-1500,0,0),
                }
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
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
        },
    },
}

return WeaponConfig