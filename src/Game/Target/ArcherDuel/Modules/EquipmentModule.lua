--装备模块
local EquipmentModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig

--升级配置
local UpgradeConfig = UGCS.Target.ArcherDuel.Config.UpgradeConfig

--- 打开
---@param PlayerData 玩家数据
function EquipmentModule:Open(PlayerData)
    --寄存玩家数据
    self.PlayerData = PlayerData

    local EquipmentView = UIConfig.EquipmentView
    --注册按钮事件
    UI:RegisterPressed(EquipmentView.DetailView.Close, function()
        self:CloseDetailView()
    end)
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
    --注销关闭按钮事件
    UI:UnRegisterPressed(EquipmentView.DetailView.Close)

    --清空玩家数据
    self.PlayerData = nil
end

--- 刷新图标
---@param IconUI 图标资源
---@param Index 图标索引
function EquipmentModule:RefreshIcon(IconUI, Equipment)
    local EquipmentData = EquipmentConfig[Equipment.ID]
    local AssetName = EquipmentData.AssetName or "weapon_icon"
    local AssetIndex = EquipmentData.AssetIndex or EquipmentData.ID
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
    for Category, EquipmentSlot in pairs(EquipmentSlotConfig) do
        local Equipment = BodyEquipment[Category]
        if Equipment then
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
            end
            --图标
            self:RefreshIcon(EquipmentSlot.Image, Equipment)
        else
            --没有装备则清空
            UI:SetVisible({EquipmentSlot.Label, EquipmentSlot.Progress, EquipmentSlot.Image}, false)
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
        if ItemDataIndex <= HasUseCount then
            --已用的
            Equipment = HasUseEquipment[ItemDataIndex]
        elseif ItemDataIndex <= HasUseCount + NotUseCount then
            --未用的
            Equipment = NotUseEquipment[ItemDataIndex - HasUseCount]
        else
            --锁定的
            Equipment = LockedEquipment[ItemDataIndex - HasUseCount - NotUseCount]
            UI:SetImageColor({IconUI},"#595959")
        end
        --寄存到数据相
        ItemData.Equipment = Equipment

        local ShowItems, HideItems = {}, {}
        --解锁相关
        local LockUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Lock)
        local UpgradableUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Upgradable)
        local NeedUpgrade = true
        if Equipment.Unlock then
            table.insert(HideItems, LockUI)
        else
            table.insert(ShowItems, LockUI)
            table.insert(HideItems, UpgradableUI)
            NeedUpgrade = false
        end
        --等级相关
        local MaxLevelUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.MaxLevel)
        local LevelUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Level)
        local ProgressUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Progress)
        if Equipment.Level == 5 then
            --满级
            table.insert(ShowItems, MaxLevelUI)
            table.insert(HideItems, LevelUI)
            table.insert(HideItems, ProgressUI)
            table.insert(HideItems, UpgradableUI)
        else
            --升级
            table.insert(HideItems, MaxLevelUI)
            table.insert(ShowItems, LevelUI)
            table.insert(ShowItems, ProgressUI)
            if NeedUpgrade then
                table.insert(ShowItems, UpgradableUI)
            end

            --设置等级
            UI:SetText({LevelUI}, string.format("等级%d", Equipment.Level))
            --碎片相关
            local CurrentPiece = Equipment.Piece
            local Attributes = EquipmentConfig[Equipment.ID].Attributes
            local Upgrade = UpgradeConfig[Attributes.Grade][Equipment.Level]
            UI:SetProgressMaxValue({ProgressUI}, Upgrade.Piece)
            UI:SetProgressCurrentValue({ProgressUI}, CurrentPiece)
        end
        --是否已装备
        local EquippedUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Equipped)
        if Equipment.Equipped then
            table.insert(ShowItems, EquippedUI)
        else
            table.insert(HideItems, EquippedUI)
        end
        --图标
        self:RefreshIcon(IconUI, Equipment)
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
                self:OpenDetailView(ItemData.Equipment)
            end
            UI:ClearListViewSelection(TileView.ID)
        end
    end)
end

--- 刷新全部
---@param Category 装备种类
function EquipmentModule:RefreshUI(Category)
    self:RegreshBodyUI()
    self:RefreshListUI(Category)
end

