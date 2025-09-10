local OpenBoxConfig = {}

-- 战斗内宝箱奖池，每次开启出二个物品
OpenBoxConfig.BattleBox = {
    {
        -- 品阶
        Grade = 1,
        -- 权重
        Weight = 7,
    },
    {
        -- 品阶
        Grade = 2,
        -- 权重
        Weight = 2,
    },
    {
        -- 品阶
        Grade = 3,
        -- 权重
        Weight = 1,
    },
}

-- 段位突破奖励，出三个指定类型物品
OpenBoxConfig.RankBox = {
    -- 第一个物品（必定装备）
    [1] = {
        {
            -- 品阶
            Grade = 1,
            -- 权重
            Weight = 7,
        },
        {
            -- 品阶
            Grade = 2,
            -- 权重
            Weight = 2,
        },
        {
            -- 品阶
            Grade = 3,
            -- 权重
            Weight = 1,
        },
    },
    [2] = {
        {
            -- 钻石数量
            Count = 40,
            -- 权重
            Weight = 4
        },
        {
            -- 钻石数量
            Count = 50,
            -- 权重
            Weight = 3
        },
        {
            -- 钻石数量
            Count = 60,
            -- 权重
            Weight = 2
        },
        {
            -- 钻石数量
            Count = 70,
            -- 权重
            Weight = 1
        },
    }
}

-- 顶级宝箱，每次开启出三个物品
OpenBoxConfig.GoldBox = {
    {
        -- 品阶
        Grade = 2,
        -- 权重
        Weight = 5,
    },
    {
        -- 品阶
        Grade = 3,
        -- 权重
        Weight = 3,
    },
    {
        -- 品阶
        Grade = 4,
        -- 权重
        Weight = 1,
        -- 每周轮转
        EquipIds = {
            [1] = {
                6,7,8,9,10,11,
            },
            [2] = {
                12,33,34,35,36,37,
            },
            [3] = {
                56,57,58,59,60,69,
            },
        }
    },
}

-- 高级宝箱，每次开启出三个物品
OpenBoxConfig.SilverBox = {
    {
        -- 品阶
        Grade = 1,
        -- 权重
        Weight = 3,
    },
    {
        -- 品阶
        Grade = 2,
        -- 权重
        Weight = 5,
    },
    {
        -- 品阶
        Grade = 3,
        -- 权重
        Weight = 1,
        -- 每周轮转
        EquipIds = {
            [1] = {
                65,66,67,68,81,82,
            },
            [2] = {
                4,5,31,32,54,55,
            },
            [3] = {
                83,84,97,98,99,100
            },
        }
    },
}

return OpenBoxConfig