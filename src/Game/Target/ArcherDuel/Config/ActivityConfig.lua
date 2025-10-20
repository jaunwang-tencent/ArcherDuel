--活动配置
local ActivityConfig = {
    --限定奖池【开宝箱，获取装备】
    LimitActivity = {

    },
    --每日限购【装备获取】
    DailyActivity = {

    },
    --免费砖石【看广告】
    FreeDiamond = {

    },
    --金币购买【砖石消耗】
    PurchaseCoin = {

    },
    --七日签到奖励配置
    SignIn_7Day = {
            --签到第一天奖励
            [1] = {
            Goods =  {
                Sting = "SilverBox",
                Num  = 1,
            }
            },
            --签到第二天奖励
            [2] = {
                Goods =  {
                EquipmentID = 6  ,
                Num  = 1,
            }
            },
            --签到第三天奖励
            [3] = {
                Goods =  {
                Sting = "Coin"  ,
                Num  = 2000 ,
            }
            },
            --签到第四天奖励
            [4] = {
                Goods =  {
                Sting = "Diamond"  ,
                Num  = 600 ,
            }
            },
            --签到第五天奖励
            [5] = {
                Goods =  {
                Sting = "GoldBox"  ,
                Num  = 1 ,
            }
            },
            --签到第六天奖励
            [6] = {
                Goods =  {
                Sting = "Coin"  ,
                Num  = 3000,
            }
            },
            --签到第七天奖励
            [7] = {
                Goods =  {
                EquipmentID = 71  ,
                Num  = 1 ,
            },
        },
    },
}

return ActivityConfig