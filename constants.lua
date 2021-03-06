-------------------------------------------------------------------------------
--- AUTHOR: Nostrademous
--- GITHUB REPO: https://github.com/Nostrademous/Dota2-FullOverwrite
-------------------------------------------------------------------------------

_G._savedEnv = getfenv()
module( "constants", package.seeall )

ACTION_NONE			= "ACTION_NONE"
ACTION_LANING		= "ACTION_LANING"
ACTION_RETREAT 		= "ACTION_RETREAT"
ACTION_FIGHT		= "ACTION_FIGHT"
ACTION_CHANNELING	= "ACTION_CHANNELING"
ACTION_MOVING		= "ACTION_MOVING"
ACTION_JUNGLING		= "ACTION_JUNGLING"
ACTION_SECRETSHOP 	= "ACTION_SECRETSHOP"
ACTION_RUNEPICKUP	= "ACTION_RUNEPICKUP"
ACTION_ROSHAN		= "ACTION_ROSHAN"
ACTION_DEFENDALLY 	= "ACTION_DEFENDALLY"
ACTION_DEFENDLANE	= "ACTION_DEFENDLANE"

ROLE_UNKNOWN 		= 0
ROLE_HARDCARRY 		= 1
ROLE_MID 			= 2
ROLE_OFFLANE 		= 3
ROLE_SEMISUPPORT 	= 4
ROLE_HARDSUPPORT 	= 5
ROLE_ROAMER 		= 6
ROLE_JUNGLER 		= 7

TEAM_RADIANT 		= 2
TEAM_DIRE 			= 3

-------------------------------------------------------------------------------
-- JUNGLE RELATED --
-------------------------------------------------------------------------------
CAMP_EASY 			= 1
CAMP_MEDIUM 		= 2
CAMP_HARD 			= 3
CAMP_ANCIENT 		= 4

VECTOR 				= "vector"
STACK_TIME 			= "time"
PRE_STACK_VECTOR 	= "prestack"
STACK_VECTOR 		= "stack"
DIFFICULTY 			= "difficulty"

--actual camp
RAD_MID_MEDIUM 		= Vector(-1864.778076, -4351.264160, 128.000000)
RAD_MID_HARD 		= Vector(-554.121765, -3270.541992, 256.000000)
RAD_MID_ANCIENT 	= Vector(339.126160, -2069.720215, 384.000000)
RAD_SAFE_MEDIUM 	= Vector(547.355835, -4626.182129, 384.000000)
RAD_SAFE_EASY 		= Vector(3022.693848, -4553.411621, 256.000000)
RAD_SAFE_HARD 		= Vector(4756.009277, -4438.848145, 256.000000)
RAD_OFF_ANCIENT 	= Vector(-2969.868164, -100.282837, 384.000000)
RAD_OFF_MEDIUM 		= Vector(-3790.975586, 800.282837, 256.000000)
RAD_OFF_HARD 		= Vector(-4760.342285, -375.238007, 256.000000)
DIRE_MID_MEDIUM 	= Vector(1192.345459, 3401.774902, 384.000000)
DIRE_MID_HARD 		= Vector(-240.170807, 3432.894531, 256.000000)
DIRE_MID_ANCIENT 	= Vector(-846.801514, 2274.023438, 384.000000)
DIRE_SAFE_MEDIUM 	= Vector(-1832.490112, 4078.956055, 256.000000)
DIRE_SAFE_EASY 		= Vector(-2911.948730, 4905.840332, 384.000000)
DIRE_SAFE_HARD 		= Vector(-4329.099609, 3678.822021, 256.000000)
DIRE_OFF_ANCIENT 	= Vector(2703.443359, 107.946167, 384.000000)
DIRE_OFF_MEDIUM 	= Vector(3765.490234, -674.424194, 256.000000)
DIRE_OFF_HARD 		= Vector(4296.825684, 796.566528, 384.000000)

--time to pull for a stack
RAD_MID_MEDIUM_STACKTIME 	= 56
RAD_MID_HARD_STACKTIME 		= 54
RAD_MID_ANCIENT_STACKTIME 	= 54
RAD_SAFE_MEDIUM_STACKTIME 	= 55
RAD_SAFE_EASY_STACKTIME 	= 54
RAD_SAFE_HARD_STACKTIME 	= 54
RAD_OFF_ANCIENT_STACKTIME 	= 53
RAD_OFF_MEDIUM_STACKTIME 	= 55
RAD_OFF_HARD_STACKTIME 		= 56
DIRE_MID_MEDIUM_STACKTIME 	= 53
DIRE_MID_HARD_STACKTIME 	= 54
DIRE_MID_ANCIENT_STACKTIME 	= 53
DIRE_SAFE_MEDIUM_STACKTIME 	= 55
DIRE_SAFE_EASY_STACKTIME 	= 55
DIRE_SAFE_HARD_STACKTIME 	= 55
DIRE_OFF_ANCIENT_STACKTIME 	= 54
DIRE_OFF_MEDIUM_STACKTIME 	= 53
DIRE_OFF_HARD_STACKTIME 	= 55

