--加载模块
local LoadingModule = {}
--- 打开
---@param Context 上下文【透传数据】
function LoadingModule:Open(Context)
    local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
    self.LoadingView = UIConfig and UIConfig.LoadingView
    if self.LoadingView  then
        UI:SetVisible({self.LoadingView.ID}, true)
        UI:SetProgressMaxValue({self.LoadingView.LoadProcess}, 100)
        UI:SetProgressCurrentValue({self.LoadingView.LoadProcess}, 0)
    end

    --暂时关闭外围UI
    UI:SetVisible({105217, 100570, 100528, 100531, 104219, 104220, 104792, 100599, 104495, 100571, 101101, 101845, 101850, 104205, 105662, 105710, 10567, 105671, 105674, 105670, 105675, 105664},false)
end

--- 刷新加载进度
function LoadingModule:Update(Progress)
    UI:SetProgressCurrentValue({self.LoadingView.LoadProcess}, 100*Progress)
end

--- 关闭
function LoadingModule:Close()
    if self.LoadingView then
        UI:SetVisible({self.LoadingView.ID}, false)
        self.LoadingView = nil
    end
end

return LoadingModule