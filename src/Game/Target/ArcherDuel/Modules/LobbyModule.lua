--战斗模块
local LobbyModule = {}
--UI配置
local UIConfig = UGCS.Target.ArcherDuel.Config.UIConfig
--装备配置
local EquipmentConfig = UGCS.Target.ArcherDuel.Config.EquipmentConfig
--宝箱配置
local OpenBoxConfig = UGCS.Target.ArcherDuel.Config.OpenBoxConfig
--商品配置
local GoodsConfig = UGCS.Target.ArcherDuel.Config.GoodsConfig
--数据中心
local DataCenter = UGCS.Target.ArcherDuel.Helper.DataCenter
local GameUtils = UGCS.Target.ArcherDuel.Helper.GameUtils

--缺省基础数值
local DefaultBaseData =
{
    --已穿戴床被信息
    Equipped_Character_ID = 1,
    Equipped_Top_ID = 15,
    Equipped_Bottoms_ID = 38,
    Equipped_Bow_ID = 61,
    Equipped_Axe_ID = 77,
    Equipped_Spear_ID = 93,
    Equipped_Character_Lv = 1,
    Equipped_Top_Lv = 1,
    Equipped_Bottoms_Lv = 1,
    Equipped_Bow_Lv = 1,
    Equipped_Axe_Lv = 1,
    Equipped_Spear_Lv = 1,
    --资产信息
    Coin = 5000,                  --金币
    Diamond = 1000,               --砖石
    GoldBox = 2,                  --金宝箱
    SilverBox = 2,                --银宝箱
    NormalBox = 1,                --普通宝箱
    --其它信息
    Player_MaxAdFreeWatch_Num = 5,--玩家最大免费观看广告次数
    Player_HasAdFreeWatch_Num = 0,--玩家已经免费观看广告次数
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
    if self.CurrentModule then
        self.CurrentModule:Update(DeltaTime)
    end

    -- 累计计时器
    self._timeAccumulator = (self._timeAccumulator or 60) + DeltaTime
    if self._timeAccumulator < 60 then
        return
    end
    self._timeAccumulator = self._timeAccumulator - 60

    -- 当前时间
    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    -- 当前年月日
    local year = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Year)
    local month= MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Month)
    local day  = MiscService:GetServerTimeToTime(MiscService.ETimeUnit.Day)

    -- 当日0点时间戳
    local zeroTimestamp = MiscService:DateYMDHMSToTime(
        string.format("%04d-%02d-%02d 00:00:00", year, month, day)
    )

    -- 已过秒数，当天剩余秒数
    local secondsPassed = nowTs - zeroTimestamp
    local secondsLeft = 24 * 3600 - secondsPassed

    -- 格式化当天剩余时间时分秒
    local leftHour = math.floor(secondsLeft / 3600)
    local leftMin = math.floor((secondsLeft % 3600) / 60)
    local leftStr = string.format("%02d时%02d分", leftHour, leftMin)

    -- 当前星期几（假设周一=1, 周日=7）
    local wday = GameUtils.GetWeekDay()

    -- 计算距离本周剩余秒数
    -- 一周剩余天数 = 7 - 当前周几
    local daysLeft = 7 - wday

    -- 一周剩余秒数 = 今天剩余秒 + 剩余天数 * 24 * 3600
    local weekSecondsLeft = secondsLeft + daysLeft * 24 * 3600

    local weekLeftDays = math.floor(weekSecondsLeft / (24 * 3600))
    local weekLeftHours = math.floor((weekSecondsLeft % (24 * 3600)) / 3600)

    local weekLeftStr = string.format("%d天 %02d时", weekLeftDays, weekLeftHours)

    print("当前时间:", nowStr, "距今日剩余:", leftStr, "距离本周剩余:", weekLeftStr)

    UI:SetText({UIConfig.TaskView.TaskProcesView.Time}, "剩余时间：" .. leftStr)
    UI:SetText({UIConfig.SevenDays.Time, UIConfig.TournamentView.World.CountDown, UIConfig.TournamentView.Gold.CountDown, UIConfig.TournamentView.Diamond.CountDown}, weekLeftStr)
    UI:SetText({105035}, weekLeftStr)

     --商城视图
     local StoreView = UIConfig.StoreView
     --加载商城活动
     local Activities = StoreView.Activities
     --1、限定奖池【一周】
     UI:SetText({Activities[1].CountDown}, weekLeftStr)
     --2、每日限购【一天】
     UI:SetText({Activities[2].CountDown}, leftStr)
     --3、免费砖石【一天】
     UI:SetText({Activities[3].CountDown}, leftStr)

     -- 跨天检测，保存昨天的年月日
    if not self._lastDate then
        self._lastDate = {year=year, month=month, day=day}
    else
        if year ~= self._lastDate.year or month ~= self._lastDate.month or day ~= self._lastDate.day then
            self:RefreshDaily()
            self:RuntimeDailyRefresh()
            self._lastDate = {year=year, month=month, day=day}
        end
    end

    -- 跨周检测，保存上次周几
    if not self._lastWeekday then
        self._lastWeekday = wday
    else
        if wday < self._lastWeekday then -- 因为周一=1，周日=7，周数回到1即跨周
            self:RefreshWeekly()
            self:RuntimeWeeklyRefresh()
            self._lastWeekday = wday
        else
            self._lastWeekday = wday
        end
    end
