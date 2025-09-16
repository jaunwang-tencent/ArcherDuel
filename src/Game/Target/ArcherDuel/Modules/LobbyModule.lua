--战斗模块
local LobbyModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--辅助API
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils

--缺省基础数值
local DefaultBaseData =
{
    Equipped_Bow_Num = 1,
    Equipped_Spear_Num = 0,
    Equipped_Axe_Num = 0,
    Equipped_Hat_Num = 1,
    Equipped_Glasses_Num = 1,
    Equipped_Cloth_Num = 1,
    Equipped_Bow_Lv = 1,
    Equipped_Spear_Lv = 0,
    Equipped_Axe_Lv = 0,
    Equipped_Hat_Lv = 1,
    Equipped_Glasses_Lv = 1,
    Equipped_Cloth_Lv = 1,
    Coin = 5000,                  --金币
    Diamond = 1,                  --砖石
    Rank = 1,                     --段位[可以被score&RankInfoConfig计算出]
    GoldBox = 3,                  --金宝箱
    SilverBox = 5,                --银宝箱
    NormalBox = 1,                --普通宝箱
    Daily_Progress = 1,
    Player_BattlePoints_Num = 0,  --门票
    Player_TaskDailyExp_Num = 0,  --每日任务经验
    Player_CollectTaskDaily_Num = 0,   --每日领取任务，按位来标记任务是否已领取
    Rank_DiamondScore_Num = 0,    --钻石联赛中的积分
    Player_TaskWeeklyExp_Num = 0, --每周任务经验
    Player_CollectTaskWeekly_Num = 0,   --每日领取任务，按位来标记任务是否已领取
    Player_LastLoginTime_Num = 0,   --上次登录时间
}

--- 打开
---@param Context 上下文【透传数据】
function LobbyModule:Open(Context)
    self:PerformLoading()
    self:CharacterStandby()
    self:LoadData()
    self:InitView()
    self:RegisterGameEvent()
end

--- 刷新
---@param DeltaTime 时间戳
function LobbyModule:Update(DeltaTime)
    
end

--- 关闭
function LobbyModule:Close()
    --菜单栏
    local TitleBar = UIConfig.MainView.TitleBar
    --打开主菜单
    UI:SetVisible({TitleBar.ID}, false)

    --注册菜单事件
    for _, ViewData in pairs(TitleBar) do
        if type(ViewData) == "table" and ViewData.Unselected then
            UI:UnRegisterClicked(ViewData.Unselected)
        end
    end

    --离开时保存数据
    self:SaveData()
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

