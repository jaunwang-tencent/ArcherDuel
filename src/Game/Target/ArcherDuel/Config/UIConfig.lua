--UI配置，将各个业务模块的UI页面ID按照如下格式配置，并提供好注释
local UIConfig = {
    ---------------以下是局内UI----------------------
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
            --血条扣除血量
            DeductHP = 111284,
        },
        --敌方玩家
        EnemyPlayer = {
            --根节点页面ID
            ID = 105659,
            --昵称
            NickName = 105653,
            --血条
            HPValue = 105649,
            --血条扣除血量
            DeductHP = 111273,
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
    ---------------以上是局内UI----------------------
    --加载页面
    LoadingView = {
        --根节点页面ID
        ID = 106412,
        --加载进度条
        LoadProcess = 106413
    },
    ---------------以下是局外UI----------------------
    --主视图
    MainView = {
        --主题栏
        TitleBar = {
            ID = 100531,
            --按钮
            Buttons = {
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
            }
        },
        --通用-资源栏
        GeneralResourceBar = {
            ID = 100528,
            --玩家图标
            PlayerIcon = 100470,
            --段位
            Rank = {
                ID = 101854,
				Icon = 101851,
                Label = 101853
            },
            --金币
            GoldCoins = {
                ID = 100478,
                Label = 103872
            },
            --砖石
            Diamonds = {
                ID = 103869,
                Label = 103868
            },
            --点券
            Securities = {
                ID = 103873,
                Label = 100474
            }
        },
        --商店-资源栏
        StoreResourceBar = {
            ID = 107845,
            --银宝箱
            SilverBox = {
                ID = 107829,
                Label = 107828
            },
            --金宝箱
            GoldBox = {
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
            Character = {
                Label = 104156,
                Image = 100534,
                Progress = 101868,
                --背景图
                Background = 110835,
                --进度条文本
                ProgressText = 111287
            },
            --上衣
            Top = {
                Label = 104157,
                Image = 100535,
                Progress = 104028,
                --背景图
                Background = 110834,
                --进度条文本
                ProgressText = 111288
            },
            --发型
            Bottoms = {
                Label = 104158,
                Image = 100536,
                Progress = 104029,
                --背景图
                Background = 110833,
                --进度条文本
                ProgressText = 111290
            }
        },
        --右视图
        RightView = {
            ID = 104496,
            -- 弓箭
            Bow = {
                Label = 104159,
                Image = 100539,
                Progress = 104030,
                --背景图
                Background = 110847,
                --进度条文本
                ProgressText = 111291
            },
            -- 手斧
            Axe = {
                Label = 104679,
                Image = 100538,
                Progress = 104031,
                EmptyImage = 110930,
                --背景图
                Background = 110846,
                --进度条文本
                ProgressText = 111292
            },
            -- 长矛
            Spear = {
                Label = 104680,
                Image = 100537,
                Progress = 104542,
                EmptyImage = 110929,
                --背景图
                Background = 110845,
                --进度条文本
                ProgressText = 111293
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
                --角色
                Character = {
                    Category = 1,
                    --命中
                    Selected = 104036,
                    --未命中
                    Unselected = 110757
                },
                --上衣
                Top = {
                    Category = 2,
                    --命中
                    Selected = 104037,
                    --未命中
                    Unselected = 110758
                },
                --发型
                Bottoms = {
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
                    --背景图
                    Background = 110794,
                    --可升级图标  --需要播放东西
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
                    --进度条文本
                    ProgressText = 111285,
                    --装备遮罩
                    MaskIcon = 115142
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
            --装备背景
            Background = 110919,
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
            --升级特效
            UpgradeEffect = {
                111423,111422,111421
            },
            --升级进度
            UpgradeProgress = {
                --当前进度
                Current = 104178,
                --下一进度
                Next = 104177
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
                --可升级图标 --需要播放动画
                Icon = 104175,
                --升级进度
                Progress = 100562,
                --进度条文本
                ProgressText = 111286
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
                --升级所需价钱
                UpgradePrice= 104193
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
                --升级所需价钱
                UpgradePrice= 104189
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
            --时间
            Time = 111150,
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
        },
        --日常任务
        TaskList = {
            --根节点页面ID
            ID = 110369,
            --组中的内容
            TaskRich =  {  --按照组中顺序排列  即 列表第一个为 Black  第二个为 Icon 
                --遮罩
                Black = 111151,
                -- 已完成图标
                Icon = 110486,
                --任务说明
                TaskText = 110370,
                --前往按钮
                BtnID1 = 110368 ,
                -- 领取按钮
                BtnID2 = 110367,
                -- 进度条上方的文字
                ProgressText = 111105,
                -- 进度条
                Progress = 110366,
                --完成任务的活跃值
                TextXP = 111101,
                --XP背景
                XPBG = 111100,
                --背景
                TaskBG = 110364,
            }
        },
    },
    --对决页面
    FightView = {
        --左视图
        LeftView = {
            ID = 104220,
            --角色
            Character = {
                Label = 104839,
                Image = 100506,
                --背景图
                Background = 110843,
            },
            --上衣
            Top = {
                Label = 104838,
                Image = 100507,
                --背景图
                Background = 110842,
            },
            --下装
            Bottoms = {
                Label = 104837,
                Image = 100508,
                --背景图
                Background = 110841,
            }
        },
        --右视图
        RightView = {
            ID = 104219,
            --弓箭
            Bow = {
                Label = 104843,
                Image = 100509,
                --背景图
                Background = 110829,
            },
            --投斧
            Aex = {
                Label = 104842,
                Image = 100510,
                --背景图
                Background = 110831,
                EmptyImage = 110927
            },
            --投矛
            Spear = {
                Label = 104841,
                Image = 100511,
                --背景图
                Background = 110832,
                EmptyImage = 110928
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
                --进入需要金币数量
                Text = 113565,
            },
            --段位
            Rank = {
                --段位图片
                Image =  100492,
                --段位文本
                Text = 100491,
                --段位进度条
                Progress = 100495,
                --奖励按钮
                Button = 100496,
                --奖励背光
                Image_1 = 113112,
                --奖励背光动画 可领取时打开可见并打开动画1
                Image_2 = 104216,
                --积分减少 文本
                Text_1 = 113098,
                --积分增加文本
                Text_2 = 113106,
                --需要金币数量文本
                Text_3 = 113108,
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
        --商店购买弹窗
        PurchasePopup = {
            --根节点id
            ID = 111046,
            --关闭按钮 --透明度为0的全屏按钮，
            Button = 111043,
            --背景动画  开启需打开动画
            AnimIcon  = 111228,
            --装备图标
            Icon = 111051,
            --装备背景
            BGIcon = 111040,
            --播放翻牌图片
            Icon_1 = 115165,
            --翻牌后出现的道具图片
            Icon_2 = 115189,
            --翻牌后出现的道具数量
            Text = 115190
        },
        --商店看广告获得钻石弹窗
        AdPopup = {
            --根节点id
            ID = 111047,
            --关闭按钮 
            Button = 111028,
            --道具图标  即为购买展示图标
            Icon = 111032,
            --道具顶上文本  即为道具二级弹窗上的道具名称
            Text = 111031,
            --道具数量文本  即为购买展示图标下的数量
            Text_1 = 111033,
            --道具说明文本
            Text_2 = 111025,
            --道具获取次数文本
            Text_3 = 111030,
            --道具获取按钮
            Button_1 = 111026,
        },
        --商城活动
        Activities = {
            --限定奖池
            [1] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110329,
                --倒计时
                CountDown = 110327,
                --活动页面视图【一些购买按钮&商品槽】
                Views = {
                    [1] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮  注释：判定是否拥有金色箱子，如果有则跳转到开箱页面
                                ID = 110331,
                                --宝箱类型
                                BoxStyle = {
                                    --替换的图标  --检查是否有宝箱后，替换这个图标
                                    Icon = 111323,
                                    --替换的道具数量
                                    Price = 111325, --宝箱没有时，钻石为600
                                },
                            },
                            [2] = {
                                --广告按钮
                                ID = 110330,
                                --限时类型
                                LimitStyle = {
                                    --获取图标
                                    Icon = 111352,
                                    --倒计时
                                    CDTime = 111351,
                                },
                                --需要替换的颜色 看完广告后，需要将按钮颜色转为灰色，不可继续观看广告，并开启倒计时24小时
                                Color = "#505050",
                                --需要替换颜色2，倒计时结束后，需要将颜色替换成原来的颜色，可继续点击
                                Color_1 = "#FFFFFF",
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 111318
                            },
                            [2] = {
                                ID = 111317
                            },
                            [3] = {
                                ID = 111316
                            },
                            [4] = {
                                ID = 111315
                            },
                            [5] = {
                                ID = 111314
                            },
                            [6] = {
                                ID = 111313
                            }
                        }
                    },
                    [2] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮  注释：判定是否拥有紫色箱子，如果有则跳转到开箱页面
                                ID = 110335,
                                --宝箱类型
                                BoxStyle = {
                                    --替换的图标  --检查是否有宝箱后，替换这个图标
                                    Icon = 111329,
                                    --替换的道具数量
                                    Price = 111330, --宝箱没用时，钻石为180
                                },
                            },
                            [2] = {
                                --广告按钮
                                ID = 110334,
                                --限时类型
                                LimitStyle = {
                                    --获取图标
                                    Image = 111353,
                                    --倒计时
                                    CDTime = 111354,
                                },
                                --需要替换的颜色 看完广告后，需要将按钮颜色转为灰色，不可继续观看广告，并开启倒计时24小时
                                Color = "#505050",
                                --需要替换颜色2，倒计时结束后，需要将颜色替换成原来的颜色，可继续点击
                                Color_1 = "#FFFFFF",
                            },
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 111298
                            },
                            [2] = {
                                ID = 111300
                            },
                            [3] = {
                                ID = 111301
                            },
                            [4] = {
                                ID = 111303
                            },
                            [5] = {
                                ID = 111304
                            },
                            [6] = {
                                ID = 111302
                            }
                        }
                    }
                },
            },
            --每日限购
            [2] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110360,
                --倒计时
                CountDown = 110358,
                --活动页面视图【一些购买按钮&商品槽】
                Views = {
                    [1] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮
                                ID = 110341,
                                --看广告方式
                                AdStyle = 111345,
                                --砖石购买方式
                                DiamondStyle = {
                                    --砖石图标
                                    Icon = 115151,
                                    --砖石数量
                                    Price = 115150,
                                },
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 110338,
                                --背景图
                                Background = 115379,
                                --剩余可点击次数 10/10
                                Times = 110339,
                            }
                        }
                    },
                    [2] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮
                                ID = 110345,
                                --看广告方式
                                AdStyle = 115145,
                                --砖石购买方式
                                DiamondStyle = {
                                    --砖石图标
                                    Icon = 110347,
                                    --砖石数量
                                    Price = 110346,
                                },
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 110343,
                                --背景图
                                Background = 115380,
                                --剩余可点击次数 10/10
                                Times = 110344,
                            }
                        }
                    },
                    [3] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮  注释点击购买按钮
                                ID = 110351,
                                --看广告方式
                                AdStyle = 115148,
                                --砖石购买方式
                                DiamondStyle = {
                                    --砖石图标
                                    Icon = 110353,
                                    --砖石数量
                                    Price = 110352,
                                },
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 110349,
                                --背景图
                                Background = 115381,
                                --剩余可点击次数 10/10
                                Times = 110350,
                            }
                        }
                    }
                },
            },
            --免费砖石
            [3] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110260,
                --倒计时
                CountDown = 110259,
                --活动页面视图【一些购买按钮&商品槽】
                Views = {
                    [1] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮  注释：观看广告按钮
                                ID = 110284,
                                --广告提示
                                AdStyle = 111336,
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 111333,
                                --图标锁定【加上这个这不允许修正商品图标】
                                IconLock = true,
                                --商品数量
                                Count = 115429,
                                --剩余可点击次数 10/10
                                Times = 115395,
                            }
                        }
                    }
                },
            },
            --金币
            [4] = {
                --根节点页面ID--需添加到滚动列表
                ID = 110319,
                --活动页面视图【一些购买按钮&商品槽】
                Views = {
                    [1] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                --按钮  注释：观看广告按钮
                                ID = 110300,
                                --看广告方式
                                AdStyle = 111342,
                                --砖石购买方式
                                DiamondStyle = {
                                    --砖石图标
                                    Icon = 115164,
                                    --砖石数量
                                    Price = 115163,
                                },
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 110297,
                                --物品数量
                                Count = 110298,
                            }
                        }
                    },
                    [2] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                ID = 110304,
                                --看广告方式
                                AdStyle = 115158,
                                --砖石购买方式
                                DiamondStyle = {
                                    --砖石图标
                                    Icon = 110306,
                                    --砖石数量
                                    Price = 110305,
                                },
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 110302,
                                --物品数量
                                Count = 110303,
                            }
                        }
                    },
                    [3] = {
                        --按钮槽
                        ShopGroup = {
                            [1] = {
                                ID = 110310,
                                --看广告方式
                                AdStyle = 115161,
                                --砖石购买方式
                                DiamondStyle = {
                                    --砖石图标
                                    Icon = 110312,
                                    --砖石数量
                                    Price = 110311,
                                },
                            }
                        },
                        --商品槽
                        GoodGroup = {
                            [1] = {
                                ID = 110308,
                                --物品数量
                                Count = 110309,
                            }
                        }
                    }
                },
            },
        },
    },
    --联赛页面
    TournamentView = {
        --切换TAB按钮
        TabButton = {
            --根节点页面ID
            ID = 106562,
            --全球排位赛
            WorldTab = {
                --命中选中
                Unselected = 106563,
                --未命中选中
                Selected = 106568,
                --视图子项
                ViewItems = {
                    106605,
                }
            },
            GoldTab = {
                --命中选中
                Unselected = 106567,
                --未命中选中
                Selected = 106564,
                --视图子项
                ViewItems = {
                    106518,
                }
            },
            DiamondTab = {
                --命中选中
                Unselected = 106566,
                --未命中选中
                Selected = 106565,
                --视图子项
                ViewItems = {
                    107540,
                }
            },
        },
        --全球排位赛
        World = {
            --根节点页面ID
            ID = 106605,
            --倒计时
            CountDown = 106555,
            --玩家头像1
            Image_Avatar_1 = 115581,
            --玩家头像2
            Image_Avatar_2 = 115580,
            --玩家头像3
            Image_Avatar_3 = 106639,
            --玩家头像4
            Image_Avatar_4 = 115582,
            --玩家头像5
            Image_Avatar_5 = 115583,
            --玩家头像6
            Image_Avatar_6 = 115584,
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
            --按钮花费货币数量
            Text = 107474,
            --弹窗
            Popup = {
                --弹窗根节点
                ID = 111185,
                --道具1图标
                Image_1 = 111186,
                --道具2图标
                Image_2 = 111188,
                --道具2数量
                Image_3 = 111189,
                --道具1数量
                Text_1 = 111192,
                --道具2数量
                Text_2 = 111191,
                --道具3数量
                Text_3 = 111190,
            },
            --排名1玩家
            Rank_1 = {
                --名字
                Name = 111160,
                --头像
                Image = 111161,
                --礼包按钮
                Button = 111164,
                --奖杯数量
                Text = 111163,
            },
            --排名2玩家
            Rank_2 = {
                --名子
                Name = 107550,
                --头像
                Image = 107539,
                --礼包按钮
                Button = 111154,
                --奖杯数量
                Text = 107556,
            },
            --排名3玩家
            Rank_3 = {
                --名子
                Name = 111166,
                --头像
                Image = 111167,
                --礼包按钮
                Button = 111170,
                --奖杯数量
                Text = 111169,
            },
            --排名4以后计入滚动页面视图
            Rank_Scroll= {
                --根节点页面ID
                ID = 107535,
                --礼包按钮
                Button = 111172,
                --奖杯数量
                Text = 107533,
                --玩家排名
                Text_1 = 107716,
                --玩家昵称
                Text_2 = 107529,
                --玩家头像
                Image = 107755,
                --玩家昵称
                Name = 107529,
                --奖杯图标
                Image_1 = 107531,
                --底板
                ImageBG = 107526,
            },
            --本玩家
            Rank_8 = {
                --昵称
                Name = 107568,
                --头像
                Image = 107567,
                --排名
                Text = 107566,
                --礼包按钮
                Button = 107572,
                --奖杯数量
                Text_1 = 107574,
            },
	    },
    },
    --七日挑战
    SevenDays = {
        --根节点页面ID
        ID = 105217,
        --任务进度  0/21
        Progress = 101119,
        --时间
        Time = 101107,
        --切换tab栏
        TabButton = { 
            --跟节点页面ID
            ID = 100533 ,
            --每日切换tab按钮
            Days1 = {
                --命中选中
                Unselected = 111262,
                --未命中选中
                Selected = 101111,
                --视图子项
                ViewItems = {
                    101317
                }
            },
            Days2 = {
                --命中选中
                Unselected = 111263,
                --未命中选中
                Selected = 105203,
                --视图子项
                ViewItems = {
                    105092
                },
                --未解锁状态颜色为
                Lock = "#8E8E8E",
                --未解锁的锁
                LockImage = 111213,
                --已解锁状态颜色为
                OnLock = "FFFFFFFF"

            },
            Days3 = {
                --命中选中
                Unselected = 111264,
                --未命中选中
                Selected = 105204,
                --视图子项
                ViewItems = {
                    105114
                },
                --未解锁状态颜色为
                Lock = "#8E8E8E",
                --未解锁的锁
                LockImage = 111214,
                --已解锁状态颜色为
                OnLock = "FFFFFFFF"
            },
            Days4 = {
                --命中选中
                Unselected = 111265,
                --未命中选中
                Selected = 105205,
                --视图子项
                ViewItems = {
                    105136
                },
                --未解锁状态颜色为
                Lock = "#8E8E8E",
                --未解锁的锁
                LockImage = 111215,
                --已解锁状态颜色为
                OnLock = "FFFFFFFF"
            },
            Days5 = {
                --命中选中
                Unselected = 111266,
                --未命中选中
                Selected = 105206,
                --视图子项
                ViewItems = {
                    105158
                },
                --未解锁状态颜色为
                Lock = "#8E8E8E",
                --未解锁的锁
                LockImage = 111218,
                --已解锁状态颜色为
                OnLock = "FFFFFFFF"
            },
            Days6 = {
                --命中选中
                Unselected = 111267,
                --未命中选中
                Selected = 105207,
                --视图子项
                ViewItems = {
                    105180
                },
                --未解锁状态颜色为
                Lock = "#8E8E8E",
                --未解锁的锁
                LockImage = 111216,
                --已解锁状态颜色为
                OnLock = "FFFFFFFF"
            },
            Days7 = {
                --命中选中
                Unselected = 111268,
                --未命中选中
                Selected = 105208,
                --视图子项
                ViewItems = {
                    105202
                },
                --未解锁状态颜色为
                Lock = "#8E8E8E",
                --未解锁的锁
                LockImage = 111219,
                --已解锁状态颜色为
                OnLock = "FFFFFFFF"
            },

        },
        DayTask = {
            --根节点页面ID
            ID  = 105092 ,
            --任务1
            Task1 = {
                 --前往按钮
                ID = 105072 ,
                --已完成显示图片
                Image = 105073,
                --进度条@@完成进度
                Progress = 105071 ,
                --任务文本
                Text = 105076,
                },
                --任务2
                Task2 = {
                    --前往按钮
                    ID = 105079 ,
                    --已完成显示图片
                    Image = 105080,
                    --进度条@@完成进度
                    Progress = 105078 ,
                    --任务文本
                    Text = 105083,
                },
                --任务3
                Task3 = {
                    --前往按钮
                    ID = 105086 ,
                    --已完成显示图片
                    Image = 105087,
                    --进度条@@完成进度
                    Progress = 105085 ,
                    --任务文本
                    Text = 105090,
                },

            },
        --完成七日挑战次数进度条
        TaskProgress = {
            --进度条
            Progress = 101118,
            --达到光效 -- 当进度到达5，10，15，20时打开对应的动画和可见性  领取后隐藏
            Image = {111387,111386,111382,111368},
            --锁图标  --当解锁后隐藏图标
            Lock = {105021,105022,105023,105024},
            --礼包按钮  
            Button = {111269,111270,111271,111272},
            --对号 --完成后打开
            Check = {105010,105011,105012,105013},
            --遮罩 --完成后打开
            Mask = {111242,111243,111244,111245},
        }
    },
    --宝箱视图【开宝箱】
    BoxView = {
        --两个道具
        TwoItem = {
            ID = 108048,
            --按钮组
            ShopGroup = {
                --再开一个【播放广告】
                OnceMore = 108058,
                --延迟显示部分
                Later = {
                    ID = 108480,
                    --返回主页
                    GoBack = 108059,
                    --再来一局
                    PlayAgain = 108060
                }
            },
            --开箱表演
            PerformGroup = {
                --蓝宝箱
                [1] = {
                    --标识
                    ID = 108056,
                    --资源ID【参见配表：ResourceConfig】
                    ResourceID = 200001
                }
            },
            --装备组
            ItemGroupID = 111057,
            ItemGroup = {
                [1] = {
                    Icon = 108054,
                    Background = 111058,
                    --播放翻牌图片 --当装备碎片溢出时播放动画
                    Icon_1 = 115197,
                    --翻牌后出现的道具图片
                    Icon_2 = 115198,
                    --翻牌后出现的道具数量
                    Text = 115199
                },
                [2] = {
                    Icon = 108055,
                    Background = 111059,
                    --播放翻牌图片
                    Icon_1 = 115239,
                    --翻牌后出现的道具图片
                    Icon_2 = 115240,
                    --翻牌后出现的道具数量
                    Text = 115241
                }
            }
        },
        --三个道具
        ThreeItem = {
            --宝箱根节点
            ID = 110963,
            --按钮组【领取】
            Button = {
                ID = 110959,
                Icon = 110962,
                Text = 110965
            },
            --开箱表演
            PerformGroup = {
                --蓝宝箱
                [1] = {
                    --标识
                    ID = 111098,
                    --资源ID【参见配表：ResourceConfig】
                    ResourceID = 200001
                },
                --红宝箱
                [2] = {
                    --标识
                    ID = 110964,
                    --资源ID【参见配表：ResourceConfig】
                    ResourceID = 200002
                },
                --紫宝箱
                [3] = {
                    --标识
                    ID = 111099,
                    --资源ID【参见配表：ResourceConfig】
                    ResourceID = 200003
                }
            },
            --装备组
            ItemGroupID = 111095,
            ItemGroup = {
                [1] = {
                    Icon = 111094,
                    Background = 111092,
                    --播放翻牌图片 --当装备碎片溢出时播放动画
                    Icon_1 = 115361,
                    --翻牌后出现的道具图片
                    Icon_2 = 115362,
                    --道具数量 --翻牌后出现的道具数量
                    Text = 115363
                },
                [2] = {
                    Icon = 111093,
                    Background = 111091,
                    --播放翻牌图片 --当装备碎片溢出时播放动画
                    Icon_1 = 115365,
                    --翻牌后出现的道具图片
                    Icon_2 = 115366,
                     --道具数量 --翻牌后出现的道具数量
                    Text = 115367,
                    --广告显示组
                    ad = 115398 ,
                    --广告按钮
                    AdButton = 115396,
                },
                [3] = {
                    Icon = 111096,
                    Background = 111097,
                    --播放翻牌图片 --当装备碎片溢出时播放动画
                    Icon_1 = 115273,
                    --翻牌后出现的道具图片
                    Icon_2 = 115274,
                    --道具数量 --翻牌后出现的道具数量
                    Text = 115275,
                    --广告显示组
                    ad = 115403 ,
                    --广告按钮
                    AdButton = 115400,
                }
            }
        },
    },
    --获得视图【购买】
    GainView = {
        ID = 111046,
        --点击继续【再来一局】
        CloseButton = 111043,
        --背景光【播放动画】
        BackgroundEffect = 111228,
        --物品槽
        GoodSlot = {
            ID = 111052,
            --图标
            Icon = 111051,
            --背景图
            Background = 111040
        },
        --金币槽
        CoinSlot = {
            ID = 115196,
            --图标
            Icon = 115189,
            --背景图
            Background = 115165,
            --金币数量
            Count = 115190
        },
    },
    --广告视图【砖石不足时弹出】
    AdView = {
        ID = 111029,
        --关闭按钮
        CloseButton = 111028,
        --砖石数量
        DiamondCount = 111033,
        --广告按钮
        AdButton = 111026,
        --观看次数
        Times = 111030
    }
    ---------------以上是局外UI----------------------
}

return UIConfig