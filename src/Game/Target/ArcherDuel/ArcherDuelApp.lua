--游戏应用程序，提供生命周期
local ArcherDuelApp = UGCS.RTTI.Class("ArcherDuelApp", UGCS.Framework.Application)
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils

--创建
function ArcherDuelApp:OnCreate()
    ArcherDuelApp.super.OnCreate(self)
    GameUtils.RegisterAdFinishEvent()

    self.SystemFSM = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.System.FSM)
end

--销毁
function ArcherDuelApp:OnDestroy()
    GameUtils.UnregisterAdFinishEvent()
    ArcherDuelApp.super.OnDestroy(self)

    self.SystemFSM:Destroy()
    self.SystemFSM = nil
end

--刷新
function ArcherDuelApp:OnUpdate(DeltaTime)
    --刷新状态机
    self.SystemFSM:Update(DeltaTime)
end

return ArcherDuelApp