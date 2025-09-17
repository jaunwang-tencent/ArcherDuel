-- 金币 100001
-- 钻石 100002
-- 普通宝箱 200001
-- 高级宝箱 200002
-- 极品宝箱 200003
local ResourceConfig = {
    [100001] = { name="金币", iconIndex=4, archive = "Coin" },
    [100002] = { name="钻石", iconIndex=6, archive = "Diamond" },
    [100003] = { name="钻石联赛券", iconIndex=6, archive = "ticket" },
    [200001] = { name="普通宝箱", iconIndex=3, archive = "NormalBox"},
    [200002] = { name="高级宝箱", iconIndex=2, archive = "SilverBox"},
    [200003] = { name="极品宝箱", iconIndex=1, archive = "GoldBox"},
}

return ResourceConfig