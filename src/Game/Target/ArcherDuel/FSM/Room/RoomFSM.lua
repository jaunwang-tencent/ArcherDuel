--房间态机【局内】
local RoomFSM = UGCS.RTTI.Class("RoomFSM", UGCS.Framework.FSM)

--- 构造
---@param Context 上下文
function RoomFSM:OnCreate(Context)
    RoomFSM.super.OnCreate(self, Context)

    --进入房间后切换到加载状态
    self:SwitchState(UGCS.Target.ArcherDuel.Room.States.LoadingState, Context)
    self.Context = Context
end

--- 销毁
function RoomFSM:OnDestroy()
    self.Context = nil
    RoomFSM.super.OnDestroy(self)
end

--- 刷新状态机时
---@param DeltaTime 时间戳
function RoomFSM:OnUpdate(DeltaTime)

end

return RoomFSM