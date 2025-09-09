--战斗模块
local LobbyModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local GearConfig = UGCS.Target.ArcherDuel.Config.GearConfig

--- 打开
---@param Context 上下文【透传数据】
function LobbyModule:Open(Context)
    self:PerformLoading()
    self:CharacterStandby()
    self:LoadData()
    self:InitView()
    --跳转商城
    System:RegisterGameEvent(_GAME.Events.JumpStore, function()
        self:SwitchView("Store")
    end)
end

--- 刷新
---@param DeltaTime 时间戳
function LobbyModule:Update(DeltaTime)
    
end

--- 关闭
function LobbyModule:Close()

end

--- 加载表演
function LobbyModule:PerformLoading()
    UGCS.Target.ArcherDuel.Modules.LoadingModule:Open()
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
end

--- 角色站街，TODO：换成假人，装备穿戴
function LobbyModule:CharacterStandby()
    --设置角色位置
    TimerManager:AddTimer(0.5,function ()
        Character:SetPosition(Character:GetLocalPlayerId(), Engine.Vector(-609.84,0,124.2))
        Character:SetRotation(Character:GetLocalPlayerId(), Engine.Vector(0,0,-90))
    end)

    --本地角色
    self.PlayerID =  Character:GetLocalPlayerId()
    TimerManager:AddTimer(1,function ()
        System:FireSignEvent("启动相机",{Character:GetLocalPlayerId()})
    end)

    --获取头像
    UI:SetImage({100470},Chat:GetCustomHeadIcon(self.PlayerID))
end

--- 加载玩家数据
function LobbyModule:LoadData()
    --存档配置
    local ArchiveConfig = {
        "Equipped_Bow_Num",
        "Equipped_Spear_Num",
        "Equipped_Axe_Num",
        "Equipped_Hat_Num",
        "Equipped_Glasses_Num",
        "Equipped_Cloth_Num",
        "Equipped_Bow_Lv",
        "Equipped_Spear_Lv",
        "Equipped_Axe_Lv",
        "Equipped_Hat_Lv",
        "Equipped_Glasses_Lv",
        "Equipped_Cloth_Lv",
        "Coin",
        "Diamond",
        "Rank",
        "Daily_Progress",
        "Player_BattlePoints_Num",
    }
    --玩家数据
    self.PlayerData = {}
    --加载基础数据
    for Index, ArchiveKey in ipairs(ArchiveConfig) do
        local Data
        if Archive:HasPlayerData(self.PlayerID, Archive.TYPE.Number, ArchiveKey) then
            Data = Archive:GetPlayerData(self.PlayerID, Archive.TYPE.Number, ArchiveKey)
        else
            if Index == 2 or Index == 3 or Index == 8 or Index == 9 then
                Data = 0
            else
                Data = 1
            end
            Archive:SetPlayerData(self.PlayerID, Archive.TYPE.Number, ArchiveKey, Data)
        end
        self.PlayerData[ArchiveKey] = Data
    end

    --1、加载所有装备
    local AllEquipment
    if Archive:HasPlayerData(self.PlayerID, Archive.TYPE.String, "Owned_Equipped_Table") then
        --这里读取玩家的装备 --并进行排序
        local Owned_Equipped_Table = Archive:GetPlayerData(self.PlayerID, Archive.TYPE.String, "Owned_Equipped_Table")
        --文字转为组
        AllEquipment = MiscService:JsonStr2Table(Owned_Equipped_Table)
    else
        AllEquipment = {}
        local InitEquippedID = { [1] = true, [15] = true, [38] = true, [61] = true }
        for ID, Data in pairs(GearConfig) do
            local HasInit = InitEquippedID[ID]
            local Equipment = {
                ID = ID,                        --装备编号ID
                Level = 1,                      --装备等级
                Piece = 0,                      --碎片数量
                Category = Data.Category,       --装备类别
                Unlock = HasInit,               --是否解锁
                Equipped = HasInit,             --是否装备
            }
            if HasInit then
                Equipment.Piece = 35
                Equipment.Level = 3
            end
            AllEquipment[ID] = Equipment
        end
    end
    self.PlayerData.AllEquipment = AllEquipment

    --2、装备数据
    --未解锁装备
    local LockedEquipment = {}
    --已使用装备
    local HasUseEquipment = {}
    --未使用装备
    local UnUseEquipment = {}
    --按类型分组且品质降序
    local GroupByCategory = {}
    for _, Equipment in pairs(AllEquipment) do
        --按种类分类
        local Group = GroupByCategory[Equipment.Category]
        if not Group then
            Group = {}
            GroupByCategory[Equipment.Category] = Group
        end
        table.insert(Group, Equipment)

        if not Equipment.Unlock and Equipment.Piece > 0 then
            --没有解锁，则解锁，并消耗一个
            Equipment.Unlock = true
            Equipment.Piece = Equipment.Piece - 1
        end
        if Equipment.Equipped then
            --已装备
            table.insert(HasUseEquipment, Equipment)
        else
            --未装备
            if Equipment.Unlock then
                --已解锁
                table.insert(UnUseEquipment, Equipment)
            else
                --未解锁
                table.insert(LockedEquipment, Equipment)
            end
        end
    end
    --按品质排序
    for _, Group in pairs(GroupByCategory) do
        table.sort(Group, function(lhs, rhs)
            local LHSA = GearConfig[lhs.ID].Attributes
            local RHSA = GearConfig[rhs.ID].Attributes
            return LHSA.Grade < RHSA.Grade
        end)
    end
    self.PlayerData.LockedEquipment = LockedEquipment
    self.PlayerData.HasUseEquipment = HasUseEquipment
    self.PlayerData.UnUseEquipment = UnUseEquipment
    self.PlayerData.GroupByCategory = GroupByCategory

    --3、存储数据
    local Owned_Equipped_Table = MiscService:Table2JsonStr(AllEquipment)
    Archive:SetPlayerData(self.PlayerID, Archive.TYPE.String, "Owned_Equipped_Table", Owned_Equipped_Table)
