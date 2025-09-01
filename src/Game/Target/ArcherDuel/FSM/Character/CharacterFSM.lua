--角色状态机
local CharacterFSM = UGCS.RTTI.Class("CharacterFSM", UGCS.Framework.FSM)

--- 构造
---@param Context 上下文
function CharacterFSM:OnCreate(Context)
    CharacterFSM.super.OnCreate(self, Context)

    --宿主角色
    self.OwnerPlayer = Context and Context.OwnerPlayer

    --进入出生状态
    self:SwitchState(UGCS.Target.ArcherDuel.Character.States.BirthState, Context)
end

--- 销毁
function CharacterFSM:OnDestroy()
    CharacterFSM.super.OnDestroy(self)

    self.OwnerPlayer = nil
end

--- 刷新状态机时
---@param DeltaTime 时间戳
function CharacterFSM:OnUpdate(DeltaTime)

end

return CharacterFSM