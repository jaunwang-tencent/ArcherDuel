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
                    Offset = Engine.Vector(-1000, 125, 250),
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
                    Offset = Engine.Vector(-1000, 125, 250),
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
                    Offset = Engine.Vector(-1000, 125, 250),
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
                    Offset = Engine.Vector(-1000, 125, 250),
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
                    Offset = Engine.Vector(-1000, 125, 250),
                }
            }
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
                    Offset = Engine.Vector(-1000, 125, 250),
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
                    Offset = Engine.Vector(-1000, 125, 250),
                }
            }
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
                    Offset = Engine.Vector(-1000, 125, 250),
                },
            }
        },
        --样条设置
        SplineSetting = {
            --样条曲率【单位：1】
            Curvature = 0.4,
            --中点振幅【单位：米】
            Amplitude = 5,
        }
    },
    --沙漠
    [5] = {
        --战斗场景资源
        Resource = {
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