end

--- 初始化视图
function LobbyModule:InitView()
    --菜单栏
    local TitleBar = UIConfig.MainView.TitleBar
    --打开主菜单
    UI:SetVisible({TitleBar.ID}, true)

    --注册菜单事件
    for ViewName, ViewData in pairs(TitleBar) do
        if type(ViewData) == "table" and ViewData.Unselected then
            UI:RegisterPressed(ViewData.Unselected, function()
                self:SwitchView(ViewName)
            end)
        end
    end

    --切换到主视图
    self:SwitchView("Fight")
end

function LobbyModule:SwitchView(ViewName)
    local TitleBar = UIConfig.MainView.TitleBar
    local ViewData = TitleBar[ViewName]
    --关闭上一页面
    if self.CurrentViewData then
        UI:SetVisible({self.CurrentViewData.Selected}, false)
        UI:SetVisible(self.CurrentViewData.ViewItems, false)
    end

    --打开当前页面
    if ViewData then
        UI:SetVisible({ViewData.Selected},true)
        UI:SetVisible(ViewData.ViewItems, true)
    end

    --记录当前视图数据
    self.CurrentViewData = ViewData

    --子类化操作
    self:OnSwitchView(ViewName)
end

function LobbyModule:OnSwitchView(ViewName)
    if self.CurrentModule then
        self.CurrentModule:Close()
        self.CurrentModule = nil
    end
    local TargetModule
    if ViewName == "Task" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.TaskModule
    elseif ViewName == "Equipment" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.EquipmentModule
    elseif ViewName == "Fight" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.FightModule
    elseif ViewName == "Store" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.StoreModule
    elseif ViewName == "Tournament" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.TournamentModule
    end
    if TargetModule then
        TargetModule:Open(self.PlayerData)
        self.CurrentModule = TargetModule
    end
end






---------------------------------------以下是待整合代码---------------------------------------
local qiriTAB = {101111,105203,105204,105205,105206,105207,105208}
local qirijiangli = {101317,105092,105114,105136,105158,105180,105202   }
local qiriTAB_anxia = {105209,105210,105211,105212,105213,105214,105215}
local TongyongTAB = {100523,100522,100526,100524,100525}
local TongyongTAB_anxia ={103769,103771,103773,103775,103777}
local zhuangbei_hd = {100506,100507,100508,100509}  -- 主页装备按钮
local zhuangbei_zb = {100534,100535,100536,100539}
local zhuangbei_tab = {110756,110757,110758,110759,110760,110761,110762}
local zhuangbei_tab_anxia ={104035,104036,104037,104038,104039,104040,104041}
local TAB_BG = {103876,104110,}
local VS_tab = {106561,106560,106559}
local VS_tab_anxia = {106563,106564,106565}
local VS_yemian = {106605,106518,107540}
local VS_Diamond_Ranking = {107535,107725,107734,107753} -- 钻石排名排行榜滑动页面添加的值
local Shop_Gap =  {}  --商店页面分隔栏
local Shop_Gap_All = {} -- 商店页面分隔栏所有UI
local Task_Gap = {} -- 任务页面分隔栏
local Task_Gap_All = {} -- 任务页面分隔栏所有UI
local VS_Diamond_Ranking_Gap = {} -- 砖石排行滑动页面分隔栏
local VS_Diamond_Ranking_All = {} -- 钻石排行添加的所有UI包括分割栏
local zhuye = {104220,104219,106516,101121}
local renwu = {100599}
local shangdiandaoju = {110329,110360,110250,110260,110319}
local Task = {110369,110375,110381,110387,110393,110399,110405,110411,110417,110423,110429,110435,110441,110447,110453,110459,110465}
local Task_Click = {110367, 110372, 110378, 110384, 110390, 110396, 110402, 110408, 110414, 110420, 110426, 110432, 110438, 110444, 110450, 110456, 110462}
local Task_Go = {110368,110373,110379,110385,110391,110397,110403,110409,110415,110421,110427,110433,110439,110445,110451,110457,110463}
local Task_over = {110486,110481,110480,110479,110478,110477,110476,110475,110474,110473,110472,110471,110470,110469,110468,110467,110466}
local Task_BG = {110364, 110370, 110376, 110382, 110388, 110394, 110400, 110406, 110412, 110418, 110424, 110430, 110436, 110442, 110448, 110454, 110460}
local Task_TXT = {
    [10] = {
        [1] = {TXT={"登录游戏"},
            Num = 1,},
        [2] = {TXT={"赢得一场比赛","赢得500元","命中头部","完成一局比赛"},
            Num = 1,},
        [3] = {TXT={"使用弓赢得1场比赛","使用投矛赢得1场比赛","使用投斧赢得1场比赛"},
            Num = 1,},
        [4] = {TXT={"领取免费的金钱"},
            Num = 1,},
        [5] = {TXT={"升级弓箭","升级投矛","升级投斧","升级上衣","升级角色","升级下装"},
            Num = 1,},
    },
    [15] ={
        [1] = {TXT={"连续赢得三场比赛","完成5场比赛","命中头部三次","赢得1000快","赢得三场比赛胜利"},
            Num = 2,},
        [2] = {TXT={"使用弓赢得2场比赛"},
            Num = 1,},
        [3] = {TXT={"使用长矛赢得2场比赛","使用投斧赢得2场比赛","在2次攻击内击败敌人"},
            Num = 2,},
        [4] = {TXT={"以60%或更高的血量获胜"},
            Num = 1,},},
    [20] = {
        [1] = {TXT={"命中头部5次","赢得1500快","完成10场比赛","五次胜利","连续赢得4场比赛"},
            Num = 3,},
        [2] = {TXT={"使用弓箭赢得3场比赛"},
            Num = 1,},
        [3] = {TXT={"使用长矛赢得3场比赛","使用投斧赢得3场比赛","以80%或更高的血量获胜","在不受到伤害的情况下赢得比赛"},
            Num = 2,},
        },
}

