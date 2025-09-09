--装备模块
local EquipmentModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local GearConfig = UGCS.Target.ArcherDuel.Config.GearConfig

--升级配置
local UpgradeConfig = {
    [1] = {
        [1] = 375,
        [2] = 845,
        [3] = 1435,
        [4] = 3875,
    },
    [2] = {
        [1] = 625,
        [2] = 1150,
        [3] = 2150,
        [4] = 4250,
    },
    [3] = {
        [1] = 1500,
        [2] = 3000,
        [3] = 5875,
        [4] = 7050,
    },
    [4] = {
        [1] = 2000,
        [2] = 4000,
        [3] = 6250,
        [4] = 8935,
    },
}

--- 打开
---@param PlayerData 玩家数据
function EquipmentModule:Open(PlayerData)
    local EquipmentView = UIConfig.EquipmentView
    local ListView = EquipmentView and EquipmentView.ListView
    --拿出全部装备
    local AllEquipment = PlayerData.AllEquipment
    local HasUseEquipment = PlayerData.HasUseEquipment
    local HasUseCount = #HasUseEquipment
    local UnUseEquipment = PlayerData.UnUseEquipment
    local UnUseCount = #UnUseEquipment
    local LockedEquipment = PlayerData.LockedEquipment

    --装备数据
    local ItemDataList = {}
    local Index = 1
    for _, _ in pairs(AllEquipment) do
        ItemDataList[Index] = { Index = Index }
        Index = Index + 1
    end

    --角色身上的装备
    local EquipmentSlotConfig = {
        [1] = EquipmentView.LeftView.Glasses,
        [2] = EquipmentView.LeftView.Coat,
        [3] = EquipmentView.LeftView.Hair,
        [4] = EquipmentView.RightView.Bow,
        [5] = EquipmentView.RightView.Axe,
        [6] = EquipmentView.RightView.Spear,
    }
    for _, Equipment in pairs(HasUseEquipment) do
        local EquipmentSlot = EquipmentSlotConfig[Equipment.Category]
        --设置等级
        UI:SetText({EquipmentSlot.Label}, string.format("等级%d", Equipment.Level))
        if Equipment.Level == 5 then
            --满级
            UI:SetVisible({EquipmentSlot.Progress}, false)
        else
            UI:SetVisible({EquipmentSlot.Progress}, true)
            --碎片相关
            local CurrentPiece = Equipment.Piece
            local Attributes = GearConfig[Equipment.ID].Attributes
            local UpgradePiece = UpgradeConfig[Attributes.Grade][Equipment.Level]
            UI:SetProgressMaxValue({EquipmentSlot.Progress}, UpgradePiece)
            UI:SetProgressCurrentValue({EquipmentSlot.Progress}, CurrentPiece)
        end
        --图标
        local ElementId = System:GetScriptParentID()
        local IconId = CustomProperty:GetCustomProperty(ElementId, "1", CustomProperty.PROPERTY_TYPE.Image)
        UI:SetImage({EquipmentSlot.Image}, IconId, true)
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
        elseif ItemDataIndex <= HasUseCount + UnUseCount then
            --未用的
            Equipment = UnUseEquipment[ItemDataIndex - HasUseCount]
        else
            --锁定的
            Equipment = LockedEquipment[ItemDataIndex - HasUseCount - UnUseCount]
            UI:SetImageColor({IconUI},"#595959")
        end
        --寄存到数据相
        ItemData.Equipment = Equipment

        local ShowItems, HideItems = {}, {}
        --解锁相关
        local LockUI = UI:GetListViewItemUID(ListViewID, ItemIndex, Item.Lock)
        if Equipment.Unlock then
            table.insert(HideItems, LockUI)
        else
            table.insert(ShowItems, LockUI)
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
        else
            --升级
            table.insert(HideItems, MaxLevelUI)
            table.insert(ShowItems, LevelUI)
            table.insert(ShowItems, ProgressUI)

            --设置等级
            UI:SetText({LevelUI}, string.format("等级%d", Equipment.Level))
            --碎片相关
            local CurrentPiece = Equipment.Piece
            local Attributes = GearConfig[Equipment.ID].Attributes
            local UpgradePiece = UpgradeConfig[Attributes.Grade][Equipment.Level]
            UI:SetProgressMaxValue({ProgressUI}, UpgradePiece)
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
        local ElementId = System:GetScriptParentID()
        local IconId = CustomProperty:GetCustomProperty(ElementId, "1", CustomProperty.PROPERTY_TYPE.Image)
        UI:SetImage({IconUI}, IconId, true)
        --UI显隐
        UI:SetTransparency(ShowItems, 1)
        UI:SetTransparency(HideItems, 0)
    end)
    --命中数据项回调
    UI:SetListViewItemSelectionChangeCall(TileView.ID, function(ListViewID, ItemIndex, ItemData, Select)
        -- 进行模拟点击
        if Select then
            if ItemData then
                -- 执行点击操作
                self.SelectTarget = ItemData
                --触发点击事件
                self:SelectEquipment(ItemData.Equipment)
            end
            UI:ClearListViewSelection(TileView.ID)
        end
    end)

    --注册按钮事件
    UI:RegisterPressed(EquipmentView.DetailView.Close, function()
        UI:SetVisible({EquipmentView.DetailView.ID}, false)
    end)
    for _, ItemView in pairs(EquipmentView.DetailView) do
        if type(ItemView) == "table" and ItemView.JumpButton then
            UI:RegisterPressed(ItemView.JumpButton, function()
                --跳转到商城
                System:FireGameEvent(_GAME.Events.JumpModule, "Store")
                --关掉详情页面
                UI:SetVisible({EquipmentView.DetailView.ID}, false)
            end)
        end
    end

    --寄存玩家数据
    self.PlayerData = PlayerData