--vector to wait for pull at
RAD_MID_MEDIUM_PRESTACK 	= Vector(-1805.178076, -4183.264160, 128.000000)
RAD_MID_HARD_PRESTACK 		= Vector(-696.121765, -3240.541992, 256.000000)
RAD_MID_ANCIENT_PRESTACK 	= Vector(339.126160, -2069.720215, 384.000000)
RAD_SAFE_MEDIUM_PRESTACK 	= Vector(710.355835, -4489.582129, 384.000000)
RAD_SAFE_EASY_PRESTACK 		= Vector(3250.693848, -4553.411621, 256.000000)
RAD_SAFE_HARD_PRESTACK 		= Vector(4590.009277, -4209.148145, 256.000000)
RAD_OFF_ANCIENT_PRESTACK 	= Vector(-2778.268164, -88.582837, 384.000000)
RAD_OFF_MEDIUM_PRESTACK 	= Vector(-3946.775586, 737.182837, 256.000000)
RAD_OFF_HARD_PRESTACK 		= Vector(-4602.575586, -190.582837, 256.000000)
DIRE_MID_MEDIUM_PRESTACK 	= Vector(1081.945459, 3529.274902, 384.000000)
DIRE_MID_HARD_PRESTACK 		= Vector(-423.070807, 3517.694531, 256.000000)
DIRE_MID_ANCIENT_PRESTACK 	= Vector(-569.601514, 2439.623438, 384.000000)
DIRE_SAFE_MEDIUM_PRESTACK 	= Vector(-1605.990112, 3973.256055, 256.000000)
DIRE_SAFE_EASY_PRESTACK 	= Vector(-3001.948730, 5061.940332, 384.000000)
DIRE_SAFE_HARD_PRESTACK 	= Vector(-4348.299609, 3714.822021, 256.000000)
DIRE_OFF_ANCIENT_PRESTACK 	= Vector(2877.843359, 91.246167, 384.000000)
DIRE_OFF_MEDIUM_PRESTACK 	= Vector(3581.090234, -763.624194, 256.000000)
DIRE_OFF_HARD_PRESTACK 		= Vector(4098.925684, 725.266528, 384.000000)

--vector to run to when stacking
RAD_MID_MEDIUM_STACK 	= Vector(-1824.378076, -3207.564160, 256.000000)
RAD_MID_HARD_STACK 		= Vector(-425.521765, -2421.341992, 256.000000)
RAD_MID_ANCIENT_STACK 	= Vector(1121.526160, -2940.020215, 384.000000)
RAD_SAFE_MEDIUM_STACK 	= Vector(886.355835, -3285.482129, 384.000000)
RAD_SAFE_EASY_STACK 	= Vector(4245.693848, -5273.411621, 384.000000)
RAD_SAFE_HARD_STACK 	= Vector(3425.509277, -3357.848145, 256.000000)
RAD_OFF_ANCIENT_STACK 	= Vector(-3979.668164, -815.682837, 384.000000)
RAD_OFF_MEDIUM_STACK 	= Vector(-5200.375586, 283.682837, 256.000000)
RAD_OFF_HARD_STACK 		= Vector(-3900.742285, -727.938007, 256.000000)
DIRE_MID_MEDIUM_STACK 	= Vector(-142.745459, 4125.974902, 384.000000)
DIRE_MID_HARD_STACK 	= Vector(-1122.570807, 4474.494531, 256.000000)
DIRE_MID_ANCIENT_STACK 	= Vector(859.901514, 2333.123438, 384.000000)
DIRE_SAFE_MEDIUM_STACK	= Vector(-2772.090112, 3447.256055, 256.000000)
DIRE_SAFE_EASY_STACK 	= Vector(-3605.248730, 6082.240332, 384.000000)
DIRE_SAFE_HARD_STACK 	= Vector(-2789.299609, 3501.122021, 256.000000)
DIRE_OFF_ANCIENT_STACK 	= Vector(4276.443359, 79.346167, 384.000000)
DIRE_OFF_MEDIUM_STACK 	= Vector(2297.690234, -944.924194, 256.000000)
DIRE_OFF_HARD_STACK 	= Vector(4577.625684, -349.766528, 384.000000)

-------------------------------------------------------------------------------
-- RUNE
-------------------------------------------------------------------------------
RuneSpots = {
	RUNE_POWERUP_1,
	RUNE_POWERUP_2,
	RUNE_BOUNTY_1,
	RUNE_BOUNTY_2,
	RUNE_BOUNTY_3,
	RUNE_BOUNTY_4
}

-------------------------------------------------------------------------------
-- SECRET SHOPS
-------------------------------------------------------------------------------
SECRET_SHOP_RADIANT = Vector(-4472,1328);
SECRET_SHOP_DIRE = Vector(4586,-1588);

-------------------------------------------------------------------------------

for k,v in pairs( constants ) do	_G._savedEnv[k] = v end