local currency = { 100528 }
local zhuangbei = {104495,104496,100571}
local jinbiaosai = {106562,106518}
local shangdian = {110208}
local TAB = {100531}
local Level_Shard = {1,3,5,7,9999} --每一级需要多少碎片升级
local Level_Diamond = {0,10000,10000,10000,10000}
local zhengtitabyemian = {renwu,zhuangbei,zhuye,shangdian,jinbiaosai}
local Storage_string = {"Equipped_Bow_Num","Equipped_Spear_Num","Equipped_Axe_Num","Equipped_Hat_Num","Equipped_Glasses_Num","Equipped_Cloth_Num","Equipped_Bow_Lv","Equipped_Spear_Lv","Equipped_Axe_Lv","Equipped_Hat_Lv","Equipped_Glasses_Lv","Equipped_Cloth_Lv"} -- 弓箭 ， 投矛 ，  投斧 ， 帽子 ， 眼镜 ，  衣服 
local Table_NotOwned_Equipped = {} -- 未拥有的装备
local GearStorage = UGCS.Target.ArcherDuel.Config.GearConfig
local CategoryNum = {14,23,23,16,16,16} -- 每个装备组的数量
local CategoryNum_1 = CategoryNum[1] + CategoryNum[2] + CategoryNum[3] + CategoryNum[4] + CategoryNum[5] + CategoryNum[6]
local Table_Category = {
{}, --弓箭
{}, --投矛
{}, --投斧
{}, --帽子--角色
{}, --眼镜--下装
{} ,--衣服--上装
}--各个装备组
local Table_NotCategory = {
{}, --弓箭
{}, --投矛
{}, --投斧
{}, --帽子--角色
{}, --眼镜--下装
{},--衣服--上装
}--各个装备组
local Table_Owned_Equipped = {}
local Owned_Equipped = {}
local Table_Equipped = {}
local Owned_Num = 0
local Locked_Num = 0
local Daily_Progress = 0

