--详情界面模块
local EquipmentDetailModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--升级配置
local UpgradeConfig = UGCS.Target.ArcherDuel.Config.UpgradeConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils
local TaskEvents = require("Game.Framework.Task.TaskEvents")

--点击装备详情界面
function EquipmentDetailModule:Open(Equipment)
    local EquipmentView = UIConfig.EquipmentView
    local DetailView = EquipmentView and EquipmentView.DetailView
    --显示详情界面
    UI:SetVisible({DetailView.ID}, true)

    --注册按钮事件
    UI:RegisterClicked(EquipmentView.DetailView.Close, function()
        EquipmentDetailModule:Close()
    end)

     --修改名字
     local EquipmentData = EquipmentConfig[Equipment.ID]
     UI:SetText({DetailView.Title}, EquipmentData.NickName)

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
    --升级提示
    local UpgradableTip = DetailView.UpgradableTip
    UI:SetVisible({UpgradableTip.ID, UpgradableTip.ProgressText}, true)
    UI:SetVisible({UpgradableTip.Icon}, false)
    --升级
    if Equipment.Unlock then
        --解锁
        if Equipment.Equipped then
            --已装备
            if Equipment.Level == 5 then
                --已装备已满级
                UI:SetVisible({DetailView.EquippedAndMaxLevel.ID},true)
            elseif CurrentPiece >= Upgrade.Piece then
                --已装备可升级
                UI:SetVisible({DetailView.EquippedAndUpgradable.ID, UpgradableTip.Icon},true)
            else
                --已装备不可升级
                UI:SetVisible({DetailView.EquippedAndNotUpgradable.ID},true)
            end
        else
            if Equipment.Level == 5 then
                --可装备已满级
                UI:SetVisible({DetailView.EquipableAndMaxLevel.ID},true)
            elseif CurrentPiece >= Upgrade.Piece then
                --可装备可升级
                UI:SetVisible({DetailView.EquipableAndUpgradable.ID, UpgradableTip.Icon},true)
            else
                --可装备不可升级
                UI:SetVisible({DetailView.EquipableAndNotUpgradable.ID},true)
            end
        end

    else
        --未解锁
        UI:SetVisible({ DetailView.NotEquipped.ID }, true)
    end
    UI:SetProgressMaxValue({UpgradableTip.Progress}, Upgrade.Piece)
    UI:SetProgressCurrentValue({UpgradableTip.Progress}, CurrentPiece)
    UI:SetText({UpgradableTip.ProgressText}, string.format("%d/%d", CurrentPiece, Upgrade.Piece))
    --装备品质底图
    GameUtils.SetImageWithAsset(DetailView.Background, "EquipmentImage", Attributes.Grade)
    --武器图标
    UI:SetText({ DetailView.WeaponIcon.Level }, string.format("等级%d", Equipment.Level))
    GameUtils.SetImageWithEquipment(DetailView.WeaponIcon.Icon, Equipment)

    --装备属性信息
    UI:SetVisible({DetailView.AttributeIcon.ID}, true)
    UI:SetVisible({
        DetailView.AttributeIcon.AttackPower,
        DetailView.AttributeIcon.HealthPoints,
        DetailView.AttributeIcon.Accuracy,
    }, false)
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
        --当前数值
        local Value = AttributeValue + (Attributes.Growth * (Equipment.Level - 1))
        --总数值
        local TotalValue = AttributeValue + 4 * Attributes.Growth
        local CurrentProgress = Value / TotalValue * 100
        local Growth = 0
        if Equipment.Level < 5 then
            Growth = Attributes.Growth
        end
        local NextProgress = (Value + Growth) / TotalValue * 100
        --当前属性
        UI:SetText({DetailView.CurrentAttribute}, tostring(Value))
        --强化属性
        UI:SetText({DetailView.EnhanceAttribute}, tostring(Value + Growth))
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
function EquipmentDetailModule:Close()
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

    --注销关闭按钮事件
    UI:UnRegisterClicked(EquipmentView.DetailView.Close)
end

--- 获取
---@param Equipment 装备
function EquipmentDetailModule:OnObtain(Equipment)
    --跳转到商城
    System:FireGameEvent(_GAME.Events.JumpModule, "Store", Equipment)
    self:Close()
end

--- 装备
---@param Equipment 装备
function EquipmentDetailModule:OnEquip(Equipment)
    --拿到已装备
    local LobbyModule = UGCS.Target.ArcherDuel.Modules.LobbyModule
    local BodyEquipment = LobbyModule.PlayerData.BodyEquipment
    local EquippedEquipment = BodyEquipment[Equipment.Category]
    if EquippedEquipment then
        --卸下装备
        EquippedEquipment.Equipped = false
    end
    Equipment.Equipped = true
    --刷新数据
    System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
    self:Close()
    --刷新UI
    local EquipmentModule = UGCS.Target.ArcherDuel.Modules.EquipmentModule
    EquipmentModule:RefreshUI(self.CurrentCategory)
end

--- 升级
---@param Equipment 装备
function EquipmentDetailModule:OnUpgrade(Equipment)
    local Attributes = EquipmentConfig[Equipment.ID].Attributes
    local Upgrade = UpgradeConfig[Attributes.Grade][Equipment.Level]
    if Upgrade then
        --扣除资产
        local LobbyModule = UGCS.Target.ArcherDuel.Modules.LobbyModule
        local BaseData = LobbyModule.PlayerData.BaseData
        if BaseData.Coin >= Upgrade.Coin then
            --扣除碎片
            Equipment.Piece = Equipment.Piece - Upgrade.Piece
            --升级
            Equipment.Level = Equipment.Level + 1
            BaseData.Coin = BaseData.Coin - Upgrade.Coin
            System:FireGameEvent(_GAME.Events.RefreshData, "GeneralResource")

            --刷新数据
            System:FireGameEvent(_GAME.Events.RefreshData, "EquipmentData")
            self:Open(Equipment)
            --刷新UI
            local EquipmentModule = UGCS.Target.ArcherDuel.Modules.EquipmentModule
            EquipmentModule:RefreshUI(self.CurrentCategory)

            --播放升级特效
            local EquipmentView = UIConfig.EquipmentView
            local DetailView = EquipmentView and EquipmentView.DetailView
            UI:SetVisible(DetailView.UpgradeEffect, false)
            UI:SetVisible(DetailView.UpgradeEffect, true)
            for _, EffectUI in ipairs(DetailView.UpgradeEffect) do
                UI:PlayUIAnimation(EffectUI, 1, 0)
            end

            if Equipment.Category == 1 then -- 角色
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.UpdateCharacter)
            elseif Equipment.Category == 2 then -- 上装
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.UpdateTop)
            elseif Equipment.Category == 3 then -- 下装
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.UpdateBottoms)
            elseif Equipment.Category == 4 then -- 弓箭
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.UpdateBow)
            elseif Equipment.Category == 5 then -- 投斧
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.UpdateAxe)
            elseif Equipment.Category == 6 then -- 投矛
                System:FireGameEvent(_GAME.Events.ExecuteTask, TaskEvents.UpdateSpear)
            end
        else
            --弹金币不够Tips，并跳转
            UI:ShowMessageTip("金币不够")
            self:OnObtain(Equipment)
        end
    end
end

return EquipmentDetailModule