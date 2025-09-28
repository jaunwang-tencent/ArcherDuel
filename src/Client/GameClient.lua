local GameClient = {}
--初始化目标游戏
require "Game.Target.ArcherDuel.Init"
local TaskEvents = UGCS.Target.ArcherDuel.Task.TaskEvents
local TaskManager = UGCS.Target.ArcherDuel.Task.TaskManager
local FightModule = UGCS.Target.ArcherDuel.Modules.FightModule
function GameClient:Init()
    Log:PrintLog("[GameClient:Init]")
    
    -- 绑定网络协议
    System:BindNotify(_GAME.NetMsg.SeverLog, self.OnSeverLog, self)
    System:BindNotify(_GAME.NetMsg.S2C_OnReconnected, self.OnReconnected, self)
end

-- 客户端游戏开始时
function GameClient:OnStart()
    Log:PrintLog("[GameClient:OnStart]")

    self.ArcherDuelApp = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.App)

    TaskManager:Init()
    
    self._startTime = TimerManager:GetTimeSeconds()

    System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.LoginGame)
    
    FightModule:IsMiniGamePlayer()

end

-- 游戏更新
function GameClient:OnUpdate()
    self.ArcherDuelApp:Update()

    local _time = TimerManager:GetTimeSeconds()
    if _time - self._startTime >= 60 then -- 每分钟记录一次
        self._startTime = _time
        System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.PlayDuration)
    end
end

-- 游戏结束
function GameClient:OnEnd()
    Log:PrintLog("[GameClient:OnEnd]")
    if self.ArcherDuelApp then
        self.ArcherDuelApp:Destroy()
        self.ArcherDuelApp = nil
    end
end

-- 断线重连
function GameClient:OnReconnected(msgId, msg)
    Log:PrintLog("[GameClient:OnReconnected]", msg.text)
end

-- 服务端通过网络输出的日志
function GameClient:OnSeverLog(msgId, msg)
    if msg then
        Log:PrintLog("[GameClient:OnSeverLog]", msgId, table.unpack(msg))
    end
end

return GameClient