local function Storage()
    -----------------------------------------------------------------------------------------------------
    Table_Equipped = {}--已经装备的装备
    Table_Owned_Equipped = {} -- 未装备的装备 （不包括未拥有）
    Table_NotOwned_Equipped = {} -- 未拥有的装备
    --重置组
    for _, v in pairs(Table_NotCategory) do
        v = {}
    end
    --------------------判定已装备和可解锁，如果可则解锁并存储---------------------------------
    --这里读取玩家的装备
    for i, v in pairs(Owned_Equipped) do
        if v.Equipped == 1 then
            table.insert(Table_Equipped,v)
            -- Log:PrintDebug("[进入v]"..Table_Equipped[1].ID)
        end

        if v.Unlock ~= 1 and v.Piece > 0 then
            Owned_Equipped[i].Unlock = 1
            Owned_Equipped[i].Piece = Owned_Equipped[i].Piece - 1  --   碎片数量-1
            -- 存储
            Archive:SetPlayerData(Player, Archive.TYPE.String, "Owned_Equipped_Table", MiscService:Table2JsonStr(Owned_Equipped)) 
        end
    end
    --------------------------------排序--------------------------------------------------
    for ID = 4, 1, -1 do --重复执行四次判定装备品阶，品阶越高，装备越在前
        for id = 1, 6 do --需要执行六次，将每个装备的排序
            for _, Owned  in ipairs(Owned_Equipped) do
                if  GearStorage[Owned.ID].Attributes.Grade  == ID  and  Owned.Equipped ~=1 and Owned.Category == id and Owned.Unlock == 1 then
                    table.insert(Table_NotCategory[id], Owned)
                    table.insert(Table_Owned_Equipped, Owned)
                elseif GearStorage[Owned.ID].Attributes.Grade  == ID  and  Owned.Equipped ~=1 and Owned.Category == id and Owned.Unlock == 2 then
                    --  Log:PrintDebug("[未装备]"..GearStorage[v.ID].Attributes.Grade)
                    table.insert(Table_NotCategory[id], Owned)
                    table.insert(Table_NotOwned_Equipped, Owned)
                end
            end
        end
    end
    for ID = 1, 6 do
        for _ , v in ipairs(Table_NotCategory[ID]) do
            table.insert(Table_Category[ID],v)
        end
    end

    Owned_Num = #Table_Equipped  --  判定瓦片视图已装备装备数量
    Locked_Num = #Table_Owned_Equipped  --  判定瓦片视图已解锁装备数量
    Log:PrintDebug("[数量]"..#Table_NotOwned_Equipped )

    ----------------------这里添加滚动窗口视图------------------------------------
    --这是商城
    TimerManager:AddTimer(0.5,function ()
        UI:SetVisible({110208,110362},true)
        for index = 1, #shangdiandaoju - 1 do
            local NewUI =  UI:DuplicateWidget(110362,6000,6000)
            table.insert(Shop_Gap, NewUI)
        end
        for i, v in ipairs(shangdiandaoju) do
            table.insert(Shop_Gap_All, v)
            if Shop_Gap[i] ~= nil then
                table.insert(Shop_Gap_All, Shop_Gap[i])
            end
        end
        UI:AddToScrollView(110361,Shop_Gap_All)
        UI:SetVisible({110208},false)
    end)
    --这是任务
    TimerManager:AddTimer(0.5,function ()
        UI:SetVisible({100599},true)
        for index = 1, #Task - 1 do
            local NewUI =  UI:DuplicateWidget(110466,6000,6000)
            table.insert(Task_Gap, NewUI)
        end
        for i, v in ipairs(Task) do
        table.insert(Task_Gap_All, v)
        if Task_Gap[i] ~= nil then
            table.insert(Task_Gap_All, Task_Gap[i])
        end
        end
        UI:AddToScrollView(110467,Shop_Gap_All)
        UI:SetVisible({100599},false)
    end)

    ---------------
    ---读取并判定日常进度条 每日需要更新
    Daily_Progress = 0
    if Archive:HasPlayerData(Player,Archive.TYPE.Number,"Daily_Progress") then
        Daily_Progress = Archive:GetPlayerData(Player, Archive.TYPE.Number, "Daily_Progress")
    else
        Daily_Progress = 0
    end
    --这里判断每日的任务
    if Archive:HasPlayerData(Player,Archive.TYPE.String,"Task") then
        local Task = Archive:GetPlayerData(Player,Archive.TYPE.String,"Task")
        Task = MiscService:JsonStr2Table(Task)
    end
end


function LobbyModule:GameStart()
    --打开主页界面
    Storage()
end

function LobbyModule:ReadStorage(listViewId, itemIndex,Current) --瓦片视图输入
    --@@这里读取储存已装备的道具
    local ButtonUI = UI:GetListViewItemUID(listViewId, itemIndex,109448) -- 装备图标  同按钮
    local ClassTXT = UI:GetListViewItemUID(listViewId, itemIndex,109450) -- 等级文字
    --@@然后改变底图
    --@@改变文字
    if Current.Level ~= nil then
        UI:SetText({ClassTXT},"等级"..Current.Level)
        else
        UI:SetText({ClassTXT},"等级1")
    end
    --@@这里要更改进度条
    local Cost = Level_Shard[Current.Level]
    local Progress = UI:GetListViewItemUID(listViewId, itemIndex,109456) --进度条
    if Current.Level ~= nil then
        UI:SetProgressMaxValue({Progress},Cost)--设置进度条最大值
        else
        UI:SetProgressMaxValue({Progress},1)--设置进度条最大值
    end
    
    if Current.Piece > Cost then--设置进度条当前值
        UI:SetProgressCurrentValue({Progress},Cost)
    --这里添加可以升级的UI
    else
        if Current.Level ~= nil then
            UI:SetProgressCurrentValue({Progress},Current.Piece)
        else
            UI:SetProgressCurrentValue({Progress},0)
        end
    end
    --设置装备图片
    local elementId = System:GetScriptParentID()
    for i, v in ipairs(zhuangbei_hd) do
        UI:SetImage({v},CustomProperty:GetCustomProperty(elementId, "1", CustomProperty.PROPERTY_TYPE.Image),true)
    end

    for i, v in ipairs(zhuangbei_zb) do
        UI:SetImage({v},CustomProperty:GetCustomProperty(elementId,"1" , CustomProperty.PROPERTY_TYPE.Image),true)
    end
end

----------------------------点击事件----------------------------------------------------
function LobbyModule:Click(Current)
    --二级界面
    UI:SetVisible({100570},true)
    --修改名字
    local Equipment = GearStorage[Current.ID]
    UI:SetText({100558}, Equipment.TypeName)
    --判定是否装备--
    local Cost = Level_Shard[Current.Level]
    if Current.Piece >=  Cost then
        UI:SetProgressMaxValue({100562},Cost)--设置进度条最大值
        UI:SetProgressCurrentValue({100562},Cost)
    else
        UI:SetProgressMaxValue({100562},Cost)
        UI:SetProgressCurrentValue({100562},Current.Piece)--设置进度条
    end

    --以下为装备显示状态【互斥关系】
    UI:SetVisible({100577, 104184, 104194, 104187, 104204, 104198, 100573, 104175},false)
    if Current.Unlock == 1 then
        --解锁
        if Current.Equipped == 1 then
            --已装备
            if Current.Piece >= Cost  then
                --已装备可升级
                UI:SetVisible({104194,104175},true)
            elseif Current.Level == 5 then
                --已装备已满级
                UI:SetVisible({104204},true)
            else
                --已装备
                UI:SetVisible({104184},true)
            end
        else
            --未装备
            if Current.Piece >= Cost  then
                --已有装备可升级
                UI:SetVisible({104187,104175},true)
            elseif  Current.Level == 5 then
                --已有装备已满级
                UI:SetVisible({104198},true)
            else
                --已有装备
                UI:SetVisible({100573},true)
            end
        end
    else
        --未解锁
        UI:SetVisible({100577},true)
        --跳转？
    end
    local elementId = System:GetScriptParentID()
    UI:SetImage({100559},CustomProperty:GetCustomProperty(elementId, "1", CustomProperty.PROPERTY_TYPE.Image),true)
    local Attributes = Equipment.Attributes
    if  Current.Category == 1 or Current.Category == 4 or Current.Category == 5 or Current.Category == 6 then
        local num = Attributes.Attack + (Attributes.Growth*(Current.Level-1))
        UI:SetText({100565},tostring(num))--设置攻击力
        UI:SetProgressCurrentValue({104178},(num/(Attributes.Attack+Attributes.Growth*(5-Current.Level))*100))
        UI:SetProgressCurrentValue({104177},(num/(Attributes.Attack+Attributes.Growth*(4-Current.Level))*100))
        UI:SetText({104174},tostring(num + Attributes.Growth))
        UI:SetVisible({101877},true)
    elseif Current.Category == 2 then
        local num =Attributes.Heal+ (Attributes.Growth*(Current.Level-1))
        UI:SetText({100565},tostring(num))--设置生命值
        UI:SetProgressCurrentValue({104178},(num/(Attributes.Heal+Attributes.Growth*(5-Current.Level)))*100)
        UI:SetProgressCurrentValue({104177},(num/(Attributes.Heal+Attributes.Growth*(4-Current.Level)))*100)
        UI:SetText({104174},tostring(num + Attributes.Growth))
        UI:SetVisible({104167},true)
    else
        local num = Attributes.Accuracy+ (Attributes.Growth*(Current.Level-1))
        UI:SetText({100565},tostring(num))--设置准确度
        UI:SetProgressCurrentValue({104178},(num/(Attributes.Accuracy+Attributes.Growth*(5-Current.Level))*100))
        UI:SetProgressCurrentValue({104177},(num/(Attributes.Accuracy+Attributes.Growth*(4-Current.Level))*100))
        UI:SetText({104174},tostring(num + Attributes.Growth))
        UI:SetVisible({104169},true)
    end
    if Attributes.HeadShotIncrease ~= 0 then
        UI:SetVisible({104173},true)
        UI:SetText({100574},"头部额外增伤")
        UI:SetText({104172},Attributes.HeadShotIncrease.."%")
    elseif Attributes.BodyShotIncrease ~= 0 then
        UI:SetVisible({104173},true)
        UI:SetText({100574},"躯干额外增伤")
        UI:SetText({104172},Attributes.BodyShotIncrease.."%")
    elseif Attributes.HeadShotReduction ~= 0 then
        UI:SetVisible({104173},true)
        UI:SetText({100574},"头部额外减伤")
        UI:SetText({104172},Attributes.HeadShotReduction.."%")
    elseif Attributes.BodyShotReduction ~= 0 then
        UI:SetVisible({104173},true)
        UI:SetText({100574},"躯干额外减伤")
        UI:SetText({104172},Attributes.BodyShotReduction.."%")
    elseif Attributes.DamageReduction ~= 0 then
        UI:SetVisible({104173},true)
        UI:SetText({100574},"伤害减免")
        UI:SetText({104172},Attributes.DamageReduction.."%")
    end
end

-------------------------------------------k-------------------------------------------

function LobbyModule:TileView()
    local List = {}
    local ItemDataList = {}
    for i = 1 , CategoryNum_1 do
        ItemDataList[i] = {showText = i}
    end
    local itemIndexList = UI:InitListView(109447,ItemDataList)
    --开始载入
    --@Table_Equipped  已装备的装备
    local Setcall = function (listViewId, itemIndex,itemData,select)
        --这里读取已拥有装备
        local Merge = {} -- 重置
        local Current
        --------------------------------------------------------------------------------------
        --这里用存储判定是否满级
        if itemData.showText <= Owned_Num  then  --判定已装备的装备
            local LockUI = UI:GetListViewItemUID(listViewId, itemIndex,109579) --锁UI
            table.insert(Merge,LockUI)
            --
            Current = Table_Equipped[itemData.showText]--带入
            if  Current.Level ~= 5 then --如果没满隐藏满级图标
                local Max = UI:GetListViewItemUID(listViewId, itemIndex,109467) --满级UI
                table.insert(Merge,Max)
            end
            UI:SetTransparency(Merge,0)  --设置UI透明度为0Locked_Num
        elseif itemData.showText > Owned_Num and itemData.showText <= Locked_Num  + Owned_Num then
            local LockUI = UI:GetListViewItemUID(listViewId, itemIndex,109579) --锁UI
            table.insert(Merge,LockUI)
            local UnlockUI = UI:GetListViewItemUID(listViewId, itemIndex,109451) --已装备UI
            table.insert(Merge,UnlockUI)
            --
            Current =  Table_Owned_Equipped[itemData.showText - Owned_Num ]
            --
            if  Current.Level ~= 5 then --如果没满隐藏满级图标
                local Max = UI:GetListViewItemUID(listViewId, itemIndex,109467) --满级UI
                table.insert(Merge,Max)
            end
            UI:SetTransparency(Merge,0) --设置UI透明度为0
        elseif  itemData.showText > Locked_Num  + Owned_Num and itemData.showText <= CategoryNum_1 then
            local Max = UI:GetListViewItemUID(listViewId, itemIndex,109467) --满级UI
            table.insert(Merge,Max)
            local UnlockUI = UI:GetListViewItemUID(listViewId, itemIndex,109451) --已装备UI
            table.insert(Merge,UnlockUI)
            --
            Current =  Table_NotOwned_Equipped[itemData.showText - (Locked_Num  + Owned_Num)]
            --
            if  Current.Level ~= 5 then --如果没满隐藏满级图标
                local Max = UI:GetListViewItemUID(listViewId, itemIndex,109467) --满级UI
                table.insert(Merge,Max) 
            end
            local ButtonUI = UI:GetListViewItemUID(listViewId, itemIndex,109448)
            UI:SetImageColor({ButtonUI},"#595959")
            UI:SetTransparency(Merge,0)
        end

        local ButtonUI = UI:GetListViewItemUID(listViewId, itemIndex,109448)
        List[itemData.showText] = Current
        LobbyModule:ReadStorage (listViewId, itemIndex, Current) --读取存储  修改图片底图  等级  等等
        local elementId = System:GetScriptParentID()
        UI:SetImage({ButtonUI},CustomProperty:GetCustomProperty(elementId, "1", CustomProperty.PROPERTY_TYPE.Image),true)--这里需要读取Current.Attributes.Icon
       local GetButtonList = {100576, 104183, 104191, 104186, 104202, 104197, 100568}
       for _, Button in pairs(GetButtonList) do
            UI:RegisterPressed(Button, function()
                --TODO：跳转到商城
                --二级界面
                UI:SetVisible({100570}, false)

                local i = 4
                UI:SetVisible(Store_currency,false)
                UI:SetVisible(currency,false) 
                UI:RemoveFromScrollView(110361,Shop_Gap_All)
                UI:RemoveFromScrollView(110467,Task)
                UI:SetVisible(Task,false)
                UI:SetVisible(shangdiandaoju,false)
                UI:SetVisible(TongyongTAB_anxia,false)
                UI:SetVisible(TAB_BG,false)
                UI:SetVisible({TAB_BG[i]},true)
                UI:SetVisible({TongyongTAB_anxia[i]},true)
                for _ , kongjian in ipairs(zhengtitabyemian) do
                    UI:SetVisible(VS_yemian,false)
                    UI:SetVisible({106562},false)
                    UI:SetVisible(kongjian,false)
                end
                if i == 4 then
                    UI:SetVisible(shangdiandaoju,true)
                    UI:AddToScrollView(110361,Shop_Gap_All)
                    UI:SetVisible(Store_currency,true) 
                end
                UI:SetVisible(zhengtitabyemian[i],true)
            end)
       end
    end
    UI:SetListViewItemSetCall(109447,Setcall)
    -----------------------模拟点击事件-----------------------------------------
    UI:SetListViewItemSelectionChangeCall(109447, function(listViewId, itemId, itemData, select)
        local UID = UI:GetListViewItemUID(listViewId, itemId, 109448)
        -- 进行模拟点击
        if select then
            if itemData and UID then
                -- 执行点击操作
                self.SelectTarget = List[itemData.showText]
                LobbyModule:Click(self.SelectTarget)
            end
            UI:ClearListViewSelection(109447)
        end
    end)
end

function LobbyModule:TileView_TAB(Num)
    local ItemDataList = {}
    for i = 1 , CategoryNum[Num] do
        ItemDataList[i] = {showText = i}
    end
    local itemIndexList = UI:InitListView(109447,ItemDataList)
    --读取的玩家存储已拥有装备
    --开始载入
    local Setcall = function (listViewId, itemIndex,itemData)
    --这里读取已拥有装备
        local Merge = {} -- 重置
        local Current
        ----------------------------------------------------------------------------------------
        ----------------------------------------------------------------------------------------
        if itemData.showText <= 1  then  --判定已装备的装备
            if Table_Equipped[Num] ~= nil then
                local LockUI = UI:GetListViewItemUID(listViewId, itemIndex,109579) --锁UI
                table.insert(Merge,LockUI)
                --
                Current =  Table_Equipped[Num] --这里带入一下
                --
            else
                local UnlockUI = UI:GetListViewItemUID(listViewId, itemIndex,109451) --已装备UI
                table.insert(Merge,UnlockUI)
                Current =  Table_Category[Num][itemData.showText]
                local ButtonUI = UI:GetListViewItemUID(listViewId, itemIndex,109448)
                UI:SetImageColor({ButtonUI},"#595959")
            end

            if  Current.Level ~= 5 then --如果没满隐藏满级图标
                local Max = UI:GetListViewItemUID(listViewId, itemIndex,109467) --满级UI
                table.insert(Merge,Max)
            end
            UI:SetTransparency(Merge,0)  --设置UI透明度为0
        elseif itemData.showText > 1 and itemData.showText <=  CategoryNum[Num] - #Table_NotCategory[Num] then
            local LockUI = UI:GetListViewItemUID(listViewId, itemIndex,109579) --锁UI
            table.insert(Merge,LockUI)
            local UnlockUI = UI:GetListViewItemUID(listViewId, itemIndex,109451) --已装备UI
            table.insert(Merge,UnlockUI)
            --
            Current =  Table_Category[Num][itemData.showText-1]
            --
            UI:SetTransparency(Merge,0) --设置UI透明度为0
        elseif  itemData.showText > CategoryNum[Num] - #Table_NotCategory[Num]  and itemData.showText <= CategoryNum[Num] then
            local Max = UI:GetListViewItemUID(listViewId, itemIndex,109467) --满级UI
            table.insert(Merge,Max)
            local UnlockUI = UI:GetListViewItemUID(listViewId, itemIndex,109451) --已装备UI
            table.insert(Merge,UnlockUI)
            --
            Current =  Table_Category[Num][itemData.showText-1]
            --
            local ButtonUI = UI:GetListViewItemUID(listViewId, itemIndex,109448)
            UI:SetImageColor({ButtonUI},"#595959")
            UI:SetTransparency(Merge,0)
        end
        local ButtonUI = UI:GetListViewItemUID(listViewId, itemIndex,109448)
        local elementId = System:GetScriptParentID()
        UI:SetImage({ButtonUI},CustomProperty:GetCustomProperty(elementId, "1", CustomProperty.PROPERTY_TYPE.Image),true)
        LobbyModule:ReadStorage (listViewId, itemIndex,Current) --读取存储  修改图片底图  等级  等等

        
       -- UI:SetImage({UID},10010013)
    end
    UI:SetListViewItemSetCall(109447,Setcall)
    UI:SetListViewItemSelectionChangeCall(109447, function(listViewId, itemId, itemData, select)
        local UID = UI:GetListViewItemUID(listViewId, itemId, 109448)
        -- 进行模拟点击
        if select then
            if itemData and UID then
                -- 执行点击操作
                self.SelectTarget = Table_Category[Num][itemData.showText]
                LobbyModule:Click(self.SelectTarget)
            end
            UI:ClearListViewSelection(109447)
        end
    end)
end


--------------------------点击事件----------------------------------
--[[
--UI切换系统
UI:RegisterPressed(100504,function ()  -- 进入游戏
    -- 生成 1 到 8 的随机数字
    --local randomNumber =  math.random(1, 8)
    local randomNumber = math.random(1, 7)  --随机海岛和天空
    if randomNumber == 7 then
        randomNumber = 8
    end
    UI:SetVisible(zhuye,false)
    UI:SetVisible(currency,false)
    UI:SetVisible(TAB,false)
    --这里放切换场景的接口
    System:FireSignEvent(tostring(randomNumber))
    Archive:SetPlayerData(Player, Archive.TYPE.Number, "BattleStage", randomNumber)
end)

UI:RegisterPressed(100488,function ()  -- 主页七日挑战
    UI:SetVisible({105217},true)
end)

UI:RegisterPressed(104191,function ()
    if self.SelectTarget then
        if Diamond >= Level_Diamond[self.SelectTarget.Level] then
            Diamond = Diamond - Level_Diamond[self.SelectTarget.Level]
            self.SelectTarget.Piece = self.SelectTarget.Piece - Level_Shard[self.SelectTarget.Level]
            Archive:SetPlayerData(Player, Archive.TYPE.Number, "Diamond", Diamond)
            local Equipped = Archive:GetPlayerData(Player, Archive.TYPE.String, "Owned_Equipped_Table")
            --文字转为组
            local OwnedEquipped = MiscService:JsonStr2Table(Equipped)
            OwnedEquipped[self.SelectTarget.ID].Level = OwnedEquipped[self.SelectTarget.ID].Level + 1 
            OwnedEquipped[self.SelectTarget.ID].Piece = self.SelectTarget.Piece
            --组转文字
            Archive:SetPlayerData(Player, Archive.TYPE.String, "Owned_Equipped_Table", MiscService:Table2JsonStr(Owned_Equipped))
            UI:SetVisible({100570,100577,101877,104167,104169,104173,10419,104184,104187,104175,100573,104198},false)
            LobbyModule:Click(self.SelectTarget)
        else
            UI:ShowToast("钻石不足")
        end
    end
end)

UI:RegisterPressed(101102,function ()  -- 关闭七日挑战
    UI:SetVisible({105217},false)
end)

UI:RegisterPressed(100569,function () -- 关闭二级装备
    UI:SetVisible({100570,100577,101877,104167,104169,104173,10419,104184,104187,104175,100573,104198},false)
end)

UI:RegisterPressed(100505,function ()  --跳转黄金联赛
    ---底下TAB切换---
    Log:PrintDebug("黄金联赛")
    UI:SetVisible(TongyongTAB_anxia,false)
    UI:SetVisible(TAB_BG,false)
    UI:SetVisible({TAB_BG[5]},true)
    UI:SetVisible({TongyongTAB_anxia[5]},true)
    for _ , kongjian in ipairs(zhengtitabyemian) do
        UI:SetVisible(VS_yemian,false)
        UI:SetVisible({106562},false)
        UI:SetVisible(kongjian,false)
    end
    UI:SetVisible(zhengtitabyemian[5],true)
    ---重置------
    UI:SetVisible(VS_tab_anxia,false)
    UI:SetVisible({VS_tab_anxia[2]},true)
    UI:SetVisible(VS_yemian,false)
    UI:SetVisible({VS_yemian[2]},true)
end)

for i, v in ipairs(Task_Click) do
    UI:RegisterPressed(v,function ()
        if i <= 5  then
            Daily_Progress = Daily_Progress + 10 
        elseif i <= 11 then
            Daily_Progress = Daily_Progress + 15
        elseif i <= 17 then
                Daily_Progress = Daily_Progress + 20
        end

        UI:SetProgressCurrentValue(104019,((Daily_Progress)/240)*100 )
        UI:SetText({103892},Daily_Progress)
        Archive:SetPlayerData(Player, Archive.TYPE.Number, "Daily_Progress", Daily_Progress)
        UI:SetVisible({Task_Click[i]},false)
        UI:SetVisible({Task_over[i]},true)
        UI:SetImageColor({Task_BG[i]},"#595959")
        local Task_Complete1 = table.remove(Task,i)
        table.insert(Task,Task_Complete1)
        UI:RemoveFromScrollView(110467,Task)
        UI:AddToScrollView(110467,Task)
    end)
end

UI:RegisterPressed(106556,function () --进入黄金联赛
    UI:SetVisible({VS_yemian[2],VS_tab_anxia[2],zhengtitabyemian[5],TAB_BG[5],TongyongTAB_anxia[5]},false)
    UI:SetVisible(zhuye,false)
    UI:SetVisible(currency,false)
    UI:SetVisible(TAB,false)
    --这里放切换场景的接口
    System:FireSignEvent("7")
    Archive:SetPlayerData(Player, Archive.TYPE.Number, "BattleStage", 7)
end)

for i, anniu in ipairs(qiriTAB) do  --七日挑战TAB奖励切换
    UI:RegisterPressed(anniu,function (ton)
        UI:SetVisible(qiriTAB_anxia,false)
        UI:SetVisible({qiriTAB_anxia[i]},true)

        UI:SetVisible(qirijiangli,false)
        UI:SetVisible({qirijiangli[i]},true)
    end) 
end

for i,anniu in ipairs(TongyongTAB) do  --切换各种页面 
    UI:RegisterPressed(anniu,function ()
        UI:SetVisible(Store_currency,false)
        UI:SetVisible(currency,false) 
        UI:RemoveFromScrollView(110361,Shop_Gap_All)
        UI:RemoveFromScrollView(110467,Task)
        UI:SetVisible(Task,false)
        UI:SetVisible(shangdiandaoju,false)
        UI:SetVisible(TongyongTAB_anxia,false)
        UI:SetVisible(TAB_BG,false)
        UI:SetVisible({TAB_BG[i]},true)
        UI:SetVisible({TongyongTAB_anxia[i]},true)
        for _ , kongjian in ipairs(zhengtitabyemian) do
            UI:SetVisible(VS_yemian,false)
            UI:SetVisible({106562},false)
            UI:SetVisible(kongjian,false)
        end
        if i == 4 then
            UI:SetVisible(shangdiandaoju,true)
               UI:AddToScrollView(110361,Shop_Gap_All)
               UI:SetVisible(Store_currency,true) 
        elseif i == 1 then
            UI:SetVisible(currency,true) 
            UI:SetVisible(Task,true)
            UI:AddToScrollView(110467,Task)
        else
            UI:SetVisible(currency,true) 
        end

        UI:SetVisible(zhengtitabyemian[i],true)

        if i == 2  then
            LobbyModule:TileView()
         end
    end)
end

for i, anniu in pairs(zhuangbei_hd) do  --主页已装备
    UI:RegisterPressed(anniu,function (ton)
        LobbyModule:Click(Table_Equipped[i])
    end)
end

for i, anniu in pairs(zhuangbei_zb) do  --装备已装备
    UI:RegisterPressed(anniu,function (ton)
        LobbyModule:Click(Table_Equipped[i])
    end)
end

for i,anniu in ipairs(zhuangbei_tab) do --装备查询
    UI:RegisterPressed(anniu,function (ton)
        UI:SetVisible(zhuangbei_tab_anxia,false)
        UI:SetVisible({zhuangbei_tab_anxia[i]},true)
        if i ~= 1 then
            LobbyModule:TileView_TAB(i-1)
        else
            LobbyModule:TileView()
        end
    end)
end

for i , anniu in ipairs(VS_tab) do  --联赛tab
    UI:RegisterPressed(anniu,function (ton)
        --Log:PrintDebug("点击成功")
        UI:SetVisible(VS_tab_anxia,false)
        UI:SetVisible({VS_tab_anxia[i]},true)
        UI:SetVisible(VS_yemian,false)
        UI:SetVisible({VS_yemian[i]},true)
    end)
end
--]]
return LobbyModule