end

--- 关闭
function LobbyModule:Close()
    if self.CurrentModule then
        self.CurrentModule:Close()
        self.CurrentModule = nil
    end

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
    --加载基础数据
    for ArchiveKey, ArchiveValue in pairs(DefaultBaseData) do
        if not DataCenter.GetNumber(ArchiveKey, true) then
            DataCenter.SetNumber(ArchiveKey, ArchiveValue)
        end
    end

    --2、装备数据
    --2.1、初始化装备
    local AllEquipment = DataCenter.GetTable("AllEquipment", true)
    if not AllEquipment then
        DataCenter.SetTable("AllEquipment", self:DefaultEquipmentData())
    end
    self:RefreshEquipmentData()

    --3、商店数据
    local AllShops = DataCenter.GetTable("AllShops", true)
    if not AllShops then
        DataCenter.SetTable("AllShops", self:DefaultShopData())
        --刷新限定奖池
        self:RefreshWeekly()
        self:RefreshDaily()
    end

    local nowStr = MiscService:GetServerTimeToTime()
    local nowTs = MiscService:DateYMDHMSToTime(nowStr)

    local lastLoginTime = DataCenter.GetNumber("Player_LastLoginTime_Num")
    if lastLoginTime == nil or lastLoginTime == 0 or lastLoginTime > nowTs then
        lastLoginTime = nowTs - (7 * 24 * 60 * 60)
    end

    if GameUtils.isCrossDay(lastLoginTime) then
        --跨天登录了
        Log:PrintLog("跨天登录了")
        self:RefreshDaily()

        self:RuntimeDailyRefresh()
    end
    if GameUtils.isCrossWeek(lastLoginTime) then
        --跨周登录了
        Log:PrintLog("跨周登录了")
        self:RefreshWeekly()

        self:RuntimeWeeklyRefresh()
    end
    DataCenter.SetNumber("Player_LastLoginTime_Num", nowTs)
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
    local BodyEquipment = DataCenter.Get("BodyEquipment")
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

function LobbyModule:SwitchView(ViewName, Context)
    local TitleBar = UIConfig.MainView.TitleBar
    local ViewData = TitleBar[ViewName]
    if self.CurrentViewData ~= ViewData then
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
        self:OnSwitchView(ViewName, Context)
    end
end

function LobbyModule:OnSwitchView(ViewName, Context)
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
        TargetModule:Open(Context)
        self.CurrentModule = TargetModule
    end
end

