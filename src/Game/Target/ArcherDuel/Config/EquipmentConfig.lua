
   -- 装备配置
   local EquipmentConfig = {
    [1] = {
        --角色1
        TypeName = "Part",
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
            BodyShotReduction = 1,
            -- 伤害减免
            DamageReduction = 0,
            -- 精准度
            Accuracy = 0,
            -- 品阶(1=绿色,2=蓝色,3=紫色,4=金色)
            Grade = 2,
            -- 成长值
            Growth = 50,
        },
    },
    [26] = {
        --上衣12
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
}

return EquipmentConfig