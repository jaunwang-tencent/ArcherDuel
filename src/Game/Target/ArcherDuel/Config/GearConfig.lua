
-- 装备配置
local GearConfig = {
    [1] = {
        --角色1
        TypeName = "哈士奇",
        TypeID = 400100,
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
        TypeName = "好好鸭",
        TypeID = 400110,
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
        TypeName = "紫萝萝",
        TypeID = 400380,
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
        TypeName = "巨鳄霸",
        --角色
        TypeID = 400210,
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
        TypeName = "羊小萌",
        TypeID = 400480,
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
        TypeName = "小红狐",
        TypeID = 400470,
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
        TypeName = "玫珊珊",
        TypeID = 400390,
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
        TypeName = "哞哞牛",
        TypeID = 400070,
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
        TypeName = "鼠朵朵",
        TypeID = 402390,
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
        TypeName = "胖胖达",
        TypeID = 400140,
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
        TypeName = "小青蛙",
        TypeID = 402930,
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
        TypeName = "易斑斑",
        TypeID = 400020,
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
        TypeName = "卡皮巴拉",
        TypeID = 401370,
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
        TypeName = "虎子哥",
        TypeID = 400080,
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
        TypeName = "少年时代上装",
        --换装ID
        TypeID = 510080,
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
        TypeName = "沙滩旅客上装",
        --换装ID
        TypeID = 510020,
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
        TypeName = "清爽运动上装",
        --换装ID
        TypeID = 510008,
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
        TypeName = "邻家学妹上装",
        --换装ID
        TypeID = 510133,
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
        TypeName = "蓝色童话上装",
        --换装ID
        TypeID = 510045,
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
        TypeName = "白桃气泡上装",
        --换装ID
        TypeID = 510044,
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
        TypeName = "星小递上装",
        --换装ID
        TypeID = 510019,
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
        TypeName = "芝士桃桃上装",
        --换装ID
        TypeID = 510041,
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
        TypeName = "三花摩卡上装",
        --换装ID
        TypeID = 510043,
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
        TypeName = "专业态度上装",
        --换装ID
        TypeID = 510216,
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
        TypeName = "活力绅士上装",
        --换装ID
        TypeID = 510206,
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
        TypeName = "春风探险上装",
        --换装ID
        TypeID = 510131,
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
        TypeName = "彩虹旋律上装",
        --换装ID
        TypeID = 510028,
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
        TypeName = "烘焙甜心上装",
        --换装ID
        TypeID = 510029,
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
        TypeName = "灰色边缘上装",
        --换装ID
        TypeID = 510018,
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
        TypeName = "蓝莓戚风上装",
        --换装ID
        TypeID = 510050,
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
        TypeName = "红梅丝绒上装",
        --换装ID
        TypeID = 510032,
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
        TypeName = "最佳员工上装",
        --换装ID
        TypeID = 510005,
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
        TypeName = "绅士礼服上装",
        --换装ID
        TypeID = 510096,
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
        TypeName = "海岛风情上装",
        --换装ID
        TypeID = 510350,
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
        TypeName = "海岛一刻上装",
        --换装ID
        TypeID = 510157,
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
        TypeName = "春日校园上装",
        --换装ID
        TypeID = 510130,
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
        TypeName = "青春筑梦上装",
        --换装ID
        TypeID = 510170,
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
        TypeName = "少年时代下装",
        --换装ID
        TypeID = 520052,
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
        TypeName = "沙滩旅客下装",
        --换装ID
        TypeID = 520017,
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
        TypeName = "清爽运动下装",
        --换装ID
        TypeID = 520008,
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
        TypeName = "邻家学妹下装",
        --换装ID
        TypeID = 520088,
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
        TypeName = "蓝色童话下装",
        --换装ID
        TypeID = 520035,
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
        TypeName = "白桃气泡下装",
        --换装ID
        TypeID = 520034,
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
        TypeName = "星小递下装",
        --换装ID
        TypeID = 520016,
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
        TypeName = "芝士桃桃下装",
        --换装ID
        TypeID = 520031,
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
        TypeName = "三花摩卡下装",
        --换装ID
        TypeID = 520033,
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
        TypeName = "专业态度下装",
        --换装ID
        TypeID = 520153,
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
        TypeName = "活力绅士下装",
        --换装ID
        TypeID = 520145,
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
        TypeName = "春风探险下装",
        --换装ID
        TypeID = 520087,
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
        TypeName = "彩虹旋律下装",
        --换装ID
        TypeID = 520026,
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
        TypeName = "烘焙甜心下装",
        --换装ID
        TypeID = 520027,
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
        TypeName = "灰色边缘下装",
        --换装ID
        TypeID = 520015,
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
        TypeName = "蓝莓戚风下装",
        --换装ID
        TypeID = 520040,
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
        TypeName = "红梅丝绒下装",
        --换装ID
        TypeID = 520030,
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
        TypeName = "最佳员工下装",
        --换装ID
        TypeID = 520005,
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
        TypeName = "绅士礼服下装",
        --换装ID
        TypeID = 520065,
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
        TypeName = "海岛风情下装",
        --换装ID
        TypeID = 520233,
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
        TypeName = "海岛一刻下装",
        --换装ID
        TypeID = 520108,
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
        TypeName = "春日校园下装",
        --换装ID
        TypeID = 520086,
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
        TypeName = "青春筑梦下装",
        --换装ID
        TypeID = 520118,
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Hat",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Glasses",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
        TypeName = "Cloth",
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
return GearConfig