function LobbyModule:RegisterGameEvent()
    --跳转商城
    System:RegisterGameEvent(_GAME.Events.JumpModule, function(ModuleName, Context)
        self:SwitchView(ModuleName, Context)
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
    for ID, EquipmentData in pairs(EquipmentConfig) do
        local Equipment = {
            ID = ID,                                --装备编号
            Level = 1,                              --装备等级
            Piece = 0,                              --碎片数量
            Category = EquipmentData.Category,      --装备类别
            Unlock = false,                         --是否解锁
            Equipped = false,                       --是否装备
        }
        --基础数据名称
        local IDName = string.format("Equipped_%s_ID", EquipmentData.TypeName)
        local TargetID = DefaultBaseData[IDName]
        if TargetID == ID then
            Equipment.Unlock = true
            Equipment.Equipped = true
            Equipment.Piece = 10    --缺省十个
            Equipment.Level = 3     --缺省三级
        end
        local LvName = string.format("Equipped_%s_Lv", EquipmentData.TypeName)
        DefaultBaseData[LvName] = Equipment.Level
        AllEquipment[ID] = Equipment
    end
    return AllEquipment
end

--- 刷新装备
function LobbyModule:RefreshEquipmentData()
    local AllEquipment = DataCenter.GetTable("AllEquipment")
    --2.2、装备分类
    --按类型分组且品质降序
    local GroupByCategory = {}
    --按品质分组
    local GroupByGrade = {}
    --装备槽【六个部位】
    local BodyEquipment = {}
    for _, Equipment in pairs(AllEquipment) do
        --获取装备数据
        local EquipmentData = EquipmentConfig[Equipment.ID]
        --回写装备品质
        Equipment.Grade = EquipmentData and EquipmentData.Attributes.Grade or 1

        --按种类分类
        local Group1 = GroupByCategory[Equipment.Category]
        if not Group1 then
            Group1 = {}
            GroupByCategory[Equipment.Category] = Group1
        end
        table.insert(Group1, Equipment)

        --按品质分类
        local Group2 = GroupByGrade[Equipment.Grade]
        if not Group2 then
            Group2 = {}
            GroupByGrade[Equipment.Grade] = Group2
        end
        table.insert(Group2, Equipment)

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
            --刷新基础数据
            if EquipmentData then
                local IDName = string.format("Equipped_%s_ID", EquipmentData.TypeName)
                DefaultBaseData[IDName] = Equipment.ID
                local LvName = string.format("Equipped_%s_Lv", EquipmentData.TypeName)
                DefaultBaseData[LvName] = Equipment.Level
            end
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
    DataCenter.Put("GroupByCategory", GroupByCategory)
    DataCenter.Put("GroupByGrade", GroupByGrade)
    DataCenter.Put("BodyEquipment", BodyEquipment)
    --统计已穿戴装备的ID和等级
    --重新刷新外观
    self:RefreshAvatar()

    --存档
    DataCenter.SetTable("AllEquipment", AllEquipment)
end

--- 初始化一套缺省的商店信息【这里需要设计商品配置，包含商品类型、消耗方式信息等】
function LobbyModule:DefaultShopData()
    --没有则初始化
    local AllShops = {}
    --3.1、限定奖池
    AllShops.LimitItem = {
        [1] = {
            --费用
            Costs = {
                [1] = {
                    --消耗一个黄金宝箱【约定：关系或】
                    GoldBox = 1,
                    --或者600个砖石
                    Diamond = 600,
                },
                [2] = {
                    --广告资源
                    AdTag = "ad_tag_gold_box",
                    --广告冷却时间
                    AdCoolTime = 24 * 3600,
                    --点击时间戳
                    ClickTimestamp = 0
                }
            },
            --商品
            Goods = {
                --从宝箱配置中去拿
                Equipments = {}
            }
        },
        [2] = {
            --费用
            Costs = {
                [1] = {
                    --消耗一个白银宝箱【约定：关系或】
                    SilverBox = 1,
                    --或者600个砖石
                    Diamond = 180,
                },
                [2] = {
                    --广告资源
                    AdTag = "ad_tag_silver_box",
                    --广告冷却时间
                    AdCoolTime = 24 * 3600,
                    --点击时间戳
                    ClickTimestamp = 0
                }
            },
            --商品
            Goods = {
                --从宝箱配置中去拿
                Equipments = {}
            }
        },
    }
    --3.2、每日限购
    AllShops.DailyItem = {
        [1] = {
            --费用
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 100,
                    --最大收集次数
                    MaxCollect = 5,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                Equipments = {}
            }
        },
        [2] = {
            --费用
            Costs = {
                [1] = {
                    --消耗50个砖石
                    Diamond = 50,
                    --最大收集次数
                    MaxCollect = 5,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                Equipments = {}
            }
        },
        [3] = {
            --费用
            Costs = {
                [1] = {
                    --消耗100个砖石
                    Diamond = 600,
                    --最大收集次数
                    MaxCollect = 5,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                Equipments = {}
            }
        }
    }
    --3.3、免费砖石
    AllShops.DiamondItem = {
        [1] = {
            --费用【约定：关系或】
            Costs = {
                [1] = {
                    --广告资源
                    AdTag = "ad_tag_diamond",
                    --最大收集次数
                    MaxCollect = 5,
                    --已收集次数
                    HasCollect = 0
                }
            },
            --商品
            Goods = {
                --获得砖石
                Diamond = 60
            }
        }
    }
    --3.4、购买金币
    AllShops.CoinItem = {
        [1] = {
            --费用
            Costs = {
                [1] = {
                    --广告资源
                    AdTag = "ad_tag_coin",
                }
            },
            --商品
            Goods = {
                Coin = 1500,
            }
        },
        [2] = {
            --费用
            Costs = {
                [1] = {
                    --消耗12000个砖石
                    Diamond = 1000,
                }
            },
            --商品
            Goods = {
                Coin = 12000,
            }
        },
        [3] = {
            --费用
            Costs = {
                [1] = {
                    --消耗4200个砖石
                    Diamond = 4200,
                }
            },
            --商品
            Goods = {
                Coin = 37000,
            }
        }
    }
    return AllShops
end

--- 每日刷新
function LobbyModule:RefreshDaily()
    --刷新每日限购
    local AllShops = DataCenter.GetTable("AllShops")
    local AllDailyItem = AllShops.DailyItem
    --概率表
    local GradeProbability = {}
    local Weight = 0
    for _, Config in ipairs(GoodsConfig) do
        Weight = Weight + Config.Weight
        GradeProbability[Config.Grade] = Weight
    end
    local RandomGoodConfig = function()
        --摇骰子
        local RandomValue = math.random(1, Weight)
        local TargetGrade = 1
        local MinValue = 0
        local MaxValue
        for Grade = 1, 4 do
            MaxValue = GradeProbability[Grade]
            if RandomValue >= MinValue and RandomValue <= MaxValue then
                TargetGrade = Grade
                break
            end
            MinValue = MaxValue
        end
        return GoodsConfig[TargetGrade]
    end
    math.randomseed(TimerManager:GetClock())
    for _, DailyItem in pairs(AllDailyItem) do
        --根据权重随机一个品质
        local TargetGoodConfig = RandomGoodConfig()
        --编组
        local GroupByGrade = DataCenter.Get("GroupByGrade")
        local EquipmentGroup = GroupByGrade[TargetGoodConfig.Grade]
        local EquipmentID = EquipmentGroup[math.random(1, #EquipmentGroup)].ID
        DailyItem.Costs[1].MaxCollect = TargetGoodConfig.Times
        DailyItem.Costs[1].HasCollect = 0
        DailyItem.Costs[1].Diamond = TargetGoodConfig.Price
        local Goods = DailyItem.Goods
        Goods.Equipments = {}
        Goods.Equipments[1] = { ID = EquipmentID }
    end

    --刷新免费砖石
    local AllDiamondItem = AllShops.DiamondItem
    AllDiamondItem[1].Costs[1].MaxCollect = 5
    AllDiamondItem[1].Costs[1].HasCollect = 0
    DataCenter.SetTable("AllShops", AllShops)

    --免费广告观看次数
    DataCenter.SetNumber("Player_HasAdFreeWatch_Num", 0)
end

--- 每周刷新
function LobbyModule:RefreshWeekly()
    --刷新限定奖池
    math.randomseed(TimerManager:GetClock())
    local WeekIndex = math.random(1, 60)
    local AllShops = DataCenter.GetTable("AllShops")
    local AllLimitItem = AllShops.LimitItem
    for _, LimitItem in pairs(AllLimitItem) do
        local BoxEquipmentIdsSet
        if LimitItem.Costs[1].GoldBox then
            BoxEquipmentIdsSet = OpenBoxConfig.GoldBox[3].EquipIds
        elseif LimitItem.Costs[1].SilverBox then
            BoxEquipmentIdsSet = OpenBoxConfig.SilverBox[3].EquipIds
        end
        local Goods = LimitItem.Goods
        Goods.Equipments = {}
        if BoxEquipmentIdsSet then
            WeekIndex = WeekIndex % #BoxEquipmentIdsSet
            if WeekIndex == 0 then
                WeekIndex = 1
            end
            local BoxEquipmentIds = BoxEquipmentIdsSet[WeekIndex]
            for Index, BoxEquipmentId in ipairs(BoxEquipmentIds) do
                Goods.Equipments[Index] = { ID = BoxEquipmentId }
            end
        end
    end
end

--- 刷新商店
function LobbyModule:RefreshStoreData()
    --存档
    local AllShops = DataCenter.GetTable("AllShops")
    DataCenter.SetTable("AllShops", AllShops)
end

--- 刷新通用资源栏
function LobbyModule:RefreshGeneralResourceBar()
    local MainView = UIConfig.MainView
    local GeneralResourceBar = MainView and MainView.GeneralResourceBar
    if GeneralResourceBar then
        --玩家图标
        --目前API侧无法读取玩家图标，暂时使用这个
        --获取头像
        UI:SetImage({GeneralResourceBar.PlayerIcon}, Chat:GetCustomHeadIcon(self.PlayerID))
        local score = GameUtils.GetPlayerRankScore()
        local level = GameUtils.GetRankLevelByScore(score)
        UI:SetText({GeneralResourceBar.Rank.Label}, level.name)
        GameUtils.SetImageWithAsset(GeneralResourceBar.Rank.Icon, "Rank", level.icon)
        UI:SetText({GeneralResourceBar.GoldCoins.Label}, tostring(DataCenter.GetNumber("Coin")))
        UI:SetText({GeneralResourceBar.Diamonds.Label}, tostring(DataCenter.GetNumber("Diamond")))
        UI:SetText({GeneralResourceBar.Securities.Label}, tostring(DataCenter.GetNumber("Player_BattlePoints_Num")))
    end
end

--- 刷新商店资源栏
function LobbyModule:RefreshStoreResourceBar()
    local MainView = UIConfig.MainView
    local StoreResourceBar = MainView and MainView.StoreResourceBar
    if StoreResourceBar then
        UI:SetText({StoreResourceBar.GoldBox.Label}, tostring(DataCenter.GetNumber("GoldBox")))
        UI:SetText({StoreResourceBar.SilverBox.Label}, tostring(DataCenter.GetNumber("SilverBox")))
        UI:SetText({StoreResourceBar.Diamonds.Label}, tostring(DataCenter.GetNumber("Diamond")))
    end
end

--- 游玩跨天刷新逻辑
function LobbyModule:RuntimeDailyRefresh()
    DataCenter.SetNumber("Player_TaskDailyExp_Num", 0)
    DataCenter.SetNumber("Player_CollectTaskDaily_Num", 0)

    GameUtils.SetGoldBattleCount(3)

    local score = GameUtils.GetPlayerRankScore()
    if GameUtils.IsReachDiamondRank(score) then
        GameUtils.AddPlayerReward(100003, 2)
    end
end

--- 游玩跨周刷新逻辑
function LobbyModule:RuntimeWeeklyRefresh()
    local score = GameUtils.GetPlayerRankScore()
    --跨周登录了，重置每周任务经验
    DataCenter.SetNumber("Player_TaskWeeklyExp_Num", 0)
    DataCenter.SetNumber("Player_CollectTaskWeekly_Num", 0)
    local level = GameUtils.GetRankLevelByScore(score)
    DataCenter.SetNumber("ReachDiamondRank", 0)

    --突破段位可领取段位奖励
    local RankBoxReward_Table = {}
    DataCenter.SetTable("RankBoxReward_Table", RankBoxReward_Table)

    --已领取的段位奖励
    local ReceiveRankBoxReward_Table = {}
    DataCenter.SetTable("ReceiveRankBoxReward_Table", ReceiveRankBoxReward_Table)

    --段位奖励发放
    local RewardConfig = require "Game.Target.ArcherDuel.Config.RewardConfig"
    if RewardConfig and RewardConfig.Rank_Rewards[level.base_score] then
        local Reward = RewardConfig.Rank_Rewards[level.base_score]
        for k, v in pairs(Reward) do
            GameUtils.AddPlayerReward(v.id, v.count)
        end
    end

    -- 掉段逻辑
    if level and level.titleLv <= 3 then
        GameUtils.SetPlayerRankScore(0)
    else
        local resettitleLv = level.titleLv - 2
        local titleLvLevel = GameUtils.GetRankLevelByTitleLv(resettitleLv)
        GameUtils.SetPlayerRankScore(titleLvLevel.base_score)
    end

    local Rank_DiamondScore_Num = 90
    if Rank_DiamondScore_Num and Rank_DiamondScore_Num > 0 then
        local DiamondRankManager = require("Game.Framework.Rank.DiamondRank")
        local DiamondRankData = DiamondRankManager.GetLastWeekPlayerDataDiamondRank()
        local isRank = false
        local RankNum = 100
        local DiamondRankCount = DiamondRankData and #DiamondRankData or 0
        local DiamondRankItem = DiamondRankData and DiamondRankData[DiamondRankCount - 1]
        if DiamondRankItem and DiamondRankItem.DiamondScore and Rank_DiamondScore_Num > DiamondRankItem.DiamondScore then
            isRank = true
            table.remove(DiamondRankData, DiamondRankCount)
            table.insert(DiamondRankData, { DiamondScore = Rank_DiamondScore_Num , isPlayer = true})
            table.sort(DiamondRankData, function(a,b) return a.DiamondScore > b.DiamondScore end)
        end
        for i, v in ipairs(DiamondRankData) do
            if v.isPlayer then
                RankNum = i
            end
        end

        if isRank then
            Log:PrintDebug("玩家上周的钻石排名是：" .. RankNum .. "")
            if RankNum > 6 then
                --6名开外都按6名的奖励发放
                RankNum = 6
            end
            local DiamondRewards = RewardConfig.Diamond_Rewards[RankNum]
            if DiamondRewards then
                for _, v in pairs(DiamondRewards) do
                    GameUtils.AddPlayerReward(v.id, v.count)
                end
            end
        end
    end
end

return LobbyModule