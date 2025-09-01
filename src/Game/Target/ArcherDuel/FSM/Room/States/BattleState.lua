--进入战斗，局内流程
local BattleState = UGCS.RTTI.Class("BattleState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function BattleState:OnSwitch(Args)
    local LoadingState = UGCS.Target.ArcherDuel.Room.States.LoadingState
    if self.FSM:IsState(LoadingState) then
        --战斗状态【务必先加载完，再战斗】
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function BattleState:OnEnter(Previou, Args)
    --打开战斗模块
    Args = Args or {}
    Args.RoomFSM = self.FSM
    UGCS.Target.ArcherDuel.Modules.BattleModule:Open(Args)
end

--- 重置状态
---@param Args 参数列表
function BattleState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function BattleState:OnUpdate(DeltaTime)
    --刷新战斗模块【目前只在战斗状态Tick】
    UGCS.Target.ArcherDuel.Modules.BattleModule:Update(DeltaTime)
end

--- 退出
---@param Next 下一状态
function BattleState:OnExit(Next)
    --退出结算时才关闭战斗模块
    UGCS.Target.ArcherDuel.Modules.BattleModule:Close()
end

return BattleState