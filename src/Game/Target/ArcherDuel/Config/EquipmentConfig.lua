
-- 装备配置
local EquipmentConfig = {
    [1] = {
        --角色1
        TypeName = "Part",
        NickName = "哈士奇",
        EquipID = 400100,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 10,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 6,
        },
    },
    [2] = {
        --角色2
        TypeName = "Part",
        NickName = "好好鸭",
        EquipID = 400110,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 12,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 6,
        },
    },
    [3] = {
        --角色3
        TypeName = "Part",
        NickName = "紫萝萝",
        EquipID = 400380,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 10,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 7,
        },
    },
    [4] = {
        --角色4
        TypeName = "Part",
        NickName = "巨鳄霸",
        --角色
        EquipID = 400210,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 14,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 6,
        },
    },
    [5] = {
        --角色5
        TypeName = "Part",
        NickName = "羊小萌",
        EquipID = 400480,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 14,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 6,
        },
    },
    [6] = {
        --角色6
        TypeName = "Part",
        NickName = "小红狐",
        EquipID = 400470,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [7] = {
        --角色7
        TypeName = "Part",
        NickName = "玫珊珊",
        EquipID = 400390,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 7,  -- 降低攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外极伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 9,  -- 提高成长值 (满级为52 > 46, 差值为8)
        },
    },
    [8] = {
        --角色8
        TypeName = "Part",
        NickName = "哞哞牛",
        EquipID = 400070,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 13,  -- 降低攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干极外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准极
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色极4=金色)
            Grade = 4,
            -- 成长值
            Growth = 7,  -- 提高成长值 (13+7 * 5=48 > 46, 差值为2)
        },
    },
    [9] = {
        --角色9
        TypeName = "Part",
        NickName = "鼠朵朵",
        EquipID = 402390,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease  = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [10] = {
        --角色10
        TypeName = "Part",
        NickName = "胖胖达",
        EquipID = 400140,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [11] = {
        --角色11
        TypeName = "Part",
        NickName = "小青蛙",
        EquipID = 402930,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 26,  -- 提高攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 2,  -- 降低成长值 (36 < 46, 差值为10)
        },
    },
    [12] = {
        --角色12
        TypeName = "Part",
        NickName = "易斑斑",
        EquipID = 400020,
        Category = 1,
        --属性极
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 19,  -- 提高攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 5,  -- 降低成长值 (19+5 * 5=44 < 46, 差值为2)
        },
    },
    [13] = {
        --角色13
        TypeName = "Part",
        NickName = "卡皮巴拉",
        EquipID = 401370,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增极
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [14] = {
        --角色14
        TypeName = "Part",
        NickName = "虎子哥",
        EquipID = 400080,
        Category = 1,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增极
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [15] = {
        --上衣1
        TypeName = "Cloth",
        NickName = "少年时代上装",
        --换装ID
        EquipID = 510080,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 125,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 24,

        },
    },
    [16] = {
        --上衣2
        TypeName = "Cloth",
        NickName = "沙滩旅客上装",
        --换装ID
        EquipID = 510020,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 130,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 23,

        },
    },
    [17] = {
        --上衣3
        TypeName = "Cloth",
        NickName = "清爽运动上装",
        --换装ID
        EquipID = 510008,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 110,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 27,

        },
    },
    [18] = {
        --上衣4
        TypeName = "Cloth",
        NickName = "邻家学妹上装",
        --换装ID
        EquipID = 510133,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 120,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 25,

        },
    },
    [19] = {
        --上衣5
        TypeName = "Cloth",
        NickName = "蓝色童话上装",
        --换装ID
        EquipID = 510045,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 120,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 25,

        },
    },
    [20] = {
        --上衣6
        TypeName = "Cloth",
        NickName = "白桃气泡上装",
        --换装ID
        EquipID = 510044,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 120,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 25,
        },
    },
    [21] = {
        --上衣7
        TypeName = "Cloth",
        NickName = "星小递上装",
        --换装ID
        EquipID = 510019,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 160 , --提高基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 30 , --提高成长值（310< 340 ,差值为30）
        },
    },
    [22] = {
        --上衣8
        TypeName = "Cloth",
        NickName = "芝士桃桃上装",
        --换装ID
        EquipID = 510041,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [23] = {
        --上衣9
        TypeName = "Cloth",
        NickName = "三花摩卡上装",
        --换装ID
        EquipID = 510043,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 160 , --提高基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 30 , --提高成长值（310< 340 ,差值为30）
        },
    },
    [24] = {
        --上衣10
        TypeName = "Cloth",
        NickName = "专业态度上装",
        --换装ID
        EquipID = 510216,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [25] = {
        --上衣11
        TypeName = "Cloth",
        NickName = "活力绅士上装",
        --换装ID
        EquipID = 510206,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 120 , 
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 50 , 
        },
    },
    [26] = {
        --上衣12
        TypeName = "Cloth",
        NickName = "春风探险上装",
        --换装ID
        EquipID = 510131,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [27] = {
        --上衣13
        TypeName = "Cloth",
        NickName = "彩虹旋律上装",
        --换装ID
        EquipID = 510028,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 130 , --提高基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 45 , --提高成长值（310< 340 ,差值为30）
        },
    },
    [28] = {
        --上衣14
        TypeName = "Cloth",
        NickName = "烘焙甜心上装",
        --换装ID
        EquipID = 510029,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [29] = {
        --上衣15
        TypeName = "Cloth",
        NickName = "灰色边缘上装",
        --换装ID
        EquipID = 510018,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 170 , --提高基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 25 , --提高成长值（310< 340 ,差值为30）
        },
    },
    [30] = {
        --上衣16
        TypeName = "Cloth",
        NickName = "蓝莓戚风上装",
        --换装ID
        EquipID = 510050,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [31] = {
        --上衣17
        TypeName = "Cloth",
        NickName = "红梅丝绒上装",
        --换装ID
        EquipID = 510032,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 190 , --提高基础值
            -- 攻击力
            Attack =0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 40,--降低（390< 410 ,差值为20）
        },
    },
    [32] = {
        --上衣18
        TypeName = "Cloth",
        NickName = "最佳员工上装",
        --换装ID
        EquipID = 510005,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,  --降低基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 60, --提高成长值（440< 410 ,差值为30）
        },
    },
    [33] = {
        --上衣19
        TypeName = "Cloth",
        NickName = "绅士礼服上装",
        --换装ID
        EquipID = 510096,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 180,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 55,  -- 保持不变
        },
    },
    [34] = {
        --上衣20
        TypeName = "Cloth",
        NickName = "海岛风情上装",
        --换装ID
        EquipID = 510350,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 155,
            -- 攻击力
            Attack = 0, 
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外极伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 70,  -- 提高成长值 (505 > 455, 差值为50)
        },
    },
    [35] = {
        --上衣21
        TypeName = "Cloth",
        NickName = "海岛一刻上装",
        --换装ID
        EquipID = 510157,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 180,
            -- 攻击力
            Attack =0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease  = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 55,  -- 保持不变
        },
    },
    [36] = {
        --上衣22
        TypeName = "Cloth",
        NickName = "春日校园上装",
        --换装ID
        EquipID = 510130,
        Category = 2,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 340,
            -- 攻击力
            Attack = 0,  
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 10,  -- 降低成长值 (390 < 455, 差值为60)
        },
    },
    [37] = {
        --上衣23
        TypeName = "Cloth",
        NickName = "青春筑梦上装",
        --换装ID
        EquipID = 510170,
        Category = 2,
        --属性极
        Attributes = {
            -- 生命值
            Heal = 260,
            -- 攻击力
            Attack =0,  -- 提高攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 32,  -- 降低成长值 (420 < 455, 差值为35)
        },
    },
    [38] = {
        --下装1
        TypeName = "Bottoms",
        NickName = "少年时代下装",
        --换装ID
        EquipID = 520052,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 63,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 3,
        },
    },
    [39] = {
        --下装2
        TypeName = "Bottoms",
        NickName = "沙滩旅客下装",
        --换装ID
        EquipID = 520017,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 68,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 1,
        },
    },
    [40] = {
        --下装3
        TypeName = "Bottoms",
        NickName = "清爽运动下装",
        --换装ID
        EquipID = 520008,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 65,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 2,
        },
    },
    [41] = {
        --下装4
        TypeName = "Bottoms",
        NickName = "邻家学妹下装",
        --换装ID
        EquipID = 520088,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 65,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 2,
        },
    },
    [42] = {
        --下装5
        TypeName = "Bottoms",
        NickName = "蓝色童话下装",
        --换装ID
        EquipID = 520035,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 65,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 2,
        },
    },
    [43] = {
        --下装6
        TypeName = "Bottoms",
        NickName = "白桃气泡下装",
        --换装ID
        EquipID = 520034,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 50,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 5,
        },
    },
    [44] = {
        --下装7
        TypeName = "Bottoms",
        NickName = "星小递下装",
        --换装ID
        EquipID = 520016,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 78, -- 提高基础值
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 1,  -- 降低成长值 （83 < 88, 差值为5）
        },
    },
    [45] = {
        --下装8
        TypeName = "Bottoms",
        NickName = "芝士桃桃下装",
        --换装ID
        EquipID = 520031,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 72,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 4,
        },
    },
    [46] = {
        --下装9
        TypeName = "Bottoms",
        NickName = "三花摩卡下装",
        --换装ID
        EquipID = 520033,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 71, 
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 5,
        },
    },
    [47] = {
        --下装10
        TypeName = "Bottoms",
        NickName = "专业态度下装",
        --换装ID
        EquipID = 520153,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 78, -- 提高基础值
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 1,  -- 降低成长值 （83 < 88, 差值为5）
        },
    },
    [48] = {
        --下装11
        TypeName = "Bottoms",
        NickName = "活力绅士下装",
        --换装ID
        EquipID = 520145,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 73,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3,
        },
    },

    [49] = {
        --下装12
        TypeName = "Bottoms",
        NickName = "春风探险下装",
        --换装ID
        EquipID = 520087,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 73,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3,
        },
    },
    [50] = {
        --下装13
        TypeName = "Bottoms",
        NickName = "彩虹旋律下装",
        --换装ID
        EquipID = 520026,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 73,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3,
        },
    },
    [51] = {
        --下装14
        TypeName = "Bottoms",
        NickName = "烘焙甜心下装",
        --换装ID
        EquipID = 520027,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 70,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 4,
        },
    },
    [52] = {
        --下装15
        TypeName = "Bottoms",
        NickName = "灰色边缘下装",
        --换装ID
        EquipID = 520015,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy =60,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 7,
        },
    },
    [53] = {
        --下装16
        TypeName = "Bottoms",
        NickName = "蓝莓戚风下装",
        --换装ID
        EquipID = 520040,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 73, 
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3,
        },
    },
    [54] = {
        --下装17
        TypeName = "Bottoms",
        NickName = "红梅丝绒下装",
        --换装ID
        EquipID = 520030,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack =0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 78,  --降低精准度
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 7, --提升成长值（113>106 差值为7）
        },
    },
    [55] = {
        --下装18
        TypeName = "Bottoms",
        NickName = "最佳员工下装",
        --换装ID
        EquipID = 520005,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 95, --提升基础值
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 1,  --降低成长值 （100<106,插值为6）
        },
    },
    [56] = {
        --下装19
        TypeName = "Bottoms",
        NickName = "绅士礼服下装",
        --换装ID
        EquipID = 520065,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 90,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 4,  -- 保持不变
        },
    },
    [57] = {
        --下装20
        TypeName = "Bottoms",
        NickName = "海岛风情下装",
        --换装ID
        EquipID = 520233,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0, 
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外极伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 80,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 8,  -- 提高成长值 (120 > 110, 差值为10)
        },
    },
    [58] = {
        --下装21
        TypeName = "Bottoms",
        NickName = "海岛一刻下装",
        --换装ID
        EquipID = 520108,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干极外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准极
            Accuracy = 89,
            -- 品阶(1=绿色,2=蓝色,3=紫色极4=金色)
            Grade = 4,
            -- 成长值
            Growth = 5,  -- 提高成长值 (114>110, 差值为4)
        },
    },
    [59] = {
        --下装22
        TypeName = "Bottoms",
        NickName = "春日校园下装",
        --换装ID
        EquipID = 520086,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack =0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease  = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 90,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 4,  -- 保持不变
        },
    },
    [60] = {
        --下装23
        TypeName = "Bottoms",
        NickName = "青春筑梦下装",
        --换装ID
        EquipID = 520118,
        Category = 3,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 100,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 1,  -- 降低成长值 (105 < 110, 差值为5)
        },
    },
    [61] = {
        --弓箭1
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 10,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 6,
        },
    },
    [62] = {
        --弓箭2
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 12,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 6,
        },
    },
    [63] = {
        --弓箭3
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 10,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 7,
        },
    },
    [64] = {
        --弓箭4
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 22,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3 , -- 提高基础值 (22+ 3 * 5= 37> 42 , 差值为5)
        },
    },
    [65] = {
        --弓箭5
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 14,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 6,
        },
    },
    [66] = {
        --弓箭6
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 14,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
          HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 6,
        },
    },
    [67] = {
        --弓箭7
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 14,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth =  6,
        },
    },
    [68] = {
        --弓箭8
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 24,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 1,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 3, -- 提高基础值 (24+ 3 * 5= 39> 44 , 差值为5)
        },
    },
    [69] = {
        --弓箭9
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [70] = {
        --弓箭10
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 7,  -- 降低攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外极伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 9,  -- 提高成长值 (满级为52 > 46, 差值为8)
        },
    },
    [71] = {
        --弓箭11
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 13,  -- 降低攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干极外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准极
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色极4=金色)
            Grade = 4,
            -- 成长值
            Growth = 7,  -- 提高成长值 (13+7 * 5=48 > 46, 差值为2)
        },
    },
    [72] = {
        --弓箭12
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease  = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [73] = {
        --弓箭极3
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [74] = {
        --弓箭14
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 26,  -- 提高攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 2,  -- 降低成长值 (36 < 46, 差值为10)
        },
    },
    [75] = {
        --弓箭15
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性极
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 19,  -- 提高攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 5,  -- 降低成长值 (19+5 * 5=44 < 46, 差值为2)
        },
    },
    [76] = {
        --弓箭16
        TypeName = "Bow",
        NickName = "Hat",
        Category = 4,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 16,  -- 保持不变
            -- 头部额外增极
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 2,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 6,  -- 保持不变
        },
    },
    [77] = {
        --手斧1
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 65,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 2,
        },
    },
    [78] = {
        --手斧2
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 78, -- 提高基础值
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 1,  -- 降低成长值 （83 < 88, 差值为5）
        },
    },
    [79] = {
        --手斧3
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 73,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3,
        },
    },
    [80] = {
        --手斧4
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 73,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 3,
        },
    },
    [81] = {
        --手斧5
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack =0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 78,  --降低精准度
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 7, --提升成长值（113>106 差值为7）
        },
    },
    [82] = {
        --手斧6
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
          HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 86,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth =4,
        },
    },
    [83] = {
        --手斧7
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 95, --提升基础值
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 1,  --降低成长值 （100<106,插值为6）
        },
    },
    [84] = {
        --手斧8
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 86,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 4,
        },
    },
    [85] = {
        --手斧9
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 90,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 4,  -- 保持不变
        },
    },
    [86] = {
        --手斧10
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0, 
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外极伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 80,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 8,  -- 提高成长值 (120 > 110, 差值为10)
        },
    },
    [87] = {
        --手斧11
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干极外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准极
            Accuracy = 89,
            -- 品阶(1=绿色,2=蓝色,3=紫色极4=金色)
            Grade = 4,
            -- 成长值
            Growth = 5,  -- 提高成长值 (114>110, 差值为4)
        },
    },
    [88] = {
        --手斧12
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack =0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease  = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 90,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 4,  -- 保持不变
        },
    },
    [89] = {
        --手斧13
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 90,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 4,  -- 保持不变
        },
    },
    [90] = {
        --手斧14
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 100,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 1,  -- 降低成长值 (105 < 110, 差值为5)
        },
    },
    [91] = {
        --手斧15
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性极
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack =0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 96,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 2,  -- 降低成长值 (106 < 110, 差值为4)
        },
    },
    [92] = {
        --手斧16
        TypeName = "Axe",
        NickName = "Glasses",
        Category = 5,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 0,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增极
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy =90,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 4,  -- 保持不变
        },
    },
    [93] = {
        --长矛1
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 120,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 1,
            -- 成长值
            Growth = 25,

        },
    },
    [94] = {
        --长矛2
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 160 , --提高基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 30 , --提高成长值（310< 340 ,差值为30）
        },
    },
    [95] = {
        --长矛3
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [96] = {
        --长矛4
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命极
            Heal = 140,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 40,
        },
    },
    [97] = {
        --长矛5
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 190 , --提高基础值
            -- 攻击力
            Attack =0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 40,--降低（390< 410 ,差值为20）
        },
    },
    [98] = {
        --长矛6
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 140,  --降低基础值
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
          HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 60, --提高成长值（440< 410 ,差值为30）
        },
    },
    [99] = {
        --长矛7
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 160,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 50,
        },
    },
    [100] = {
        --长矛8
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 160,
            -- 攻击力
            Attack = 0,
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 1,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 3,
            -- 成长值
            Growth = 50,
        },
    },
    [101] = {
        --长矛9
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 180,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 55,  -- 保持不变
        },
    },
    [102] = {
        --长矛10
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 155,
            -- 攻击力
            Attack = 0, 
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外极伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 70,  -- 提高成长值 (505 > 455, 差值为50)
        },
    },
    [103] = {
        --长矛11
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 160,
            -- 攻击力
            Attack = 0, 
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干极外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准极
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色极4=金色)
            Grade = 4,
            -- 成长值
            Growth = 65,  -- 提高成长值 (485 > 455, 差值为30)
        },
    },
    [104] = {
        --长矛12
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 180,
            -- 攻击力
            Attack =0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease  = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 55,  -- 保持不变
        },
    },
    [105] = {
        --长矛13
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 180,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 55,  -- 保持不变
        },
    },
    [106] = {
        --长矛14
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 340,
            -- 攻击力
            Attack = 0,  
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 10,  -- 降低成长值 (390 < 455, 差值为60)
        },
    },
    [107] = {
        --长矛15
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性极
        Attributes = {
            -- 生命值
            Heal = 260,
            -- 攻击力
            Attack =0,  -- 提高攻击力
            -- 头部额外增伤
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 2,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 32,  -- 降低成长值 (420 < 455, 差值为35)
        },
    },
    [108] = {
        --长矛16
        TypeName = "Spear",
        NickName = "Cloth",
        Category = 6,
        --属性参数
        Attributes = {
            -- 生命值
            Heal = 180,
            -- 攻击力
            Attack = 0,  -- 保持不变
            -- 头部额外增极
            HeadShotIncrease = 0,
            -- 躯干额外增伤
            BodyShotIncrease = 0,
            -- 头部额外减伤
            HeadShotReduction = 0,
            -- 躯干额外减伤
            BodyShotReduction = 0,
            -- 伤害减免
            DamageReduction = 2,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 4,
            -- 成长值
            Growth = 55,  -- 保持不变
        },
    },
}

return EquipmentConfig