--点击装备详情界面
function EquipmentModule:OpenDetailView(Equipment)
    local EquipmentView = UIConfig.EquipmentView
    local DetailView = EquipmentView and EquipmentView.DetailView
    --显示详情界面
    UI:SetVisible({DetailView.ID}, true)

     --修改名字
     local EquipmentData = EquipmentConfig[Equipment.ID]
     UI:SetText({100558}, EquipmentData.NickName)

     local CurrentPiece = Equipment.Piece
     local Attributes = EquipmentConfig[Equipment.ID].Attributes
     local Upgrade = UpgradeConfig[Attributes.Grade][Equipment.Level]
     UI:SetVisible({
        DetailView.EquippedAndMaxLevel.ID,
        DetailView.EquippedAndUpgradable.ID,
        DetailView.EquippedAndNotUpgradable.ID,
        DetailView.EquipableAndMaxLevel.ID,
        DetailView.EquipableAndUpgradable.ID,
        DetailView.EquipableAndNotUpgradable.ID,
        DetailView.NotEquipped.ID,
        DetailView.UpgradableTip.ID,
    }, false)
    --弹窗类型
    if Equipment.Unlock then
        --解锁
        if Equipment.Equipped then
            --已装备
            if Equipment.Level == 5 then
                --已装备已满级
                UI:SetVisible({DetailView.EquippedAndMaxLevel.ID},true)
            elseif CurrentPiece >= Upgrade.Piece  then
                --已装备可升级
                UI:SetVisible({DetailView.EquippedAndUpgradable.ID, DetailView.UpgradableTip.ID},true)
                UI:SetProgressMaxValue({DetailView.UpgradableTip.Progress}, Upgrade.Piece)
                UI:SetProgressCurrentValue({DetailView.UpgradableTip.Progress}, CurrentPiece)
            else
                --已装备不可升级
                UI:SetVisible({DetailView.EquippedAndNotUpgradable.ID},true)
            end
        else
            if Equipment.Level == 5 then
                --可装备已满级
                UI:SetVisible({DetailView.EquipableAndMaxLevel.ID},true)
            elseif CurrentPiece >= Upgrade.Piece  then
                --可装备可升级
                UI:SetVisible({DetailView.EquipableAndUpgradable.ID, DetailView.UpgradableTip.ID},true)
                UI:SetProgressMaxValue({DetailView.UpgradableTip.Progress}, Upgrade.Piece)
                UI:SetProgressCurrentValue({DetailView.UpgradableTip.Progress}, CurrentPiece)
            else
                --可装备不可升级
                UI:SetVisible({DetailView.EquipableAndNotUpgradable.ID},true)
            end
        end
    else
        --未解锁
        UI:SetVisible({ DetailView.NotEquipped.ID }, true)
    end

    --武器图标
    UI:SetText({ DetailView.WeaponIcon.Level }, string.format("等级%d", Equipment.Level))
    self:RefreshIcon(DetailView.WeaponIcon.Icon, Equipment)

    --装备属性信息
    UI:SetVisible({DetailView.AttributeIcon.ID}, true)
    UI:SetVisible({
        DetailView.AttributeIcon.AttackPower,
        DetailView.AttributeIcon.HealthPoints,
        DetailView.AttributeIcon.Accuracy,
    },false)
    local AttributeValue, AttributeLabel
    if Attributes.Attack > 0 then
        --攻击
        AttributeValue = Attributes.Attack
        AttributeLabel = DetailView.AttributeIcon.AttackPower
    elseif Attributes.Heal > 0 then
        --防护
        AttributeValue = Attributes.Heal
        AttributeLabel = DetailView.AttributeIcon.HealthPoints
    elseif Attributes.Accuracy > 0 then
        --准度
        AttributeValue = Attributes.Accuracy
        AttributeLabel = DetailView.AttributeIcon.Accuracy
    end
    if AttributeValue and AttributeLabel then
        local Value = AttributeValue + (Attributes.Growth * (Equipment.Level - 1))
        local CurrentProgress = Value / (AttributeValue + Attributes.Growth * (5 - Equipment.Level)) *100
        local NextProgress = Value / (AttributeValue + Attributes.Growth* (4 - Equipment.Level)) * 100
        --当前属性
        UI:SetText({EquipmentView.CurrentAttribute}, tostring(Value))
        --强化属性
        UI:SetText({EquipmentView.EnhanceAttribute}, tostring(Value + Attributes.Growth))
        --当前进度
        UI:SetProgressCurrentValue({DetailView.UpgradeProgress.Current}, CurrentProgress)
        --下一进度
        UI:SetProgressCurrentValue({DetailView.UpgradeProgress.Next}, NextProgress)
        UI:SetVisible({AttributeLabel},true)
    end

    if Attributes.HeadShotIncrease ~= 0 then
        UI:SetVisible({DetailView.AttributeInfo.ID},true)
        UI:SetText({DetailView.AttributeInfo.Describe},"头部额外增伤")
        UI:SetText({DetailView.AttributeInfo.Value}, Attributes.HeadShotIncrease.."%")
    elseif Attributes.BodyShotIncrease ~= 0 then
        UI:SetVisible({DetailView.AttributeInfo.ID},true)
        UI:SetText({DetailView.AttributeInfo.Describe},"躯干额外增伤")
        UI:SetText({DetailView.AttributeInfo.Value}, Attributes.BodyShotIncrease.."%")
    elseif Attributes.HeadShotReduction ~= 0 then
        UI:SetVisible({DetailView.AttributeInfo.ID},true)
        UI:SetText({DetailView.AttributeInfo.Describe},"头部额外减伤")
        UI:SetText({DetailView.AttributeInfo.Value}, Attributes.HeadShotReduction.."%")
    elseif Attributes.BodyShotReduction ~= 0 then
        UI:SetVisible({DetailView.AttributeInfo.ID},true)
        UI:SetText({DetailView.AttributeInfo.Describe},"躯干额外减伤")
        UI:SetText({DetailView.AttributeInfo.Value}, Attributes.BodyShotReduction.."%")
    elseif Attributes.DamageReduction ~= 0 then
        UI:SetVisible({DetailView.AttributeInfo.ID},true)
        UI:SetText({DetailView.AttributeInfo.Describe},"伤害减免")
        UI:SetText({DetailView.AttributeInfo.Value}, Attributes.DamageReduction.."%")
    end

    --【其它信息，待填充】

    --注册详情页面上的按钮事件
    for _, ItemView in pairs(EquipmentView.DetailView) do
        if type(ItemView) == "table" then
            if ItemView.JumpButton then
                --跳转按钮
                UI:RegisterClicked(ItemView.JumpButton, function()
                    self:OnObtain(Equipment)
                end)
            end
            if ItemView.MaxLevelButton then
                --已满级按钮，啥都不做，用于截获点击事件
                UI:RegisterClicked(ItemView.MaxLevelButton, function() end)
            end
            if ItemView.EquippedButton then
                --已装备按钮，啥都不做，用于截获点击事件
                UI:RegisterClicked(ItemView.EquippedButton, function() end)
            end
            if ItemView.EquipableButton then
                --可装备按钮
                UI:RegisterClicked(ItemView.EquipableButton, function()
                    self:OnEquip(Equipment)
                end)
            end
            if ItemView.UpgradeButton then
                --可升级按钮
                UI:RegisterClicked(ItemView.UpgradeButton, function()
                    self:OnUpgrade(Equipment)
                end)
            end
        end
    end