end

--- 刷新
---@param DeltaTime 时间戳
function EquipmentModule:Update(DeltaTime)
    
end

--- 关闭
function EquipmentModule:Close()
    --清空列表
    local EquipmentView = UIConfig.EquipmentView
    local ListView = EquipmentView and EquipmentView.ListView
    UI:InitListView(ListView.TileView.ID, {})

    --注销事件
    UI:UnRegisterPressed(EquipmentView.DetailView.Close)
    for _, ItemView in pairs(EquipmentView.DetailView) do
        if type(ItemView) == "table" and ItemView.JumpButton then
            UI:UnRegisterPressed(ItemView.JumpButton)
        end
    end

    --清空玩家数据
    self.PlayerData = nil
end

--点击装备详情界面
function EquipmentModule:SelectEquipment(Equipment)
    local EquipmentView = UIConfig.EquipmentView
    local DetailView = EquipmentView and EquipmentView.DetailView
    --显示详情界面
    UI:SetVisible({DetailView.ID}, true)

     --修改名字
     local EquipmentData = GearConfig[Equipment.ID]
     UI:SetText({100558}, EquipmentData.TypeName)
     
     local CurrentPiece = Equipment.Piece
     local Attributes = GearConfig[Equipment.ID].Attributes
     local UpgradePiece = UpgradeConfig[Attributes.Grade][Equipment.Level]
    --弹窗类型
    if Equipment.Unlock == 1 then
        --解锁
        if Equipment.Equipped == 1 then
            --已装备
            if Equipment.Level == 5 then
                --已装备已满级
                UI:SetVisible({DetailView.EquippedAndMaxLevel.ID},true)
            elseif CurrentPiece >= UpgradePiece  then
                --已装备可升级
                UI:SetVisible({DetailView.EquippedAndUpgradable.ID, DetailView.UpgradableTip.ID},true)
                UI:SetProgressMaxValue({DetailView.UpgradableTip.Progress}, UpgradePiece)
                UI:SetProgressCurrentValue({DetailView.UpgradableTip.Progress}, CurrentPiece)
            else
                --已装备
                UI:SetVisible({DetailView.Equipped.ID},true)
            end
        else
            if Equipment.Level == 5 then
                --已有装备已满级
                UI:SetVisible({DetailView.OwnedAndMaxLevel.ID},true)
            elseif CurrentPiece >= UpgradePiece  then
                --已有装备可升级
                UI:SetVisible({DetailView.Upgradable.ID, DetailView.UpgradableTip.ID},true)
                UI:SetProgressMaxValue({DetailView.UpgradableTip.Progress}, UpgradePiece)
                UI:SetProgressCurrentValue({DetailView.UpgradableTip.Progress}, CurrentPiece)
            else
                --已有装备
                UI:SetVisible({DetailView.Owned.ID},true)
            end
        end
    else
        --未解锁
        UI:SetVisible({ DetailView.NotEquipped.ID }, true)
    end

    --武器图标
    UI:SetText({ DetailView.WeaponIcon.Level }, string.format("等级%d", Equipment.Level))
    local ElementId = System:GetScriptParentID()
    UI:SetImage({DetailView.WeaponIcon.Icon},CustomProperty:GetCustomProperty(ElementId, "1", CustomProperty.PROPERTY_TYPE.Image),true)

    --装备属性信息
    UI:SetVisible({DetailView.AttributeIcon.ID},true)
    if Equipment.Category == 1 or Equipment.Category == 4 or Equipment.Category == 5 or Equipment.Category == 6 then
        local num = Attributes.Attack + (Attributes.Growth*(Equipment.Level-1))
        UI:SetText({EquipmentView.CurrentAttribute},tostring(num))--设置攻击力
        UI:SetProgressCurrentValue({104178},(num/(Attributes.Attack + Attributes.Growth*(5 - Equipment.Level))*100))
        UI:SetProgressCurrentValue({104177},(num/(Attributes.Attack + Attributes.Growth*(4 - Equipment.Level))*100))
        UI:SetText({EquipmentView.EnhanceAttribute},tostring(num + Attributes.Growth))
        UI:SetVisible({DetailView.AttributeIcon.AttackPower},true)
    elseif Equipment.Category == 2 then
        local num =Attributes.Heal+ (Attributes.Growth*(Equipment.Level-1))
        UI:SetText({EquipmentView.CurrentAttribute},tostring(num))--设置生命值
        UI:SetProgressCurrentValue({104178},(num/(Attributes.Heal + Attributes.Growth*(5 - Equipment.Level)))*100)
        UI:SetProgressCurrentValue({104177},(num/(Attributes.Heal + Attributes.Growth*(4 - Equipment.Level)))*100)
        UI:SetText({EquipmentView.EnhanceAttribute},tostring(num + Attributes.Growth))
        UI:SetVisible({DetailView.AttributeIcon.AttributeIcon},true)
    else
        local num = Attributes.Accuracy+ (Attributes.Growth*(Equipment.Level-1))
        UI:SetText({EquipmentView.CurrentAttribute},tostring(num))--设置准确度
        UI:SetProgressCurrentValue({104178},(num/(Attributes.Accuracy + Attributes.Growth*(5 - Equipment.Level))*100))
        UI:SetProgressCurrentValue({104177},(num/(Attributes.Accuracy + Attributes.Growth*(4 - Equipment.Level))*100))
        UI:SetText({EquipmentView.EnhanceAttribute},tostring(num + Attributes.Growth))
        UI:SetVisible({DetailView.AttributeIcon.Accuracy},true)
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
end

return EquipmentModule