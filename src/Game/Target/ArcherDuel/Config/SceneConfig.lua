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
            [6] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1399,
                    Enemy = 1340
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
            [7] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1566,
                    Enemy = 1576
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
            [8] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1683,
                    Enemy = 1699
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
            [9] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1776,
                    Enemy = 1779
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
            [10] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1829,
                    Enemy = 1864
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
            Curvature = 0.35,
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
                },
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
            [3] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 926,
                    Enemy = 883
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
            [4] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1897,
                    Enemy = 1865
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
            [5] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1789,
                    Enemy = 1760
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
            [6] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1426,
                    Enemy = 1468
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
            [7] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 2526,
                    Enemy = 2482
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
            [8] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1146,
                    Enemy = 1367
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
            [9] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 2562,
                    Enemy = 2604
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
            [10] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 1654,
                    Enemy = 1669
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
            Curvature = 0.35,
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
                    Local = 10658,
                    Enemy = 14334
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
                    Local = 12594,
                    Enemy = 12537
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
                    Local = 9909,
                    Enemy = 9908
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
            [4] = {
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
            [5] = {
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
            [6] = {
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
            [7] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 4403,
                    Enemy = 4352
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
            [8] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 11508,
                    Enemy = 11507
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
            [9] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 4921,
                    Enemy = 4928
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
            [10] = {
                --阵营出生点立方体实例id
                BirthPoint = {
                    Local = 6032,
                    Enemy = 6034
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
            Curvature = 0.35,
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
                    Local = 5352,
                    Enemy = 5387
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
                    Local = 5647,
                    Enemy = 5649
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
                    Local = 5026,
                    Enemy = 5030
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
                    Local = 7292,
                    Enemy = 6062
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
            [6] = {
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
            [7] = {
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
            [8] = {
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
            [9] = {
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
            [10] = {
                --阵营出生点
                BirthPoint = {
                    Local = 7525,
                    Enemy = 7348
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
            Curvature = 0.35,
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
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [2] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3486,
                    Enemy = 3554
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [3] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2956,
                    Enemy = 2966
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2847,
                    Enemy = 2868
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [5] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3994,
                    Enemy = 4004
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [6] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2511,
                    Enemy = 2532
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [7] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2412,
                    Enemy = 2414
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [8] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2242,
                    Enemy = 2268
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [9] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2185,
                    Enemy = 2178
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
                    --相机偏移【与观察目标之间的偏移，比如人、投掷物】
                    Offset = Engine.Vector(-1200, 150, 250),
                },
            },
            [10] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2119,
                    Enemy = 2120
                },
                --相机
                Camera = {
                    --角色观察相机元件标识【用于观察玩家角色使用】
                    CharacterCameraSceneId = 3302,
                    --投掷物追踪相机元件标识【用于观察投掷物使用】
                    ProjectileCameraSceneId = 3303,
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
            Curvature = 0.35,
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
                    Local = 323,
                    Enemy = 265
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
                    Local = 1394,
                    Enemy = 1370
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
                    Local = 1444,
                    Enemy = 1446
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
                    Local = 1591,
                    Enemy = 1592
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
                    Local = 1618,
                    Enemy = 1613
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
            [6] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1768,
                    Enemy = 1739
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
            [7] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1071,
                    Enemy = 1058
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
            [8] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1221,
                    Enemy = 1219
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
            [9] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1886,
                    Enemy = 1887
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
            [10] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1812,
                    Enemy = 1813
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
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.35,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --室外
    [7] = {
        -- 是否为黄金赛场景
        IsGold = true,
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
                        [6008] = true,
                        [6007] = true,
                        [1712] = true,
                    },
                    --掉落速度【单位：米每秒】
                    DropOffset = Engine.Vector(0, 0, -10000),
                    --命中后爆炸特效资源标识【梦幻爆炸】
                    ExplosionEffect = 8,
                    --活体列表【命中后直接瞬移，播放爆炸效果】
                    BodyList = {
                        [661] = true,
                    }
                },
            },
            [2] = {
                --阵营出生点
                BirthPoint = {
                    Local = 972,
                    Enemy = 973
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
                        [618] = true,
                        [621] = true,
                    },
                    --掉落速度【单位：米每秒】
                    DropOffset = Engine.Vector(0, 0, -10000),
                    --命中后爆炸特效资源标识【梦幻爆炸】
                    ExplosionEffect = 8,
                    --活体列表【命中后直接瞬移，播放爆炸效果】
                    BodyList = {
                        [661] = true,
                    }
                },
            },
            [3] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1313,
                    Enemy = 1314
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
                        [618] = true,
                        [621] = true,
                    },
                    --掉落速度【单位：米每秒】
                    DropOffset = Engine.Vector(0, 0, -10000),
                    --命中后爆炸特效资源标识【梦幻爆炸】
                    ExplosionEffect = 8,
                    --活体列表【命中后直接瞬移，播放爆炸效果】
                    BodyList = {
                        [661] = true,
                    }
                },
            },
            [4] = {
                --阵营出生点
                BirthPoint = {
                    Local = 1455,
                    Enemy = 1456
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
                        [618] = true,
                        [621] = true,
                    },
                    --掉落速度【单位：米每秒】
                    DropOffset = Engine.Vector(0, 0, -10000),
                    --命中后爆炸特效资源标识【梦幻爆炸】
                    ExplosionEffect = 8,
                    --活体列表【命中后直接瞬移，播放爆炸效果】
                    BodyList = {
                        [661] = true,
                    }
                },
            },
            --死亡底板场景
            DeadLine = 670
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.35,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --室内
    [8] = {
        -- 是否为钻石赛场景
        IsDiamond = true,
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
                    Local = 1047,
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
            [6] = {
                --阵营出生点
                BirthPoint = {
                    Local = 2740,
                    Enemy = 2738
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
            [7] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3287,
                    Enemy = 3286
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
            [8] = {
                --阵营出生点
                BirthPoint = {
                    Local = 3552,
                    Enemy = 3551
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
            [9] = {
                --阵营出生点
                BirthPoint = {
                    Local = 5073,
                    Enemy = 5051
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
            [10] = {
                --阵营出生点
                BirthPoint = {
                    Local = 4455,
                    Enemy = 4457
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
            }
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.35,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
}

return SceneConfig