end

--- 关闭详情页面
function EquipmentModule:CloseDetailView()
    --关掉详情页面
    local EquipmentView = UIConfig.EquipmentView
    UI:SetVisible({EquipmentView.DetailView.ID}, false)

    --注销详情页面上的按钮事件
    for _, ItemView in pairs(EquipmentView.DetailView) do
        if type(ItemView) == "table" then
            if ItemView.JumpButton then
                UI:UnRegisterClicked(ItemView.JumpButton)
            end
            if ItemView.MaxLevelButton then
                UI:UnRegisterClicked(ItemView.MaxLevelButton)
            end
            if ItemView.EquippedButton then
                UI:UnRegisterClicked(ItemView.EquippedButton)
            end
            if ItemView.EquipableButton then
                UI:UnRegisterClicked(ItemView.EquipableButton)
            end
            if ItemView.UpgradeButton then
                UI:UnRegisterClicked(ItemView.UpgradeButton)
            end
        end
    end
end

--- 获取
---@param Equipment 装备
function EquipmentModule:OnObtain(Equipment)
    --跳转到商城
    System:FireGameEvent(_GAME.Events.JumpModule, "Store", Equipment)
    self:CloseDetailView()
end

--- 装备
---@param Equipment 装备
function EquipmentModule:OnEquip(Equipment)
    --拿到已装备
    local BodyEquipment = self.PlayerData.BodyEquipment
    local EquippedEquipment = BodyEquipment[Equipment.Category]
    if EquippedEquipment then
        --卸下装备
        EquippedEquipment.Equipped = false
    end
    Equipment.Equipped = true
    --刷新数据
    System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
    self:CloseDetailView()
    --刷新UI
    self:RefreshUI()
end

--- 升级
---@param Equipment 装备
function EquipmentModule:OnUpgrade(Equipment)
    local Attributes = EquipmentConfig[Equipment.ID].Attributes
    local Upgrade = UpgradeConfig[Attributes.Grade][Equipment.Level]
    --扣除碎片
    Equipment.Piece = Equipment.Piece - Upgrade.Piece
    --升级
    Equipment.Level = Equipment.Level + 1
    --扣除资产
    local BaseData = self.PlayerData.BaseData
    BaseData.Diamond = BaseData.Diamond - Upgrade.Diamond
    System:FireGameEvent(_GAME.Events.RefreshData, "GeneralResource")

    --刷新数据
    System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
    self:CloseDetailView()
    --刷新UI
    self:RefreshUI()
end

return EquipmentModule