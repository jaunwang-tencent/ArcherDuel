
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
    --发送信号
    System:BindNotify(_GAME.NetMsg._S_Signal,self.OnSignal,self)

    -- 断线重连时，同步当前游戏状态给客户端
    System:RegisterEvent(Events.ON_PLAYER_RECONNECTED, self.OnReconnected, self)
end

-- 游戏启动时
function GameServer:OnStart()
    ServerLog("[GameServer:OnStart]")

    self.StartTime = TimerManager:GetTimeSeconds()
    self.GameTime = 0
end
--发出信号事件
function GameServer:OnSignal(M,msg,playerId)
   Log:PrintDebug(msg.Signal) 
   System:FireSignEvent(msg.Signal,{playerId})
end
--存储返回
function GameServer:CheckStore(string,num,Player) 
    if num == 1 then
        return Archive:HasPlayerData(Player, Archive.TYPE.Number, string)
    else
        return Archive:HasPlayerData(Player, Archive.TYPE.String, string)
    end
end
--返回已经存储
function GameServer:GetStore(msg,player)
    if msg.num == 1 then
        return Archive:GetPlayerData(player , Archive.TYPE.Number, msg.Store)
        else
        return Archive:GetPlayerData(player , Archive.TYPE.String, msg.Store)
    end 
    
end
--存储事件
function GameServer:OnStore(msg,player)
    if msg.num == 1 then
        Archive:SetPlayerData(player, Archive.TYPE.Number, msg.Store, msg.Value)
       -- Log:PrintDebug("进行存储"..player..msg.Store..msg.Value)
    else
        Archive:SetPlayerData(player, Archive.TYPE.String, msg.Store, msg.Value)
        Log:PrintDebug(msg.Store)
     --   Log:PrintTable(msg)
    end
    
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
