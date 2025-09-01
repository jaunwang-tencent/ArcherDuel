--准备游戏，场景加载，初始角色
local LoadingState = UGCS.RTTI.Class("LoadingState", UGCS.Framework.State)

--- 切换
---@param Args 参数列表
---@return 是否切换成功
function LoadingState:OnSwitch(Args)
    --默认允许切换成功
    return true
end

--- 进入
---@param Previous 上一状态
---@param Args 参数列表
function LoadingState:OnEnter(Previous, Args)
    --在此显示加载界面，可以在这里加载场景等相关事务
    UGCS.Target.ArcherDuel.Modules.LoadingModule:Open(Args)
    --分配定时刷新Buff
    self.UpdatorID = UGCS.Framework.Updator.Alloc(1, function()
    end, function(Progress)
        if Progress < 1 then
            -- 更新加载进度
            UGCS.Target.ArcherDuel.Modules.LoadingModule:Update(Progress)
        else
            --关闭加载模块
            UGCS.Target.ArcherDuel.Modules.LoadingModule:Close()
            UGCS.Framework.Updator.Free(self.UpdatorID)
        end
    end)

    TimerManager:AddFrame(1, function()
        -- 开启战斗
        self.FSM:SwitchState(UGCS.Target.ArcherDuel.Room.States.BattleState, Args)
    end)
end

--- 重置状态
---@param Args 参数列表
function LoadingState:OnReset(Args)

end

--- 更新状态
---@param DeltaTime 时间戳
function LoadingState:OnUpdate(DeltaTime)

end

--- 退出
---@param Next 下一状态
function LoadingState:OnExit(Next)

end

return LoadingState