--UI配置，将各个业务模块的UI页面ID按照如下格式配置，并提供好注释
local UIConfig = {
    --装备视图
    EquipmentView = {
        --左视图
        LeftView = {
            ID = 104495,
            --眼镜
            Glasses = {
                Label = 104156,
                Image = 100534,
                Progress = 101868
            },
            --上衣
            Coat = {
                Label = 104157,
                Image = 100535,
                Progress = 104028
            },
            --发型
            Hair = {
                Lable = 104158,
                Image = 100536,
                Progress = 104029
            }
        },
        --右视图
        RightView = {
            ID = 104496,
            -- 弓箭 
            Bow = {
                Label = 104159,
                Image = 100539,
                Progress = 104030
            },
            -- 手斧
            Axe = {
                Label = 104679,
                Image = 100538,
                Progress = 104031
            },
            -- 长矛
            Spear = {
                Lable = 104680,
                Image = 100537,
                Progress = 104542
            }
        },
        --列表视图
        ListView = {
            ID = 100571,
            --装备过滤栏
            TableBar = {
                --全部
                All = {
                    --命中
                    Selected = 104035,
                    --未命中
                    Unselected = 100548
                },
                --眼镜
                Glasses = {
                    --命中
                    Selected = 104036,
                    --未命中
                    Unselected = 100541
                },
                --上衣
                Coat = {
                    --命中
                    Selected = 104037,
                    --未命中
                    Unselected = 100549
                },
                --发型
                Hair = {
                    --命中
                    Selected = 104038,
                    --未命中
                    Unselected = 100550
                },
                --弓箭
                Bow = {
                    --命中
                    Selected = 104039,
                    --未命中
                    Unselected = 100551
                },
                --手斧
                Axe = {
                    --命中
                    Selected = 104040,
                    --未命中
                    Unselected = 100553
                },
                --长矛
                Spear = {
                    --命中
                    Selected = 104041,
                    --未命中
                    Unselected = 100552
                },
            },
            TileView = {
                --视图
                ID = 109447,
                --项
                Item = 109449
            }
        }
    },
    --对决视图
    DuelView = {

    },
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
            --昵称
            NickName = 105652,
            --血条
            HPValue = 105650,
        },
        --敌方玩家
        EnemyPlayer = {
            --根节点页面ID
            ID = 105659,
            --昵称
            NickName = 105653,
            --血条
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
}

return UIConfig