local GameClient = {}
--初始化目标游戏
require "Game.Target.ArcherDuel.Init"

function GameClient:Init()
    Log:PrintLog("[GameClient:Init]")
    
    -- 绑定网络协议
    System:BindNotify(_GAME.NetMsg.SeverLog, self.OnSeverLog, self)
    System:BindNotify(_GAME.NetMsg.S2C_OnReconnected, self.OnReconnected, self)
end

-- 客户端游戏开始时
function GameClient:OnStart()
    Log:PrintLog("[GameClient:OnStart]")
    
    UI:SetImage({100470},Chat:GetCustomHeadIcon(Character:GetLocalPlayerId()))

    self.ArcherDuelApp = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.App)

    local TaskManager = require "Game.Framework.Task.Task"
    TaskManager:Init()
end

-- 游戏更新
function GameClient:OnUpdate()
    self.ArcherDuelApp:Update()
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

