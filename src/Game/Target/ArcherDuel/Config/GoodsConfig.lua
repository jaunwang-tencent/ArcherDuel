--这里需要设计商品配置
local GoodsConfig = {
    [1] = {
        ID = 1,
        -- 商品类别，用于区分索引的config
        Type = "Equipment",
        -- 对应config编号
        Index = 1,
        -- 价格（钻石）
        Price = 200,
        -- 限购次数
        Times = 2,
        -- 权重
        Weight = 10
    }
}

return GoodsConfig