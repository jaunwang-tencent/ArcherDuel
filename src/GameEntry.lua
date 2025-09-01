-- 脚本加载入口
Setting:SwitchToVerticalScreen(true)

_GAME = {}
--信号事件
_GAME.Sign = {
    --开始匹配
    BattleMatching = "Battle Matching",
    --匹配对手信息
    BattleStorage = "Battle Storage",
    --战斗开始
    BattleStart = "Battle Start",
    --游戏胜利
    GameVictory = "Game Victory",
    --游戏失败
    GameOver = "Game Over",
    --再来一局
    BattleAgain = "Battle Again",
}

--游戏内事件
_GAME.Events = {
    --游戏结束
    GameEnd = "GameEnd",
}

-- 网络协议
_GAME.NetMsg = {
    SeverLog = 1000, -- 服务端日志输出

    S2C_OnReconnected = 1004,
    C2S_Chuangjian = 10005,
}

------------------------------------------------- Game Require ------------------------------------------------------
local GameServer = require "Server.GameServer"
local GameClient = require "Client.GameClient"

------------------------------------------------- Game Life ---------------------------------------------------------
-- 初始化
GameServer:Init()
GameClient:Init()

-- 客户端游戏更新
local function UpdateClient()
    GameClient:OnUpdate()
end

-- 服务端游戏更新
local function UpdateServer()
    GameServer:OnUpdate()
end

-- 脚本启动时调用
local function OnBeginPlay()
    -- 请注意 单机启动的游戏既是服务器端又是客户端 System:IsServer() 和 System:IsClient() 都返回 true

    -- 启动服务器
    if System:IsServer() then
        -- 服务端游戏开始入口
        GameServer:OnStart()

        -- 循环更新服务器
        TimerManager:AddLoopFrame(1, UpdateServer)
    end

    -- 启动客户端
    if System:IsClient() then
        -- 客户端游戏开始入口
        GameClient:OnStart()
        
        -- 循环更新客户端
        TimerManager:AddLoopFrame(1, UpdateClient)
    end
end

-- 脚本结束时调用
local function OnEndPlay()
    if System:IsServer() then
        GameServer:OnEnd()
    end

    if System:IsClient() then
        GameClient:OnEnd()
    end
end

-- 监听脚本启动事件
System:RegisterEvent(Events.ON_BEGIN_PLAY, OnBeginPlay)

-- 监听脚本结束事件
System:RegisterEvent(Events.ON_END_PLAY, OnEndPlay)