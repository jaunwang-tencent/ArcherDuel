--初始化游戏框架
require "Game.Framework.Init"

--目标游戏【弓箭手对决】
UGCS.Target.ArcherDuel = {}

--配置
UGCS.Target.ArcherDuel.Config = {}
UGCS.Target.ArcherDuel.Config.CharacterConfig = require "Game.Target.ArcherDuel.Config.CharacterConfig"
UGCS.Target.ArcherDuel.Config.SceneConfig = require "Game.Target.ArcherDuel.Config.SceneConfig"
UGCS.Target.ArcherDuel.Config.WeaponConfig = require "Game.Target.ArcherDuel.Config.WeaponConfig"
UGCS.Target.ArcherDuel.Config.EquipmentConfig = require "Game.Target.ArcherDuel.Config.EquipmentConfig"
UGCS.Target.ArcherDuel.Config.GameConfig = require "Game.Target.ArcherDuel.Config.GameConfig"
UGCS.Target.ArcherDuel.Config.UIConfig = require "Game.Target.ArcherDuel.Config.UIConfig"
UGCS.Target.ArcherDuel.Config.ImpulseConfig = require "Game.Target.ArcherDuel.Config.ImpulseConfig"
UGCS.Target.ArcherDuel.Config.RankInfoConfig = require "Game.Target.ArcherDuel.Config.RankInfoConfig"
UGCS.Target.ArcherDuel.Config.GoodsConfig = require "Game.Target.ArcherDuel.Config.GoodsConfig"

--目标游戏应用
UGCS.Target.ArcherDuel.App = require "Game.Target.ArcherDuel.ArcherDuelApp"

--系统状态机【局外】
UGCS.Target.ArcherDuel.System = {}
UGCS.Target.ArcherDuel.System.FSM = require "Game.Target.ArcherDuel.FSM.System.SystemFSM"
UGCS.Target.ArcherDuel.System.States = {}
UGCS.Target.ArcherDuel.System.States.LobbyState = require "Game.Target.ArcherDuel.FSM.System.States.LobbyState"
UGCS.Target.ArcherDuel.System.States.MatchState = require "Game.Target.ArcherDuel.FSM.System.States.MatchState"
UGCS.Target.ArcherDuel.System.States.RoomState = require "Game.Target.ArcherDuel.FSM.System.States.RoomState"

--房间状态机【局外】
UGCS.Target.ArcherDuel.Room = {}
UGCS.Target.ArcherDuel.Room.FSM = require "Game.Target.ArcherDuel.FSM.Room.RoomFSM"
UGCS.Target.ArcherDuel.Room.States = {}
UGCS.Target.ArcherDuel.Room.States.LoadingState = require "Game.Target.ArcherDuel.FSM.Room.States.LoadingState"
UGCS.Target.ArcherDuel.Room.States.BattleState = require "Game.Target.ArcherDuel.FSM.Room.States.BattleState"
UGCS.Target.ArcherDuel.Room.States.ResultState = require "Game.Target.ArcherDuel.FSM.Room.States.ResultState"

--角色状态机
UGCS.Target.ArcherDuel.Character = {}
UGCS.Target.ArcherDuel.Character.FSM = require "Game.Target.ArcherDuel.FSM.Character.CharacterFSM"
UGCS.Target.ArcherDuel.Character.States = {}
UGCS.Target.ArcherDuel.Character.States.BirthState = require "Game.Target.ArcherDuel.FSM.Character.States.BirthState"
UGCS.Target.ArcherDuel.Character.States.IdleState = require "Game.Target.ArcherDuel.FSM.Character.States.IdleState"
UGCS.Target.ArcherDuel.Character.States.AimState = require "Game.Target.ArcherDuel.FSM.Character.States.AimState"
UGCS.Target.ArcherDuel.Character.States.FireState = require "Game.Target.ArcherDuel.FSM.Character.States.FireState"
UGCS.Target.ArcherDuel.Character.States.HitState = require "Game.Target.ArcherDuel.FSM.Character.States.HitState"
UGCS.Target.ArcherDuel.Character.States.DeathState = require "Game.Target.ArcherDuel.FSM.Character.States.DeathState"

--辅助
UGCS.Target.ArcherDuel.Helper = {}
UGCS.Target.ArcherDuel.Helper.GameUtils = require "Game.Target.ArcherDuel.Helper.GameUtils"

--游戏世界
UGCS.Target.ArcherDuel.World = {}
UGCS.Target.ArcherDuel.World.Actor = {}
--角色
UGCS.Target.ArcherDuel.World.Actor.Player = require "Game.Target.ArcherDuel.World.Actor.Player"
UGCS.Target.ArcherDuel.World.Actor.Weapon = require "Game.Target.ArcherDuel.World.Actor.Weapon"
UGCS.Target.ArcherDuel.World.Actor.Axe = require "Game.Target.ArcherDuel.World.Actor.Axe"
UGCS.Target.ArcherDuel.World.Actor.Bow = require "Game.Target.ArcherDuel.World.Actor.Bow"
UGCS.Target.ArcherDuel.World.Actor.Spear = require "Game.Target.ArcherDuel.World.Actor.Spear"
--场景
UGCS.Target.ArcherDuel.World.Scene = {}
UGCS.Target.ArcherDuel.World.Scene.Battle = require "Game.Target.ArcherDuel.World.Scene.Battle"
UGCS.Target.ArcherDuel.World.Scene.GoldBattle = require "Game.Target.ArcherDuel.World.Scene.GoldBattle"

--模块
UGCS.Target.ArcherDuel.Modules = {}
UGCS.Target.ArcherDuel.Modules.LoadingModule = require "Game.Target.ArcherDuel.Modules.LoadingModule"
UGCS.Target.ArcherDuel.Modules.BattleModule = require "Game.Target.ArcherDuel.Modules.BattleModule"
UGCS.Target.ArcherDuel.Modules.LobbyModule = require "Game.Target.ArcherDuel.Modules.LobbyModule"
UGCS.Target.ArcherDuel.Modules.EquipmentModule = require "Game.Target.ArcherDuel.Modules.EquipmentModule"
UGCS.Target.ArcherDuel.Modules.StoreModule = require "Game.Target.ArcherDuel.Modules.StoreModule"
UGCS.Target.ArcherDuel.Modules.TaskModule = require "Game.Target.ArcherDuel.Modules.TaskModule"
UGCS.Target.ArcherDuel.Modules.TournamentModule = require "Game.Target.ArcherDuel.Modules.TournamentModule"
UGCS.Target.ArcherDuel.Modules.FightModule = require "Game.Target.ArcherDuel.Modules.FightModule"