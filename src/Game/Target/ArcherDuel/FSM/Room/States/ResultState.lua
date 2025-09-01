--战斗结算，结算界面
local ResultState = UGCS.RTTI.Class("ResultState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function ResultState:OnSwitch(Args)
    if self.FSM:IsState(UGCS.Target.ArcherDuel.Room.States.BattleState) then
        --结算状态【务必从战斗状态来】
        return true
    end
    return false
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function ResultState:OnEnter(Previous, Args)
    local OpenResult =  Args and Args.OpenResult
    if OpenResult then
        System:FireSignEvent(OpenResult)
    end
end

--- 重置状态
---@param Args 参数列表
function ResultState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function ResultState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function ResultState:OnExit(Next)

end

return ResultState