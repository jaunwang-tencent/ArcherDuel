--装备模块
local EquipmentModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--升级配置
local UpgradeConfig = UGCS.Target.ArcherDuel.Config.UpgradeConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
--装备详情模块
local EquipmentDetailModule = UGCS.Target.ArcherDuel.Modules.EquipmentDetailModule

--- 打开
---@param PlayerData 玩家数据
function EquipmentModule:Open(PlayerData)
    --寄存玩家数据
    self.PlayerData = PlayerData

    local EquipmentView = UIConfig.EquipmentView
    --过滤栏
    local ListView = EquipmentView and EquipmentView.ListView
    local TableBar = ListView and ListView.TableBar
    if TableBar then
        for _, Filter in pairs(TableBar) do
            if type(Filter) == "table" and Filter.Unselected then
                UI:RegisterClicked(Filter.Unselected, function()
                    if self.CurrentSelected then
                        UI:SetVisible({self.CurrentSelected}, false)
                    end
                    UI:SetVisible({Filter.Selected}, true)
                    self.CurrentSelected = Filter.Selected
                    self:RefreshUI(Filter.Category)
                end)
            end
        end
    end

    --刷新UI
    local AllTableBar = TableBar.All
    self.CurrentSelected = AllTableBar.Selected
    self:RefreshUI(AllTableBar.Category)
end

--- 刷新
---@param DeltaTime 时间戳
function EquipmentModule:Update(DeltaTime)
    
end

--- 关闭
function EquipmentModule:Close()
    self.CurrentSelected = nil
    self.CurrentCategory = nil
    --清空列表
    local EquipmentView = UIConfig.EquipmentView
    local ListView = EquipmentView and EquipmentView.ListView
    UI:InitListView(ListView.TileView.ID, {})

    --过滤栏
    local TableBar = ListView and ListView.TableBar
    if TableBar then
        for Type, Filter in pairs(TableBar) do
            if Filter.Selected and Type == "All" then
                UI:SetVisible({Filter.Selected}, true)
            else
                UI:SetVisible({Filter.Selected}, false)
            end
            if type(Filter) == "table" and Filter.Unselected then
                UI:UnRegisterClicked(Filter.Unselected)
            end
        end
    end

     --注销装备槽的点击事件
     local EquipmentSlotConfig = {
        [1] = EquipmentView.LeftView.Character,
        [2] = EquipmentView.LeftView.Top,
        [3] = EquipmentView.LeftView.Bottoms,
        [4] = EquipmentView.RightView.Bow,
        [5] = EquipmentView.RightView.Axe,
        [6] = EquipmentView.RightView.Spear,
    }
    for _, EquipmentSlot in ipairs(EquipmentSlotConfig) do
        --先注销点击事件
        UI:UnRegisterClicked(EquipmentSlot.Image)
    end

    --清空玩家数据
    self.PlayerData = nil
end

--- 刷新图标
---@param IconUI 图标资源
---@param EquipmentData 装备数据
function EquipmentModule:RefreshIcon2(IconUI, AssetName, AssetIndex)
    local ElementId = System:GetScriptParentID()
    local IconIdArray = CustomProperty:GetCustomPropertyArray(ElementId, AssetName, CustomProperty.PROPERTY_TYPE.Image)
    local IconId = IconIdArray[AssetIndex]
    UI:SetImage({IconUI}, IconId, true)
end

--- 刷新身体上的数据
function EquipmentModule:RegreshBodyUI()
    local EquipmentView = UIConfig.EquipmentView
    local PlayerData = self.PlayerData
    --角色身上的装备
    local EquipmentSlotConfig = {
        [1] = EquipmentView.LeftView.Character,
        [2] = EquipmentView.LeftView.Top,
        [3] = EquipmentView.LeftView.Bottoms,
        [4] = EquipmentView.RightView.Bow,
        [5] = EquipmentView.RightView.Axe,
        [6] = EquipmentView.RightView.Spear,
    }
    local BodyEquipment = PlayerData.BodyEquipment
    for Category, EquipmentSlot in ipairs(EquipmentSlotConfig) do
        --先注销点击事件
        UI:UnRegisterClicked(EquipmentSlot.Image)
        local Equipment = BodyEquipment[Category]
        if Equipment then
            --点击装备事件
            UI:RegisterClicked(EquipmentSlot.Image, function()
                EquipmentDetailModule:Open(Equipment)
            end)
            --设置等级
            UI:SetText({EquipmentSlot.Label}, string.format("等级%d", Equipment.Level))
            if Equipment.Level == 5 then
                --满级
                UI:SetVisible({EquipmentSlot.Progress}, false)
            else
                UI:SetVisible({EquipmentSlot.Progress}, true)
                --碎片相关
                local CurrentPiece = Equipment.Piece
                local Attributes = EquipmentConfig[Equipment.ID].Attributes
                local Upgrade = UpgradeConfig[Attributes.Grade][Equipment.Level]
                UI:SetProgressMaxValue({EquipmentSlot.Progress}, Upgrade.Piece)
                UI:SetProgressCurrentValue({EquipmentSlot.Progress}, CurrentPiece)
                UI:SetText({EquipmentSlot.ProgressText}, string.format("%d/%d", CurrentPiece, Upgrade.Piece))
            end
            --图标
            GameUtils.RefreshIconWithEquipment(EquipmentSlot.Image, Equipment)
            UI:SetVisible({EquipmentSlot.EmptyImage}, false)
        else
            --没有装备则清空
            UI:SetVisible({EquipmentSlot.Label, EquipmentSlot.Progress, EquipmentSlot.Image}, false)
            UI:SetVisible({EquipmentSlot.EmptyImage}, true)
        end
    end
