--游戏应用程序，提供生命周期
local Application = UGCS.RTTI.Class("Application")

--创建
function Application:OnCreate()
    self.TimeAxis = UGCS.RTTI.CreateInstanceByType(UGCS.Framework.TimeAxis)

    --当前应用【有且仅有一个应用】
    Application.current = self
end

--销毁
function Application:OnDestroy()
    self.TimeAxis:Destroy()
    Application.current = nil
end

--刷新
function Application:Update()
    --刷新时间轴
    local DeltaTime = self.TimeAxis:Update()

    --子类化刷新事件
    self:OnUpdate(DeltaTime)

    --执行简易执行器
    UGCS.Framework.Executor.Update()
    UGCS.Framework.Updator.Update()
end

--- 游戏刷新
---@param DeltaTime 时间戳
function Application:OnUpdate(DeltaTime)

end

--- 查看应用程序生命时刻
---@return 应用程序生命时刻
function Application:Watch()
    if self.TimeAxis.IsValid then
        return self.TimeAxis:Watch()
    end
end

return Application