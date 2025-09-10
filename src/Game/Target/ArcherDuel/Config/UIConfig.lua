--UI配置，将各个业务模块的UI页面ID按照如下格式配置，并提供好注释
local UIConfig = {
    --主视图
    MainView = {
        --主题栏
        TitleBar = {
            ID = 100531,
            --任务
            Task = {
                --命中
                Selected = 103769,
                --未命中
                Unselected = 100523,
                --视图子项
                ViewItems = {
                    100528, 100599
                }
            },
            --装备
            Equipment = {
                --命中
                Selected = 103771,
                --未命中
                Unselected = 100522,
                --视图子项
                ViewItems = {
                    100528, 104495, 104496, 100571
                }
            },
            --对决
            Fight = {
                --命中
                Selected = 103773,
                --未命中
                Unselected = 100526,
                --视图子项
                ViewItems = {
                    100528, 104220, 104219, 101121
                }
            },
            --商店
            Store = {
                --命中
                Selected = 103775,
                --未命中
                Unselected = 100524,
                --视图子项
                ViewItems = {
                    107845,110208
                }
            },
            --锦标赛
            Tournament = {
                --命中
                Selected = 103777,
                --未命中
                Unselected = 100525,
                --视图子项
                ViewItems = {
                    106562, 106605, 106518, 107540
                }
            }
        },
        --通用-资源栏
        GeneralResourceBar = {
            ID = 100528,
            --段位
            Rank = {
                ID = 101854,
                Label = 101853
            },
            --金币
            GoldCoins = {
                ID = 100478,
                Label = 100474
            },
            --砖石
            Diamonds = {
                ID = 103869,
                Label = 103868
            },
            --点券
            Securities = {
                ID = 103873,
                Label = 103872
            }
        },
        --商店-资源栏
        StoreResourceBar = {
            ID = 107845,
            --金宝箱
            GoldBox = {
                ID = 107829,
                Label = 107828
            },
            --银宝箱
            SilverBox = {
                ID = 107833,
                Label = 107832
            },
            --砖石
            Diamonds = {
                ID = 107837,
                Label = 107836
            },
        }
    },
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
                    Unselected = 110756
                },
                --眼镜
                Glasses = {
                    Category = 1,
                    --命中
                    Selected = 104036,
                    --未命中
                    Unselected = 110757
                },
                --上衣
                Coat = {
                    Category = 2,
                    --命中
                    Selected = 104037,
                    --未命中
                    Unselected = 110758
                },
                --发型
                Hair = {
                    Category = 3,
                    --命中
                    Selected = 104038,
                    --未命中
                    Unselected = 110759
                },
                --弓箭
                Bow = {
                    Category = 4,
                    --命中
                    Selected = 104039,
                    --未命中
                    Unselected = 110760
                },
                --手斧
                Axe = {
                    Category = 5,
                    --命中
                    Selected = 104040,
                    --未命中
                    Unselected = 110761
                },
                --长矛
                Spear = {
                    Category = 6,
                    --命中
                    Selected = 104041,
                    --未命中
                    Unselected = 110762
                },
            },
            --列表视图
            TileView = {
                --视图
                ID = 109447,
                --项
                Item = {
                    ID = 109449,
                    --可升级图标
                    Upgradable = 110793,
                    --锁
                    Lock = 109579,
                    --等级
                    Level = 109450,
                    --满级
                    MaxLevel = 109467,
                    --进度条
                    Progress = 109456,
                    --是否已装备
                    Equipped = 109451,
                    --图标
                    Icon = 109448,
                }
            }
        },
        --装备详情视图
        DetailView = {
            --根节点
            ID = 100570,
            --关闭按钮
            Close = 100569,
            --装备名称
            Title = 100558,
            --当前属性值
            CurrentAttribute = 100565,
            --强化属性值
            EnhanceAttribute = 104174,
            --属性图标
            AttributeIcon = {
                ID = 104170,
                --准确率
                Accuracy = 104169,
                --血量
                HealthPoints = 104167,
                --攻击力
                AttackPower = 101877
            },
            --武器图标
            WeaponIcon = {
                ID = 104171,
                --等级
                Level = 100563,
                --图标
                Icon = 100559
            },
            --装备属性信息
            AttributeInfo = {
                ID = 104173,
                --属性描述
                Describe = 100574,
                --属性数值
                Value = 104172
            },
            --可升级提示
            UpgradableTip = {
                ID = 104176,
                --可升级图标
                Icon = 104175,
                --升级进度
                Progress = 100562
            },
            --未有装备
            NotEquipped = {
                ID = 100577,
                --获取跳转按钮
                JumpButton = 100576
            },
            --已装备可升级
            EquippedAndUpgradable = {
                ID = 104194,
                --已装备按钮
                EquippedButton = 104190,
                --升级按钮
                UpgradeButton = 104191,
            },
            --已装备不可升级
            EquippedAndNotUpgradable = {
                ID = 104184,
                --已装备按钮
                EquippedButton = 104182,
                --获取跳转按钮
                JumpButton = 104183,
            },
            --已装备已满级
            EquippedAndMaxLevel = {
                ID = 104204,
                --已装备按钮
                EquippedButton = 104201,
                --已满级按钮
                MaxLevelButton = 104202
            },
            --可装备可升级
            EquipableAndUpgradable = {
                ID = 104187,
                --可装备按钮
                EquipableButton = 104185,
                --升级按钮
                UpgradeButton = 104186,
            },
            --可装备已满级
            EquipableAndMaxLevel = {
                ID = 104198,
                --可装备按钮
                EquipableButton = 104196,
                --已满级按钮
                MaxLevelButton = 104197
            },
            --可装备不可升级
            EquipableAndNotUpgradable = {
                ID = 100573,
                --可装备按钮
                EquipableButton = 100567,
                --获取跳转按钮
                JumpButton = 100568
            },
        }
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
    },
    --任务页面
    TaskView = {
        --根节点页面ID
        ID = 100599,
        --日常任务进度条
        TaskProcesView = {
            --进度条ID
            TaskProces= 104019,
            --当前活跃值文本
            Text = 103892,
            --锁 组 注释：当玩家活跃值未到某一阶段为显示状态（即为默认显示），当玩家活跃值到达状态后，锁则为隐藏状态。
            Lock = {
                [1] = 103890,
                [2] = 103889,
                [3] = 103888,
                [4] = 103887,
                [5] = 103886,
                [6] = 103884,
            },
            --奖励可领取提示光组 注释：当玩家活跃值到某一阶段为显示状态（默认隐藏），当玩家领取后，奖励则为隐藏状态。
            Light = {
                [1] = 103982,
                [2] = 103984,
                [3] = 103985,
                [4] = 103986,
                [5] = 103987,
                [6] = 103988,
            },
            --领取后的X号 ，注释：当玩家领取后，X号则为显示状态。
            Cross = {
                [1] = 103995,
                [2] = 103994,
                [3] = 103993,
                [4] = 103992,
                [5] = 103991,
                [6] = 103990,
            },
            --领取按钮  注释：当玩家未到领取阶段，点击显示活跃值不足，到达则领取，领取后，隐藏领取按钮，隐藏提示光，打开领取后的X号
            Button = {
                [1] = 103878,
                [2] = 103879,
                [3] = 103880,
                [4] = 103881,
                [5] = 103882,
                [6] = 103883,
            }
        }
    },
    --主页页面
    HomeView = {
        --左视图
        LeftView = {
            ID = 104220,
            --角色
            Character = {
                Label = 104839,
                Image = 100506,
            },
            --上衣
            Top = {
                Label = 104838,
                Image = 100507,
            },
            --下装
            Bottoms = {
                Lable = 104837,
                Image = 100508,
            }
        },
        --右视图
        RightView = {
            ID = 104219,
            --弓箭
            Bow = {
                Label = 104843,
                Image = 100509,
            },
            --投斧
            Aex = {
                Label = 104842,
                Image = 100510,
            },
            --投矛
            Spear = {
                Label = 104841,
                Image = 100511,
            },
        },
        --居中视图
        CenterView = {
            ID = 101121,
            --广告按钮 绿色宝箱
            Ad_1 = {
                ID = 100512,
                --看广告获得的数量
                Text = 104209
            },
            --广告按钮 金币
            Ad_2 = {
                ID = 100514,
                --看广告获得的数量
                Text = 104211
            },
            --黄金联赛入口
            Golden = {
                --按钮  可解锁时需要将颜色改为白色
                ID = 100505,
                --锁--如果达到黄金段位，则隐藏锁
                Lock = 104213
            },
            --钻石联赛入口
            Diamond = {
                --按钮  可解锁时需要将颜色改为白色
                ID = 101882,
                --锁--如果达到钻石段位，则隐藏锁
                Lock = 104214
            },
            --七日挑战
            SevenDays = {
                --按钮 
                Button = 100488,
            },
            --寻找对局
            Match = {
                --按钮 
                Button = 100504,
            },
            Rank = {
                --段位图片
                Image =  100492,
                --段位文本
                Text = 100491,
                --段位进度条
                Progress = 100495,
                --奖励按钮
                Button = 100496,
            }
        }
    },
    --商店页面
    StoreView = {
        --根节点页面ID
        ID = 110208,
        --滚动列表
        Scrollable = 110361,
        --分割条
        SplitItem = 110362,
        --商城活动
        Activities = {
            --限定奖池
            [1] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110329,
                --倒计时
                CountDown = 110327,
                --按钮列表
                Buttons = {
                    [1] = {
                        --按钮  注释：判定是否拥有金色箱子，如果有则跳转到开箱页面
                        ID = 110331,
                        --黄金宝箱按钮
                        Type1 = "GoldBox",
                        --替代类型
                        Type2 = "Diamond",
                        Diamond = 600
                    },
                    [2] = {
                        --广告按钮 
                        ID = 110330,
                        --广告按钮
                        Type = "Ad",
                    },
                    [3] = {
                        --按钮  注释：判定是否拥有金色箱子，如果有则跳转到开箱页面
                        ID = 110335,
                        --白银宝箱按钮
                        Type1 = "SilverBox",
                        --替代类型
                        Type2 = "Diamond",
                        Diamond = 180
                    },
                    [4] = {
                        --广告按钮 
                        ID = 110334,
                        --广告按钮
                        Type = "Ad",
                    },
                }
            },
            --每日限购
            [2] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110360,
                --倒计时
                CountDown = 110358,
                --按钮列表
                Buttons = {
                    [1] = {
                        --按钮  注释：观看广告按钮
                        ID = 110341,
                        --广告按钮
                        Type = "Ad",
                        --剩余可点击次数 10/10
                        Progress = 110342,
                        --需要更换的图片
                        Image = 110338,
                    },
                    ---------------------------------
                    [2] = {
                        --按钮  注释点击购买按钮
                        ID = 110345,
                        --砖石按钮
                        Type = "Diamond",
                        --剩余可点击次数 10/10
                        Progress = 110344,
                        --需要金币数量
                        Text = 110346,
                        --需要更换的图片
                        Image = 110343,
                    },
                    ---------------------------------
                    [3] = {
                        --按钮  注释点击购买按钮
                        ID = 110351,
                        --砖石按钮
                        Type = "Diamond",
                        --剩余可点击次数 10/10
                        Progress = 110350,
                        --需要金币数量
                        Text = 110352,
                        --需要更换的图片
                        Image = 110349,
                    }
                }
            },
            --免费宝石
            [3] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110260,
                --倒计时
                CountDown = 110259,
                --按钮列表
                Buttons = {
                    [1] = {
                        --按钮  注释：观看广告按钮
                        ID = 110284,
                        --广告按钮
                        Type = "Ad",
                        --进度条
                        Progress = 110283,
                    }
                }
            },
            --金币
            [4] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110319,
                --倒计时
                CountDown = 110358,
                --按钮列表
                Buttons = {
                    [1] = {
                        --按钮  注释：观看广告按钮
                        ID = 110300,
                        --广告按钮
                        Type = "Ad",
                        --剩余可点击次数 10/10
                        Progress = 110298,
                        --需要更换的图片
                        Image = 110297,
                    },
                    [2] = {
                        ID = 110304,
                        --砖石按钮
                        Type = "Diamond",
                        --剩余可点击次数 10/10
                        Progress = 110303,
                        --需要金币数量
                        Text = 110305,
                        --需要更换的图片
                        Image = 110302,
                    },
                    [3] = {
                        ID = 110310,
                        --砖石按钮
                        Type = "Diamond",
                        --剩余可点击次数 10/10
                        Progress = 110309,
                        --需要金币数量
                        Text = 110311,
                        --需要更换的图片
                        Image = 110308,
                    }
                }
            },
        },
    },
    --段位页面
    RankView = {
        --切换TAB按钮
        TabButton = {
            --根节点页面ID
            ID = 106562,
            --全球排位赛
            Button_1 = 106568,
            --全球排位赛点击后选中
            Select_1 = 106563,
            --黄金联赛
            Button_2 = 106567,
            --黄金联赛点击后选中
            Select_2 = 106564,
            --钻石联赛
            Button_3 = 106566,
            --钻石联赛点击后选中
            Select_3 = 106565,
        },
        --全球排位赛
        World = {
            --根节点页面ID
            ID = 106605,
            --倒计时
            CountDown = 106555,
            --玩家头像
            Image = 106639,
            --目前玩家段位  青铜  目前玩家的段位  修改图片颜色#58DEFF  未选中的需要改为白色
            Image_1 = 106613,
            --目前玩家段位  白银  目前玩家的段位  修改文字颜色#58DEFF  未选中的需要改为白色
            Image_2 = 106612,
            --目前玩家段位  黄金  目前玩家的段位  修改文字颜色#58DEFF  未选中的需要改为白色
            Image_3 = 106607,
            --目前玩家段位  钻石  目前玩家的段位  修改文字颜色#58DEFF  未选中的需要改为白色
            Image_4 = 106608,
            --目前玩家段位  大师  目前玩家的段位  修改文字颜色#58DEFF  未选中的需要改为白色
            Image_5 = 106610,
            --目前玩家段位  王者  目前玩家的段位  修改文字颜色#58DEFF  未选中的需要改为白色
            Image_6 = 106611,
            --寻找对手按钮
            Button = 106601,
        },
        --黄金联赛
        Gold = {
            --根节点页面ID
            ID = 106518,
            --倒计时
            CountDown = 106606,
            --寻找对手按钮
            Button = 106556,
            --剩余可进入次数  剩余次数:3/3
            Text = 106557,
        },
        --钻石联赛
        Diamond = {
            --根节点页面ID
            ID = 107540,
            --滚动页面
            ScrollView = 107735,
            --倒计时
            CountDown = 107538,
            --寻找对手按钮
            Button = 107472,
            --排名1玩家
            Rank_1 = {
                --名子
                Name = 107551,
                --头像
                Image = 107547,
            },
            --排名2玩家
            Rank_2 = {
                --名子
                Name = 107550,
                --头像
                Image = 107539,
            },
            --排名3玩家
            Rank_3 = {
                --名子
                Name = 107552,
                --头像
                Image = 107549,
            },
            --排名4玩家
            Rank_4 = {
                --名子
                Name = 107529,
                --头像
                Image = 107755,
            },
            --排名5玩家
            Rank_5 = {
                --名子
                Name = 107718,
                --头像
                Image = 107756,
            },
            --排名6玩家
            Rank_6 = {
                --名子
                Name = 107727,
                --头像
                Image = 107757,
            },
            --排名7玩家
            Rank_7 = {
                --名子
                Name = 107746,
                --头像
                Image = 107758,
            },
            --本玩家
            Rank_8 = {
                --名子
                Name = 107568,
                --头像
                Image = 107567,
                --排名
                Text = 107566,
            },
	    },
    }
}

return UIConfig