--- 加载玩家数据
function LobbyModule:LoadData()
    --1、玩家基础数据
    self.PlayerData = { }
    local BaseData = {}
    --加载基础数据
    for ArchiveKey, ArchiveValue in pairs(DefaultBaseData) do
        local Data
        if Archive:HasPlayerData(self.PlayerID, Archive.TYPE.Number, ArchiveKey) then
            Data = Archive:GetPlayerData(self.PlayerID, Archive.TYPE.Number, ArchiveKey)
        else
            Data = ArchiveValue
        end

        --写入数据
        BaseData[ArchiveKey] = Data
    end
    --测试【砖石，用来购买商品】
    --BaseData.Coin = 555555
    self.PlayerData.BaseData = BaseData

    --2、装备数据
    --2.1、初始化装备
    local AllEquipment
    --Log:PrintLog("LoadData", self.PlayerID)
    if Archive:HasPlayerData(self.PlayerID, Archive.TYPE.String, "All_Equipment_Table") then
        --这里读取玩家的装备 --并进行排序
        local All_Equipment_Table = Archive:GetPlayerData(self.PlayerID, Archive.TYPE.String, "All_Equipment_Table")
        Log:PrintLog("LoadData", All_Equipment_Table)
        --文字转为组
        AllEquipment = MiscService:JsonStr2Table(All_Equipment_Table)
    else
        --没有则初始化
        AllEquipment = self:DefaultEquipmentData()
    end
    self.PlayerData.AllEquipment = AllEquipment
    self:RefreshEquipmentData()

    --3、商店数据
    local AllItems
    if Archive:HasPlayerData(self.PlayerID, Archive.TYPE.String, "All_Goods_Table") then
        --这里读取玩家的装备 --并进行排序
        local All_Goods_Table = Archive:GetPlayerData(self.PlayerID, Archive.TYPE.String, "All_Goods_Table")
        --文字转为组
        AllItems = MiscService:JsonStr2Table(All_Goods_Table)
    else
        AllItems = self:DefaultStoreData()
    end
    self.PlayerData.AllItems = AllItems
    self:RefreshStoreData()

    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    local lastLoginTime = self.PlayerData.BaseData.Player_LastLoginTime_Num
    if lastLoginTime == nil or lastLoginTime == 0 or lastLoginTime > nowTs then
        lastLoginTime = nowTs - (7 * 24 * 60 * 60)
    end

    if _GAME.GameUtils.isCrossDay(lastLoginTime) then
        --跨天登录了
        Log:PrintLog("跨天登录了")
    end
    if _GAME.GameUtils.isCrossWeek(lastLoginTime) then
        --跨周登录了
        Log:PrintLog("跨周登录了")
    end

    self.PlayerData.BaseData.Player_LastLoginTime_Num = nowTs
end

--- 角色站街，装备穿戴
function LobbyModule:CharacterStandby()
    --获取本地玩家标识【真人出生点挪走，相机后面去】
    self.PlayerID =  Character:GetLocalPlayerId()
    --设置角色位置【角色占位：SceneId = 433】
    local StandbyHoldeSceneId = 433
    local Location = Element:GetPosition(StandbyHoldeSceneId)
    local Rotation = Element:GetRotation(StandbyHoldeSceneId)
    self.StandbyUID = FakeCharacter:CreateCharacter(Location, Rotation, Engine.Vector(1, 1, 1), false)

    --本地角色【影视相机：SceneId = 436】
    UGCS.Framework.Executor.Delay(1, function ()
        System:FireSignEvent("启动相机",{self.PlayerID})
    end)
end

--- 刷新外观
function LobbyModule:RefreshAvatar()
    local BodyEquipment = self.PlayerData.BodyEquipment
    if BodyEquipment then
        local BodyIds = {}
        for _, Equipment in pairs(BodyEquipment) do
            local EquipmentData = EquipmentConfig[Equipment.ID]
            if EquipmentData and EquipmentData.EquipID then
                table.insert(BodyIds, EquipmentData.EquipID)
            end
        end
        FakeCharacter:ChangeCharacterBody(self.StandbyUID, BodyIds)
    else
        --没有则换回玩家原皮
        FakeCharacter:ChangeBodyFromPlayer(self.StandbyUID, self.PlayerID)
    end
end

