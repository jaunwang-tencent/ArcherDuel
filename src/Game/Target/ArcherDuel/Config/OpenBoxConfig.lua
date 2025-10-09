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
    -- 第二个物品（必定钻石），可看广告翻三倍
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
    },
    -- 第三个物品（必定金币），可看广告翻三倍
    [3] = {
        {
            -- 金币数量
            Count = 400,
            -- 权重
            Weight = 4
        },
        {
            -- 金币数量
            Count = 500,
            -- 权重
            Weight = 3
        },
        {
            -- 金币数量
            Count = 800,
            -- 权重
            Weight = 2
        },
        {
            -- 金币数量
            Count = 1000,
            -- 权重
            Weight = 1
        },
    },
}

-- 顶级宝箱，每次开启出三个物品
OpenBoxConfig.GoldBox = {
    [1] = {
        -- 品阶
        Grade = 2,
        -- 权重
        Weight = 5,
    },
    [2] = {
        -- 品阶
        Grade = 3,
        -- 权重
        Weight = 3,
    },
    [3] = {
        -- 品阶
        Grade = 4,
        -- 权重
        Weight = 1,
        -- 每周轮转
        EquipIds = {
            [1] = {
                6,33,56,72,88,104,
            },
            [2] = {
                8,34,57,71,87,103,
            },
            [3] = {
                7,35,58,76,92,108
            },
            [4] = {
                9,36,59,74,90,106
            },
            [5] = {
                10,37,60,69,85,101
            },
        }
    },
}

-- 高级宝箱，每次开启出三个物品
OpenBoxConfig.SilverBox = {
    [1] = {
        -- 品阶
        Grade = 1,
        -- 权重
        Weight = 3,
    },
    [2] = {
        -- 品阶
        Grade = 2,
        -- 权重
        Weight = 5,
    },
    [3] = {
        -- 品阶
        Grade = 3,
        -- 权重
        Weight = 1,
        -- 每周轮转
        EquipIds = {
            [1] = {
                4,32,55,65,81,97,
            },
            [2] = {
                5,31,54,66,82,98,
            },
            [3] = {
                4,32,55,67,83,99
            },
            [4] = {
                5,31,54,68,84,100
            },
        }
    },
}

-- 普通宝箱，每次开启出三个物品
OpenBoxConfig.NormalBox = {
    [1] = {
        -- 品阶
        Grade = 1,
        -- 权重
        Weight = 7,
    },
    [2] = {
        -- 品阶
        Grade = 2,
        -- 权重
        Weight = 3,
    },
}

return OpenBoxConfig