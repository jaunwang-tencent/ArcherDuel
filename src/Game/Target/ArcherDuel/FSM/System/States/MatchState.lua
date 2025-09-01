--匹配状态
local MatchState = UGCS.RTTI.Class("MatchState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function MatchState:OnSwitch(Args)
    return true
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function MatchState:OnEnter(Previous, Args)
    
end

--- 重置状态
---@param Args 参数列表
function MatchState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function MatchState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function MatchState:OnExit(Next)

end

return MatchState