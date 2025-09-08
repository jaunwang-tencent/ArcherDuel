--大厅状态，来到这个可以在这里
local LobbyState = UGCS.RTTI.Class("LobbyState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function LobbyState:OnSwitch(Args)
    if not self.FSM:IsState(UGCS.Target.ArcherDuel.System.States.LobbyState) then
        --只要不是大厅状态过来都是被允许切入的
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function LobbyState:OnEnter(Previous, Args)
    
end

--- 重置状态
---@param Args 参数列表
function LobbyState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function LobbyState:OnUpdate(DeltaTime)
    
end

--- 退出
---@param Next 下一状态
function LobbyState:OnExit(Next)
    
end

return LobbyState