
------------------------------------
-- RADIANT & DIRE FOUNTAIN LOCATIONS
------------------------------------
RAD_FOUNTAIN = Vector(-7000.0, -7000.0, 0.0)

DIRE_FOUNTAIN = Vector(7000.0, 7000.0, 0.0)

------------------------------------
-- RADIANT & DIRE NEUTRAL LOCATIONS
------------------------------------
RAD_MID_MEDIUM = Vector(-1864.778076, -4351.264160, 128.000000)

RAD_MID_HARD = Vector(-554.121765, -3323.541992, 256.000000)

RAD_MID_ANCIENT = Vector(680.126160, -2741.720215, 384.000000)

RAD_SAFE_MEDIUM = Vector(547.355835, -4626.182129, 384.000000)

RAD_SAFE_EASY = Vector(3022.693848, -4553.411621, 256.000000)

RAD_SAFE_HARD = Vector(4756.009277, -4438.848145, 256.000000)

RAD_OFF_ANCIENT = Vector(-2969.868164, -100.282837, 384.000000)

RAD_OFF_MEDIUM = Vector(-3801.975586, 800.282837, 256.000000)

RAD_OFF_HARD = Vector(-4755.342285, -359.238007, 256.000000)

DIRE_MID_MEDIUM = Vector(1192.345459, 3401.774902, 384.000000)

DIRE_MID_HARD = Vector(-240.170807, 3432.894531, 256.000000)

DIRE_MID_ANCIENT = Vector(-846.801514, 2274.023438, 384.000000)

DIRE_SAFE_MEDIUM = Vector(-1832.490112, 4078.956055, 256.000000)

DIRE_SAFE_EASY = Vector(-2911.948730, 4905.840332, 384.000000)

DIRE_SAFE_HARD = Vector(-4329.099609, 3678.822021, 256.000000)

DIRE_OFF_ANCIENT = Vector(2703.443359, 107.946167, 384.000000)

DIRE_OFF_MEDIUM = Vector(3765.490234, -674.424194, 256.000000)

DIRE_OFF_HARD = Vector(4296.825684, 796.566528, 384.000000)

------------------------------
-- Shrine and Bounty locations
------------------------------

DIRE_BOUNTY_RUNE_OFF = Vector(3488.188232, 292.739502, 384.000000)

DIRE_BOUNTY_RUNE_SAFE = Vector(-2834.726807, 4150.442871, 384.000000)

RAD_BOUNTY_RUNE_SAFE = Vector(1278.728882, -4117.100098, 384.000000)

RAD_BOUNTY_RUNE_OFF = Vector(-4342.125977, 182.345154, 256.000000)

DIRE_SHRINE_OFF = Vector(4253.103516, -1463.230957, 384.000000) -- inaccurate. small offset

DIRE_SHRINE_SAFE = Vector(-247.704636, 2613.316895, 384.000000) -- inaccurate. small offset

RAD_SHRINE_SAFE = Vector(636.337952, -2703.370117, 384.000000)  -- inaccurate. small offset

RAD_SHRINE_OFF = Vector(-4095.146973, 1219.809692, 384.000000)  -- inaccurate. small offset

-----------------------------
-- Others
-----------------------------

ROSHAN = Vector(-2451.685303, 1884.514893, 159.998047)

-----------------------------
-- Movement
-----------------------------
function GoToRoshan(bot)
	bot:MoveToLocation(ROSHAN);
end

function GoToFountain(bot)
	if ( GetTeam() == TEAM_RADIANT ) then
		bot:MoveToLocation(RAD_FOUNTAIN);
	else
		bot:MoveToLocation(DIRE_FOUNTAIN);
	end
end