local TaskEvents = {
    LoginGame = "LoginGame", -- 登录游戏
    BattleWin = "BattleWin", --对局胜利
    BattleComplete = "BattleComplete", --对局完赛
    HeadShot = "HeadShot", --命中头部
    BattleWinUseBow = "BattleWinUseBow", --使用弓赢得比赛
    BattleWinUseAxe = "BattleWinUseAxe", --使用斧赢得比赛
    BattleWinUseSpear = "BattleWinUseSpear", --使用矛赢得比赛
    UpdateAxe = "UpdateAxe", --升级斧
    UpdateSpear = "UpdateSpear", --升级矛
    UpdateBow = "UpdateBow", --升级弓
    UpdateBottoms = "UpdateBottoms", --升级下装
    UpdateTop = "UpdateTop", --升级上装
    UpdateCharacter = "UpdateCharacter", --升级身体
    WinBloodline60 = "WinBloodline60", --以60%或更高血量获胜
    WinBloodline80 = "WinBloodline80", --以80%或更高血量获胜
    WinBloodline100 = "WinBloodline100", --以100%或更高血量获胜
    AdCoin = "AdCoin", --领取免费金币
    AdDiamond = "AdDiamond", --领取免费钻石
    GainCoin = "GainCoin", --赢得金币
    OpenBox = "OpenBox", --开启宝箱
    GoldBattle = "GoldBattle", --参加一次黄金联赛
    DiamondBattle = "DiamondBattle", --参加一次钻石联赛
    PlayDuration = "PlayDuration", --累计在线时间
}

return TaskEvents