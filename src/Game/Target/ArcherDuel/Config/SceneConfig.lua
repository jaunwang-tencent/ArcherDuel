--场景配置
local SceneConfig = {
     --海岛
     [1] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 410,
                    Enemy = 387
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 409,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 847,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [2] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 502,
                    Enemy = 467
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 409,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 847,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [3] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 642,
                    Enemy = 607
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 409,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 847,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [4] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 674,
                    Enemy = 718
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 409,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 847,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [5] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 730,
                    Enemy = 738
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 409,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 847,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            --死亡底板场景
            --DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --雪地
    [2] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 455,
                    Enemy = 339
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 496,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 495,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [2] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 254,
                    Enemy = 304
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 496,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 495,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            --死亡底板场景
            --DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --城市
    [3] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 512,
                    Enemy = 389
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1785,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1786,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [2] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1201,
                    Enemy = 1198
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1785,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1786,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            [3] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1474,
                    Enemy = 1473
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1785,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1786,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                }
            },
            --死亡底板场景
            --DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --天空遗迹
    [4] = {
        --战斗场景资源
        Resource = {
            [1] = {
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
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [2] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3199,
                    Enemy = 3200
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1527,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2085,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [3] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3318,
                    Enemy = 3319
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1527,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2085,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3760,
                    Enemy = 3681
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1527,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2085,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [5] = {
                --阵营出生点
                BirthPoint = {
                    Local = 4061,
                    Enemy = 3892
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1527,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2085,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            --死亡底板场景
            --DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.5,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --沙漠
    [5] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点
                BirthPoint = {
                    Local = 930,
                    Enemy = 946
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 2049,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2051,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [2] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1443,
                    Enemy = 1462
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 2049,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2051,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [3] = {
                --阵营出生点
                BirthPoint = {
                    Local =1540 ,
                    Enemy =1550
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 2049,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2051,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1769,
                    Enemy = 1791
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 2049,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 2051,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            --死亡底板场景
            --DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --太空
    [6] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点
                BirthPoint = {
                    Local = 265,
                    Enemy = 323
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 904,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 906,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [2] = {
                --阵营出生点
                BirthPoint = {
                    Local = 426,
                    Enemy = 412
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 904,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 906,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [3] = {
                --阵营出生点
                BirthPoint = {
                    Local = 492,
                    Enemy = 494
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 904,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 906,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 634,
                    Enemy = 639
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 904,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 906,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [5] = {
                --阵营出生点
                BirthPoint = {
                    Local = 724,
                    Enemy = 719
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 904,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 906,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            --死亡底板场景
            --DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --室外
    [7] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点
                BirthPoint = {
                    Local = 290,
                    Enemy = 324
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 474,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 475,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
                --障碍物场景标识【可以被标识】
                Obstacle = {
                    --命中可移动物体的力大小【单位：牛】
                    ForceSize = 1000,
                    --可移动物体摩擦系数
                    Friction = 0.2,
                    --密度，元件单位缩放情况下的质量
                    Density = 100,
                    --可移动物体列表
                    MovableList  = {
                        [1851] = true,
                        [1852] = true,
                    },
                    --掉落速度【单位：米每秒】
                    DropOffset = Engine.Vector(0, 0, -10000),
                    --命中后爆炸特效资源标识【梦幻爆炸】
                    ExplosionEffect = 8,
                    --活体列表【命中后直接瞬移，播放爆炸效果】
                    BodyList = {
                        [1870] = true,
                    }
                },
            },
            --死亡底板场景
            DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --室内
    [8] = {
        --战斗场景资源
        Resource = {
            [1] = {
                --阵营出生点
                BirthPoint = {
                    Local = 429,
                    Enemy = 426
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1819,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1820,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [2] = {
                --阵营出生点
                BirthPoint = {
                    Local = 769,
                    Enemy = 767
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1819,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1820,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [3] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1047 ,
                    Enemy = 1046
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1819,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1820,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1539,
                    Enemy = 1538
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1819,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1820,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [5] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1691,
                    Enemy = 1689
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 1819,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 1820,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
}

return SceneConfig