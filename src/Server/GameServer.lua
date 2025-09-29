
local GameServer = {
    StartTime = 0, --开始时间
    GameTime = 0, --游戏时间
}

-- 服务端日志输出，可以选择是否发送给客户端由客户端进行输出，方便联网调试
local function ServerLog(...)
    Log:PrintLog(...)

    if Debug then
        -- 将服务端日志发送至客户端
        System:SendToAllClients(
            _GAME.NetMsg.SeverLog,
            {...}
        )
    end
end

function GameServer:Init()
    ServerLog("[GameServer:Init]")

    -- 断线重连时，同步当前游戏状态给客户端
    System:RegisterEvent(Events.ON_PLAYER_RECONNECTED, self.OnReconnected, self)
end

-- 游戏启动时
function GameServer:OnStart()
    ServerLog("[GameServer:OnStart]")

    self.StartTime = TimerManager:GetTimeSeconds()
    self.GameTime = 0
end

-- 游戏结束时
function GameServer:OnEnd()
    ServerLog("[GameServer:OnEnd]")
end

-- 游戏更新
function GameServer:OnUpdate()
    -- 当前游戏总时间
    self.GameTime = TimerManager:GetTimeSeconds() - self.StartTime
end

-- 断线重连
function GameServer:OnReconnected(playerId, levelId)
    Log:PrintLog("[GameServer:OnReconnected]", playerId, levelId)
    local msg = {
        text = "游戏进行中！",
        time = self.GameTime,
    }
    System:SendToClient(playerId, _GAME.NetMsg.S2C_OnReconnected, msg)
end

System:RegisterEvent(Events.ON_CHARACTER_CREATED, function (playerId)
    System:SendToClient(playerId,_GAME.NetMsg.C2S_Chuangjian)
end)

return GameServer
