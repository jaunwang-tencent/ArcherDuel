-- 每日限购商品配置
-- 三个栏位分别随机一次，然后在对应品阶的所有装备里随机一个
local GoodsConfig = {
    [1] = {
        -- 商品的品阶
        Grade = 1,
        -- 价格（钻石）
        Price = 50,
        -- 限购次数
        Times = 3,
        -- 权重
        Weight = 10
    },
    [2] = {
        -- 商品的品阶
        Grade = 2,
        -- 价格（钻石）
        Price = 100,
        -- 限购次数
        Times = 2,
        -- 权重
        Weight = 10
    },
    [3] = {
        -- 商品的品阶
        Grade = 3,
        -- 价格（钻石）
        Price = 200,
        -- 限购次数
        Times = 1,
        -- 权重
        Weight = 5
    },
    [4] = {
        -- 商品的品阶
        Grade = 4,
        -- 价格（钻石）
        Price = 600,
        -- 限购次数
        Times = 1,
        -- 权重
        Weight = 5
    },
}

return GoodsConfig