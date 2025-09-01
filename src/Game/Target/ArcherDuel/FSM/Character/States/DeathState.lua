--角色死亡
local DeathState = UGCS.RTTI.Class("DeathState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function DeathState:OnSwitch(Args)
    --默认允许切换成功
    return true
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function DeathState:OnEnter(Previous, Args)
end

--- 重置状态
---@param Args 参数列表
function DeathState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function DeathState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function DeathState:OnExit(Next)

end

return DeathState