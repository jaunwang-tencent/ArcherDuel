--UI配置，将各个业务模块的UI页面ID按照如下格式配置，并提供好注释
local UIConfig = {
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