--- 保存玩家数据
function LobbyModule:SaveData()
    --1、基础数据
    for ArchiveKey, _ in pairs(DefaultBaseData) do
        local Data = self.PlayerData.BaseData[ArchiveKey]
        Archive:SetPlayerData(self.PlayerID, Archive.TYPE.Number, ArchiveKey, Data)
    end

    --2、装备数据
    local AllEquipment = self.PlayerData.AllEquipment
    local All_Equipment_Table = MiscService:Table2JsonStr(AllEquipment)
    Archive:SetPlayerData(self.PlayerID, Archive.TYPE.String, "All_Equipment_Table", All_Equipment_Table)
    --Log:PrintLog("SaveData", self.PlayerID, All_Equipment_Table)

    --3、商店数据
    local AllItems = self.PlayerData.AllItems
    local All_Goods_Table = MiscService:Table2JsonStr(AllItems)
    Archive:SetPlayerData(self.PlayerID, Archive.TYPE.String, "All_Goods_Table", All_Goods_Table)
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
            UI:RegisterClicked(ViewData.Unselected, function()
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
        self:RefreshGeneralResourceBar()
    elseif ViewName == "Equipment" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.EquipmentModule
        self:RefreshGeneralResourceBar()
    elseif ViewName == "Fight" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.FightModule
        self:RefreshGeneralResourceBar()
    elseif ViewName == "Store" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.StoreModule
        self:RefreshStoreResourceBar()
    elseif ViewName == "Tournament" then
        TargetModule = UGCS.Target.ArcherDuel.Modules.TournamentModule
    end
    if TargetModule then
        TargetModule:Open(self.PlayerData)
        self.CurrentModule = TargetModule
    end
end

function LobbyModule:RegisterGameEvent()
    --跳转商城
    System:RegisterGameEvent(_GAME.Events.JumpModule, function(ModuleName)
        self:SwitchView(ModuleName)
    end)

    --刷新资源
    System:RegisterGameEvent(_GAME.Events.RefreshData, function(DataType)
        if DataType == "GeneralResource" then
            self:RefreshGeneralResourceBar()
        elseif DataType == "StoreResource" then
            self:RefreshStoreResourceBar()
        elseif DataType == "EquipmentData" then
            self:RefreshEquipmentData()
        elseif DataType == "StoreData" then
            self:RefreshStoreData()
        end
    end)
end

--- 初始化一套缺省装备信息
function LobbyModule:DefaultEquipmentData()
    --没有则初始化
    local AllEquipment = {}
    local InitEquippedID = { [1] = true, [15] = true, [38] = true, [61] = true, [77] = true, [93] = true }
    for ID, Data in pairs(EquipmentConfig) do
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
            Equipment.Piece = 10
            Equipment.Level = 3
        end
        AllEquipment[ID] = Equipment
    end
    return AllEquipment
end

--- 刷新装备
function LobbyModule:RefreshEquipmentData()
    Log:PrintLog("RefreshEquipmentData")
    local AllEquipment = self.PlayerData.AllEquipment
    --2.2、装备分类
    --按类型分组且品质降序
    local GroupByCategory = {}
    --装备槽【六个部位】
    local BodyEquipment = {}
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
        --已装备数据
        if Equipment.Equipped then
            --找到已装备的
            local EquippedEquipment = BodyEquipment[Equipment.Category]
            if EquippedEquipment then
                --卸下装备
                EquippedEquipment.Equipped = false
            end
            BodyEquipment[Equipment.Category] = Equipment
        end
    end
    --按品质排序
    for _, Group in pairs(GroupByCategory) do
        table.sort(Group, function(lhs, rhs)
            local LHSA = EquipmentConfig[lhs.ID].Attributes
            local RHSA = EquipmentConfig[rhs.ID].Attributes
            return LHSA.Grade < RHSA.Grade
        end)
    end
    self.PlayerData.GroupByCategory = GroupByCategory
    self.PlayerData.BodyEquipment = BodyEquipment
    --重新刷新外观
    self:RefreshAvatar()
end

--- 初始化一套缺省的商店信息【这里需要设计商品配置，包含商品类型、消耗方式信息等】
function LobbyModule:DefaultStoreData()
    --没有则初始化
    local AllItems = {}
    --3.1、限定奖池
    AllItems.LimitItem = {
        [1] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗一个黄金宝箱
                    GoldBox = 1,
                    --或者600个砖石
                    Diamond = 600,
                },
                [2] = {
                    --广告资源
                    Ad = "test_gold_box_tag",
                    --广告冷却时间
                    AdCoolTime = 24 * 3600
                }
            },
            --商品
            Goods = {
                Equipments = {
                    [1] = { ID = 1, Piece = 10 },
                    [2] = { ID = 15, Piece = 15 },
                    [3] = { ID = 38, Piece = 20 },
                    [4] = { ID = 61, Piece = 25 },
                    [5] = { ID = 77, Piece = 30 },
                    [6] = { ID = 93, Piece = 30 },
                }
            }
        },
        [2] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗一个白银宝箱
                    SilverBox = 1,
                    --或者600个砖石
                    Diamond = 180,
                },
                [2] = {
                    --广告资源
                    Ad = "test_silver_box_tag",
                    --广告冷却时间
                    AdCoolTime = 24 * 3600
                }
            },
            --商品
            Goods = {
                Equipments = {
                    [1] = { ID = 2, Piece = 10 },
                    [2] = { ID = 16, Piece = 15 },
                    [3] = { ID = 39, Piece = 20 },
                    [4] = { ID = 62, Piece = 25 },
                    [5] = { ID = 78, Piece = 30 },
                    [6] = { ID = 94, Piece = 30 },
                }
            }
        },
    }
    --3.2、每日限购
    AllItems.DailyItem = {
        [1] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 100,
                    --最大收集次数
                    MaxCollect = 2,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                Equipments = {
                    [1] = { ID = 3, Piece = 10 }
                }
            }
        },
        [2] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗50个砖石
                    Diamond = 50,
                    --最大收集次数
                    MaxCollect = 3,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                Equipments = {
                    [1] = { ID = 4, Piece = 10 }
                }
            }
        },
        [3] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 600,
                    --最大收集次数
                    MaxCollect = 1,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                Equipments = {
                    [1] = { ID = 5, Piece = 10 }
                }
            }
        }
    }
    --3.3、砖石
    AllItems.DiamondItem = {
        [1] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --广告资源
                    Ad = "test_diamond_tag",
                    --最大收集次数
                    MaxCollect = 5,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                --获得砖石
                Diamond = 600
            }
        }
    }
    --3.4、金币【购买】
    AllItems.CoinItem = {
        [1] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 150,
                }
            },
            --商品
            Goods = {
                Coin = 1500,
            }
        },
        [2] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 1000,
                }
            },
            --商品
            Goods = {
                Coin = 12000,
            }
        },
        [3] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 4200,
                }
            },
            --商品
            Goods = {
                Coin = 37000,
            }
        }
    }
    return AllItems
