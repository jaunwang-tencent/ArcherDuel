--房间状态
local RoomState = UGCS.RTTI.Class("RoomState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function RoomState:OnSwitch(Args)
    if self.FSM:IsState(UGCS.Target.ArcherDuel.System.States.MatchState) then
        --只能从匹配状态而来
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function RoomState:OnEnter(Previous, Args)
    --可以在这里加载场景等相关事务
    --创建房间状态机，构建局内状态机
    self.RoomFSM = UGCS.RTTI.CreateInstanceByType(UGCS.Target.ArcherDuel.Room.FSM, Args)
end

--- 重置状态
---@param Args 参数列表
function RoomState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function RoomState:OnUpdate(DeltaTime)
    --刷新房间状态机
    self.RoomFSM:Update(DeltaTime)
end

--- 退出
---@param Next 下一状态
function RoomState:OnExit(Next)
    self.RoomFSM:Destroy()
    self.RoomFSM = nil
end

return RoomState