end

--- 刷新列表UI
---@param Category 装备种类
function EquipmentModule:RefreshListUI(Category)
    local EquipmentView = UIConfig.EquipmentView
    local ListView = EquipmentView and EquipmentView.ListView
    local PlayerData = self.PlayerData

    --装备列表
    --拿出全部装备
    local EquipmentGroup
    if Category then
        EquipmentGroup = PlayerData.GroupByCategory[Category]
    end
    if not EquipmentGroup then
        EquipmentGroup = PlayerData.AllEquipment
    end
    --未解锁装备
    local LockedEquipment = {}
    --已装备
    local HasUseEquipment = {}
    --未装备
    local NotUseEquipment = {}
    for _, Equipment in pairs(EquipmentGroup) do
        if Equipment.Equipped then
            --已装备
            table.insert(HasUseEquipment, Equipment)
        else
            --未装备
            if Equipment.Unlock then
                --已解锁
                table.insert(NotUseEquipment, Equipment)
            else
                --未解锁
                table.insert(LockedEquipment, Equipment)
            end
        end
    end
    local HasUseCount = #HasUseEquipment
    local NotUseCount = #NotUseEquipment

    --装备数据
    local ItemDataList = {}
    local Index = 1
    for _, _ in pairs(EquipmentGroup) do
        ItemDataList[Index] = { Index = Index }
        Index = Index + 1
    end

    --初始化列表
    local TileView = ListView.TileView
    local Item = TileView.Item
    UI:InitListView(TileView.ID, ItemDataList)
    --设置数据项回调
    UI:SetListViewItemSetCall(TileView.ID, function(ListViewID, ItemIndex, ItemData, Select)
        local IconUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Icon)
        local Equipment
        local ItemDataIndex = ItemData.Index
        local BackgroundUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Background)
        if ItemDataIndex <= HasUseCount then
            --已用的
            Equipment = HasUseEquipment[ItemDataIndex]
        elseif ItemDataIndex <= HasUseCount + NotUseCount then
            --未用的
            Equipment = NotUseEquipment[ItemDataIndex - HasUseCount]
        else
            --锁定的
            Equipment = LockedEquipment[ItemDataIndex - HasUseCount - NotUseCount]
            UI:SetImageColor({IconUI, BackgroundUI},"#595959")
        end
        --寄存到数据相
        ItemData.Equipment = Equipment

        local ShowItems, HideItems = {}, {}
        --解锁相关
        local LockUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Lock)
        local UpgradableUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Upgradable)
        if Equipment.Unlock then
            table.insert(HideItems, LockUI)
        else
            table.insert(ShowItems, LockUI)
        end
        --等级相关
        local MaxLevelUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.MaxLevel)
        local LevelUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Level)
        local ProgressUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Progress)
        local ProgressTextUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.ProgressText)
        local Attributes = EquipmentConfig[Equipment.ID].Attributes
        if Equipment.Level == 5 then
            --满级
            table.insert(ShowItems, MaxLevelUI)
            table.insert(HideItems, LevelUI)
            table.insert(HideItems, ProgressUI)
            table.insert(HideItems, ProgressTextUI)
            table.insert(HideItems, UpgradableUI)
        else
            --升级
            table.insert(HideItems, MaxLevelUI)
            table.insert(ShowItems, LevelUI)
            table.insert(ShowItems, ProgressUI)
            table.insert(ShowItems, ProgressTextUI)

            local CurrentPiece = Equipment.Piece
            local Upgrade = UpgradeConfig[Attributes.Grade][Equipment.Level]
            if Equipment.Unlock and CurrentPiece >= Upgrade.Piece then
                table.insert(ShowItems, UpgradableUI)
            else
                table.insert(HideItems, UpgradableUI)
            end
            --碎片相关
            UI:SetProgressMaxValue({ProgressUI}, Upgrade.Piece)
            UI:SetProgressCurrentValue({ProgressUI}, CurrentPiece)
            UI:SetText({ProgressTextUI}, string.format("%d/%d", CurrentPiece, Upgrade.Piece))
        end
        --设置品质
        GameUtils.RefreshIconWithAsset(BackgroundUI, "EquipmentImage", Attributes.Grade)
        --设置等级
        UI:SetText({LevelUI}, string.format("等级%d", Equipment.Level))
        --是否已装备
        local EquippedUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Equipped)
        if Equipment.Equipped then
            table.insert(ShowItems, EquippedUI)
        else
            table.insert(HideItems, EquippedUI)
        end
        --图标
        GameUtils.RefreshIconWithEquipment(IconUI, Equipment)
        --UI显隐
        UI:SetTransparency(ShowItems, 1)
        UI:SetTransparency(HideItems, 0)
    end)
    --命中数据项回调
    UI:SetListViewItemSelectionChangeCall(TileView.ID, function(ListViewID, ItemIndex, ItemData, Select)
        -- 进行模拟点击
        if Select then
            local ItemUI = UI:GetListViewItemUID(ListViewID, ItemIndex, TileView.Item.ID)
            if ItemData and ItemUI then
                --执行点击操作
                self.SelectTarget = ItemData
                --打开详情页面
                EquipmentDetailModule:Open(ItemData.Equipment)
            end
            UI:ClearListViewSelection(TileView.ID)
        end
    end)

    --记录当前种类
    self.CurrentCategory = Category
end

--- 刷新全部
---@param Category 装备种类
function EquipmentModule:RefreshUI(Category)
    if self.PlayerData then
        self:RegreshBodyUI()
        self:RefreshListUI(Category)
    end
end

return EquipmentModule