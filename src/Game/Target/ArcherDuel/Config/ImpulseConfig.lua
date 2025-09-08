--冲量配置
local Thigh_L = "Thigh_L"
local Thigh_R = "Thigh_R"

local ImpulseConfig = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_R,
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_R,
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
                BodyType = Thigh_R,
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
                BodyType = Thigh_R,
                --冲量大小
                ImpulseValue = 40000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 160
            }
        }
    },
    [Character.SOCKET_NAME.Clavicle_L] = {
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
                BodyType = Thigh_R,
                --冲量大小
                ImpulseValue = 40000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 160
            }
        }
    },
    [Character.SOCKET_NAME.Clavicle_R] = {
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
                BodyType = Thigh_R,
                --冲量大小
                ImpulseValue = 40000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 160
            }
        }
    },
    -- 打脚方案（包含Pelvis、ThighL、ThighR、Calf_L、Calf_R、Foot_L、Foot_R）
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Thigh_L] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Thigh_R] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Character.SOCKET_NAME.Calf_L] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Character.SOCKET_NAME.Calf_R] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Character.SOCKET_NAME.Root] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Character.SOCKET_NAME.Foot_L] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
    [Character.SOCKET_NAME.Foot_R] = {
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
                BodyType = Thigh_L,
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
                BodyType = Thigh_L,
                --冲量大小
                ImpulseValue = 60000,
                --与逆向前向夹角【单位：角度，约定：向上为正，向下为负】
                ForwardDegree = 40
            }
        }
    },
}

return ImpulseConfig