end

--- 刷新商店
function LobbyModule:RefreshStoreData()

end

--- 刷新通用资源栏
function LobbyModule:RefreshGeneralResourceBar()
    local MainView = UIConfig.MainView
    local GeneralResourceBar = MainView and MainView.GeneralResourceBar
    if GeneralResourceBar then
        --玩家基础数据
        local BaseData = self.PlayerData.BaseData
        --玩家图标
        --目前API侧无法读取玩家图标，暂时使用这个
        --获取头像
        UI:SetImage({GeneralResourceBar.PlayerIcon},Chat:GetCustomHeadIcon(self.PlayerID), true)
        --GameUtils.SetImageWithAsset(GeneralResourceBar.PlayerIcon, "avatar", 1)
        UI:SetText({GeneralResourceBar.Rank.Label}, tostring(BaseData.Rank))
        UI:SetText({GeneralResourceBar.GoldCoins.Label}, tostring(BaseData.Coin))
        UI:SetText({GeneralResourceBar.Diamonds.Label}, tostring(BaseData.Diamond))
        UI:SetText({GeneralResourceBar.Securities.Label}, tostring(BaseData.Player_BattlePoints_Num))
    end
end

--- 刷新商店资源栏
function LobbyModule:RefreshStoreResourceBar()
    local MainView = UIConfig.MainView
    local StoreResourceBar = MainView and MainView.StoreResourceBar
    if StoreResourceBar then
        local BaseData = self.PlayerData.BaseData
        UI:SetText({StoreResourceBar.GoldBox.Label}, tostring(BaseData.GoldBox))
        UI:SetText({StoreResourceBar.SilverBox.Label}, tostring(BaseData.SilverBox))
        UI:SetText({StoreResourceBar.Diamonds.Label}, tostring(BaseData.Diamond))
    end
end

return LobbyModule