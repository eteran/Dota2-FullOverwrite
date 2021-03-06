-------------------------------------------------------------------------------
--- AUTHOR: Nostrademous
--- GITHUB REPO: https://github.com/Nostrademous/Dota2-FullOverwrite
-------------------------------------------------------------------------------

require( GetScriptDirectory().."/constants" )
local gHeroVar = require( GetScriptDirectory().."/global_hero_data" )

-------------------------------------------------------------------------------
-- Inits
-------------------------------------------------------------------------------

U = {}

-------------------------------------------------------------------------------
-- Declarations
-------------------------------------------------------------------------------

U.creeps = nil
U.Lanes={[1]=LANE_BOT,[2]=LANE_MID,[3]=LANE_TOP};

U.Locations = {
["RadiantShop"]= Vector(-4739,1263),
["DireShop"]= Vector(4559,-1554),
["BotShop"]= Vector(7253,-4128),
["TopShop"]= Vector(-7236,4444),

["RadiantBase"]= Vector(-7200,-6666),
["RBT1"]= Vector(4896,-6140),
["RBT2"]= Vector(-128,-6244),
["RBT3"]= Vector(-3966,-6110),
["RMT1"]= Vector(-1663,-1510),
["RMT2"]= Vector(-3559,-2783),
["RMT3"]= Vector(-4647,-4135),
["RTT1"]= Vector(-6202,1831),
["RTT2"]= Vector(-6157,-860),
["RTT3"]= Vector(-6591,-3397),
["RadiantTopShrine"]= Vector(-4229,1299),
["RadiantBotShrine"]= Vector(622,-2555),

["DireBase"]= Vector(7137,6548),
["DBT1"]= Vector(6215,-1639),
["DBT2"]= Vector(6242,400),
["DBT3"]= Vector(-6307,3043),
["DMT1"]= Vector(1002,330),
["DMT2"]= Vector(2477,2114),
["DMT3"]= Vector(4197,3756),
["DTT1"]= Vector(-4714,6016),
["DTT2"]= Vector(0,6020),
["DTT3"]= Vector(3512,5778),
["DireTopShrine"]= Vector(-139,2533),
["DireBotShrine"]= Vector(4173,-1613),
};

U["tableNeutralCamps"] = {
	[constants.TEAM_RADIANT] = {
		[1] = {
			[constants.DIFFICULTY] = constants.CAMP_EASY,
			[constants.VECTOR] = constants.RAD_SAFE_EASY,
			[constants.STACK_TIME] = constants.RAD_SAFE_EASY_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_SAFE_EASY_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_SAFE_EASY_STACK
		},
		[2] = {
			[constants.DIFFICULTY] = constants.CAMP_MEDIUM,
			[constants.VECTOR] = constants.RAD_SAFE_MEDIUM,
			[constants.STACK_TIME] = constants.RAD_SAFE_MEDIUM_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_SAFE_MEDIUM_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_SAFE_MEDIUM_STACK
		},
		[3] = {
			[constants.DIFFICULTY] = constants.CAMP_MEDIUM,
			[constants.VECTOR] = constants.RAD_MID_MEDIUM,
			[constants.STACK_TIME] = constants.RAD_MID_MEDIUM_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_MID_MEDIUM_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_MID_MEDIUM_STACK
		},
		[4] = {
			[constants.DIFFICULTY] = constants.CAMP_MEDIUM,
			[constants.VECTOR] = constants.RAD_OFF_MEDIUM,
			[constants.STACK_TIME] = constants.RAD_OFF_MEDIUM_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_OFF_MEDIUM_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_OFF_MEDIUM_STACK
		},
		[5] = {
			[constants.DIFFICULTY] = constants.CAMP_HARD,
			[constants.VECTOR] = constants.RAD_OFF_HARD,
			[constants.STACK_TIME] = constants.RAD_OFF_HARD_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_OFF_HARD_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_OFF_HARD_STACK
		},
		[6] = {
			[constants.DIFFICULTY] = constants.CAMP_HARD,
			[constants.VECTOR] = constants.RAD_MID_HARD,
			[constants.STACK_TIME] = constants.RAD_MID_HARD_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_MID_HARD_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_MID_HARD_STACK
		},
		[7] = {
			[constants.DIFFICULTY] = constants.CAMP_HARD,
			[constants.VECTOR] = constants.RAD_SAFE_HARD,
			[constants.STACK_TIME] = constants.RAD_SAFE_HARD_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_SAFE_HARD_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_SAFE_HARD_STACK
		},
		[8] = {
			[constants.DIFFICULTY] = constants.CAMP_ANCIENT,
			[constants.VECTOR] = constants.RAD_MID_ANCIENT,
			[constants.STACK_TIME] = constants.RAD_MID_ANCIENT_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_MID_ANCIENT_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_MID_ANCIENT_STACK
		},
		[9] = {
			[constants.DIFFICULTY] = constants.CAMP_ANCIENT,
			[constants.VECTOR] = constants.RAD_OFF_ANCIENT,
			[constants.STACK_TIME] = constants.RAD_OFF_ANCIENT_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.RAD_OFF_ANCIENT_PRESTACK,
			[constants.STACK_VECTOR] = constants.RAD_OFF_ANCIENT_STACK
		}
	},
	[constants.TEAM_DIRE] = {
		[1] = {
			[constants.DIFFICULTY] = constants.CAMP_EASY,
			[constants.VECTOR] = constants.DIRE_SAFE_EASY,
			[constants.STACK_TIME] = constants.DIRE_SAFE_EASY_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_SAFE_EASY_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_SAFE_EASY_STACK
		},
		[2] = {
			[constants.DIFFICULTY] = constants.CAMP_MEDIUM,
			[constants.VECTOR] = constants.DIRE_SAFE_MEDIUM,
			[constants.STACK_TIME] = constants.DIRE_SAFE_MEDIUM_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_SAFE_MEDIUM_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_SAFE_MEDIUM_STACK
		},
		[3] = {
			[constants.DIFFICULTY] = constants.CAMP_MEDIUM,
			[constants.VECTOR] = constants.DIRE_MID_MEDIUM,
			[constants.STACK_TIME] = constants.DIRE_MID_MEDIUM_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_MID_MEDIUM_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_MID_MEDIUM_STACK
		},
		[4] = {
			[constants.DIFFICULTY] = constants.CAMP_MEDIUM,
			[constants.VECTOR] = constants.DIRE_OFF_MEDIUM,
			[constants.STACK_TIME] = constants.DIRE_OFF_MEDIUM_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_OFF_MEDIUM_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_OFF_MEDIUM_STACK
		},
		[5] = {
			[constants.DIFFICULTY] = constants.CAMP_HARD,
			[constants.VECTOR] = constants.DIRE_OFF_HARD,
			[constants.STACK_TIME] = constants.DIRE_OFF_HARD_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_OFF_HARD_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_OFF_HARD_STACK
		},
		[6] = {
			[constants.DIFFICULTY] = constants.CAMP_HARD,
			[constants.VECTOR] = constants.DIRE_MID_HARD,
			[constants.STACK_TIME] = constants.DIRE_MID_HARD_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_MID_HARD_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_MID_HARD_STACK
		},
		[7] = {
			[constants.DIFFICULTY] = constants.CAMP_HARD,
			[constants.VECTOR] = constants.DIRE_SAFE_HARD,
			[constants.STACK_TIME] = constants.DIRE_SAFE_HARD_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_SAFE_HARD_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_SAFE_HARD_STACK
		},
		[8] = {
			[constants.DIFFICULTY] = constants.CAMP_ANCIENT,
			[constants.VECTOR] = constants.DIRE_MID_ANCIENT,
			[constants.STACK_TIME] = constants.DIRE_MID_ANCIENT_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_MID_ANCIENT_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_MID_ANCIENT_STACK
		},
		[9] = {
			[constants.DIFFICULTY] = constants.CAMP_ANCIENT,
			[constants.VECTOR] = constants.DIRE_OFF_ANCIENT,
			[constants.STACK_TIME] = constants.DIRE_OFF_ANCIENT_STACKTIME,
			[constants.PRE_STACK_VECTOR] = constants.DIRE_OFF_ANCIENT_PRESTACK,
			[constants.STACK_VECTOR] = constants.DIRE_OFF_ANCIENT_STACK
		}
	}
}

U.SIDE_SHOP_TOP = Vector(-7220,4430);
U.SIDE_SHOP_BOT = Vector(7249,-4113);
U.SECRET_SHOP_RADIANT = Vector(-4472,1328);
U.SECRET_SHOP_DIRE = Vector(4586,-1588);
U.ROSHAN = Vector(-2450, 1880);

U.RadiantSafeSpots={
	Vector(4088,-3919),
	Vector(5153,-3784),
	Vector(2810,-5053),
	Vector(2645,-3814),
	Vector(724,-3003),
	Vector(1037,-5629),
	Vector(1271,-4128),
	Vector(-989,-5559),
	Vector(-780,-3919),
	Vector(-128,-2523),
	Vector(-2640,-2200),
	Vector(-1284,-962),
	Vector(-2032,364),
	Vector(-3545,-892),
	Vector(-5518,-1450),
	Vector(-4301,377),
	Vector(-5483,1633),
	Vector(-6152,-5664),
	Vector(-6622,-3666),
	Vector(-6413,-1651),
	Vector(-4814,-4242),
	Vector(-3379,-3073),
	Vector(-4283,-6091),
	Vector(-2441,-6056),
	Vector(5722,-2602),
	Vector(4595,-1540)
}

U.DireSafeSpots={
	Vector(-1912,2412),
	Vector(-4405,4735),
	Vector(-2840,4194),
	Vector(-1319,4735),
	Vector(-980,3330),
	Vector(776,4229),
	Vector(11,2405),
	Vector(324,670),
	Vector(1480,1760),
	Vector(2236,3217),
	Vector(3079,1812),
	Vector(1958,-116),
	Vector(3375,242),
	Vector(3636,-1023),
	Vector(4957,1812),
	Vector(4914,434),
	Vector(5487,-1729),
	Vector(6026,5585),
	Vector(6339,3631),
	Vector(6113,1782),
	Vector(4653,4154),
	Vector(3219,2916),
	Vector(4070,5821),
	Vector(2036,5637),
	Vector(-3715,2246)
}

-------------------------------------------------------------------------------
-- Properties
-------------------------------------------------------------------------------

function setHeroVar(var, value)
	local bot = bot or GetBot()
	gHeroVar.SetVar(bot:GetPlayerID(), var, value)
end

function getHeroVar(var)
	local bot = bot or GetBot()
	return gHeroVar.GetVar(bot:GetPlayerID(), var)
end

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Table Functions
-------------------------------------------------------------------------------

function U.InTable (tab, val)
    for index, value in ipairs (tab) do
        if value == val then
            return true
        end
    end

    return false
end

function U.PosInTable(tab, val)
	for index,value in ipairs(tab) do
		if value == val then
			return index
		end
	end

	return -1
end

function U.Spairs(t, order)
    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

function U.PairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)
    local i = 0                 -- iterator variable
    local iter = function ()    -- iterator function
       i = i + 1
       if a[i] == nil then return nil
       else return a[i], t[a[i]]
       end
    end
    return iter
end

function U.SortFunc(a , b)
    if a < b then
        return true
    end
end

function U.deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[U.deepcopy(orig_key)] = U.deepcopy(orig_value)
        end
        setmetatable(copy, U.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function U.clone(org)
	return {unpack(org)}
end

-------------------------------------------------------------------------------
-- Math Functions
-------------------------------------------------------------------------------

function U.GetDistance(s, t)
	--print("S1: "..s[1]..", S2: "..s[2].." :: T1: "..t[1]..", T2: "..t[2]);
	return math.sqrt((s[1]-t[1])*(s[1]-t[1]) + (s[2]-t[2])*(s[2]-t[2]));
end

function U.VectorTowards(s,t,d)
	local f=t-s;
	f=f / U.GetDistance(f,Vector(0,0));
	return s+(f*d);
end

-------------------------------------------------------------------------------
-- General Hero Functions
-------------------------------------------------------------------------------

function U.GetHeroName(bot)
	local sName = bot:GetUnitName()
	return string.sub(sName, 15, string.len(sName));
end

function U.IsCore()
	if getHeroVar("Role") == constants.ROLE_HARDCARRY
		or getHeroVar("Role") == constants.ROLE_MID
		or getHeroVar("Role") == constants.ROLE_OFFLANE then
			return true;
	end

	return false;
end

function U.IsMelee(hero)
	--NOTE: Monkey King is considered Melee with a range of 300, typical melee heroes are range 150
	if hero:GetAttackRange() < 320.0 then return true end
	return false
end

function U.PartyChat(msg)
	local bot = GetBot()
	bot:Action_Chat(msg, false)
end

function U.AllChat(msg)
	local bot = GetBot()
	bot:Action_Chat(msg, true)
end

function U.NotNilOrDead(unit)
	if unit==nil then
		return false;
	end
	if unit:IsAlive() then
		return true;
	end
	return false;
end

function U.GetHeroLevel()
    local npcBot = GetBot()
    local respawnTable = {8, 10, 12, 14, 16, 26, 28, 30, 32, 34, 36, 46, 48, 50, 52, 54, 56, 66, 70, 74, 78,  82, 86, 90, 100}
    local nRespawnTime = npcBot:GetRespawnTime() +1
	
	local respawnAdj = getHeroVar("RespawnAdjustment")
	if respawnAdj ~= nil then
		nRespawnTime = nRespawnTime - respawnAdj
	end
	
    for k,v in pairs (respawnTable) do
        if v == nRespawnTime then
			return k
        end
    end
	
	print(U.GetHeroName(npcBot), "-  U.GetHeroLevel ERROR: Was looking for: ", nRespawnTime)
	return 1
end

function U.TimePassed(prevTime, amount)
	if ( (GameTime() - prevTime) > amount ) then
		return true, GameTime();
	else
		return false, GameTime();
	end
end

function U.LevelUp(bot, AbilityPriority)
	if ( GetGameState() ~= GAME_STATE_GAME_IN_PROGRESS and GetGameState() ~= GAME_STATE_PRE_GAME ) then return end;

	local ability = bot:GetAbilityByName(AbilityPriority[1])

	if ( ability == nil ) then
		print( getHeroVar("Name") .. " FAILED AT Leveling " .. AbilityPriority[1] )
		table.remove( AbilityPriority, 1 )
		return
	end

	if ( ability:CanAbilityBeUpgraded() and ability:GetLevel() < ability:GetMaxLevel() ) then
		bot:Action_LevelAbility(AbilityPriority[1])
		print( getHeroVar("Name") .. " Leveling " .. ability:GetName() )
		table.remove( AbilityPriority, 1 )
		
		local aName = ability:GetName()
		local start, finish = string.find(aName, "respawn_reduction_")
		if finish ~= nil then
			local num = string.sub(aName, finish+1, string.len(aName))
			num = tonumber(num)
			setHeroVar("RespawnAdjustment", num)
		end
	end
end

function U.GetOtherTeam()
	if GetTeam()==TEAM_RADIANT then
		return TEAM_DIRE;
	else
		return TEAM_RADIANT;
	end
end

-------------------------------------------------------------------------------
-- Hero Movement Functions
-------------------------------------------------------------------------------

function U.PositionAlongLane(npcBot, lane)
	local bestPos=0.0;
	local pos=0.0;
	local closest=0.0;
	local dis=20000.0;

	while (pos<1.0) do
		local thisPos = GetLocationAlongLane(lane, pos);
		if (U.GetDistance(thisPos,npcBot:GetLocation()) < dis) then
			dis=U.GetDistance(thisPos,npcBot:GetLocation());
			bestPos=pos;
		end
		pos = pos+0.01;
	end

	return bestPos;
end

function U.MoveSafelyToLocation(npcBot, dest)
	if getHeroVar("NextHop")==nil or #getHeroVar("NextHop")==0 or getHeroVar("PathfindingWasInitiated")==nil or (not getHeroVar("PathfindingWasInitiated")) then
		U.InitPathFinding(npcBot);
		print(U.GetHeroName(npcBot), " Path finding has been initiated");
	end

	local safeSpots = nil
	local safeDist = 2000
	if dest==nil then
		print("PathFinding: No destination was specified")
		return
	end

	if GetTeam()==TEAM_RADIANT then
		safeSpots = U.RadiantSafeSpots
	else
		safeSpots = U.DireSafeSpots
	end

	if getHeroVar("FinalHop")==nil then
		setHeroVar("FinalHop", false)
	end


	local s=nil;
	local si=-1;
	local mindisS=100000;

	local t=nil;
	local ti=-1;
	local mindisT=100000;

	local CurLoc = npcBot:GetLocation();

	for i,spot in pairs(safeSpots) do
		if U.GetDistance(spot,CurLoc)<mindisS then
			s=spot;
			si=i;
			mindisS=U.GetDistance(spot,CurLoc);
		end

		if U.GetDistance(spot,dest)<mindisT then
			t=spot;
			ti=i;
			mindisT=U.GetDistance(spot,dest);
		end
	end

	if s==nil or t==nil then
		npcBot:Action_Chat('Something is wrong with path finding.',true);
		return;
	end

	if GetUnitToLocationDistance(npcBot,dest)<safeDist or getHeroVar("FinalHop") or mindisS+mindisT>GetUnitToLocationDistance(npcBot,dest) then
		npcBot:Action_MoveToLocation(dest)
		setHeroVar("FinalHop", true)
		return;
	end

	if si==ti then
		setHeroVar("FinalHop", true)
		npcBot:Action_MoveToLocation(dest)
		return;
	end

	if GetUnitToLocationDistance(npcBot,s)<500 and getHeroVar("LastHop")==nil then
		setHeroVar("LastHop", si)
	end

	if mindisS>safeDist or getHeroVar("LastHop")==nil then
		npcBot:Action_MoveToLocation(s);
		return;
	end

	if GetUnitToLocationDistance(npcBot,safeSpots[getHeroVar("NextHop")[getHeroVar("LastHop")][ti]])<500 then
		setHeroVar("LastHop", getHeroVar("NextHop")[getHeroVar("LastHop")][ti])
	end

	local newT = getHeroVar("NextHop")[getHeroVar("LastHop")][ti]

	npcBot:Action_MoveToLocation(safeSpots[newT]);
end

function U.IsFacingLocation(hero, loc, delta)

	local face=hero:GetFacing();
	local move = loc - hero:GetLocation();

	move = move / (U.GetDistance(Vector(0,0),move));

	local moveAngle=math.atan2(move.y,move.x)/math.pi * 180;

	if moveAngle<0 then
		moveAngle=360+moveAngle;
	end
	local face=(face+360)%360;

	if (math.abs(moveAngle-face)<delta or math.abs(moveAngle+360-face)<delta or math.abs(moveAngle-360-face)<delta) then
		return true;
	end
	return false;
end

function U.InitPathFinding(npcBot)

	-- keeps the path for my pathfinding
	setHeroVar("NextHop", {})
	setHeroVar("PathfindingWasInitiated", false)
	-- creating the graph

	local SafeDist=2000;
	local safeSpots={};
	if GetTeam()==TEAM_RADIANT then
		safeSpots=U.RadiantSafeSpots;
	else
		safeSpots=U.DireSafeSpots;
	end

	--initialization
	local inf=100000
	local dist={}
	local NextHop={}

	print("Inits are done");
	for u,uv in pairs(safeSpots) do
		local q=true;
		dist[u]={};
		NextHop[u]={};
		for v,vv in pairs(safeSpots) do
			if U.GetDistance(uv,vv)>SafeDist then
				dist[u][v]=inf;
			else
				q=false;
				dist[u][v]=U.GetDistance(uv,vv);
			end
			NextHop[u][v]=v;
		end
		if q then
			print("There is an isolated vertex in safespots");
		end
	end

	--floyd algorithm (path is saved in NextHop)
	for k,_ in pairs(safeSpots) do
		for u,_ in pairs(safeSpots) do
			for v,_ in pairs(safeSpots) do
				if dist[u][v]>dist[u][k]+dist[k][v] then
					dist[u][v]=dist[u][k]+dist[k][v];
					NextHop[u][v]=NextHop[u][k];
				end
			end
		end
	end

	setHeroVar("NextHop", NextHop)
	setHeroVar("PathfindingWasInitiated", true)
end

function U.InitPath(npcBot)
	setHeroVar("FinalHop", false)
	setHeroVar("LastHop", nil)
end

function U.IsInLane()
	local npcBot = GetBot()

	local mindis = 10000
	setHeroVar("RetreatLane", getHeroVar("CurLane"))
	setHeroVar("RetreatPos", getHeroVar("LanePos"))

	for i=1,3,1 do
		local thisl = U.PositionAlongLane(npcBot, U.Lanes[i])
		local thisdis = U.GetDistance(GetLocationAlongLane(U.Lanes[i], thisl), npcBot:GetLocation())
		if thisdis < mindis then
			setHeroVar("RetreatLane", U.Lanes[i])
			setHeroVar("RetreatPos", thisl)
			mindis = thisdis
		end
	end

	if mindis > 1500 then
		setHeroVar("IsInLane", false)
	else
		setHeroVar("IsInLane", true)
	end

	return getHeroVar("IsInLane"), getHeroVar("RetreatLane")
end

-------------------------------------------------------------------------------
-- Neutral Functions
-------------------------------------------------------------------------------

-- TODO: should be broken, from looking at it (U["tableNeutralCamps"][CAMP_EASY] etc. doenst make sense)
function U.DistanceToNeutrals(hUnit, largestCampType)
    local camps = {}
    local sCamps = {}
    for i,v in ipairs(U["tableNeutralCamps"][CAMP_EASY]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end
    if largestCampType == CAMP_EASY then
        for k,v in U.Spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
            sCamps[k] = v
        end
        return camps
    end
    for i,v in ipairs(U["tableNeutralCamps"][CAMP_MEDIUM]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end
    if largestCampType == CAMP_MEDIUM then
        for k,v in U.Spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
            sCamps[k] = v
        end
    return camps
    end
    for i,v in ipairs(U["tableNeutralCamps"][CAMP_HARD]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end
    if largestCampType == CAMP_HARD then
        for k,v in U.Spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
            sCamps[k] = v
        end
        return camps
    end
    for i,v in ipairs(U["tableNeutralCamps"][CAMP_ANCIENT]) do
        camps[GetUnitToLocationDistance( hUnit, v )] = v
    end

    for k,v in U.Spairs(HighScore, function(t,a,b) return t[b] < t[a] end) do
        sCamps[k] = v
    end
    return camps
end

function U.NextNeutralSpawn()
	if DotaTime() < 30 then
		return 30
	else
		t = math.ceil((DotaTime() - 60) / 120) * 120 + 60
		print("Next spawn time is", t)
		return t
	end
end

function U.NearestNeutralCamp( hUnit, tCamps )
    local closestDistance = 1000000;
    local closestCamp;
    for k,v in ipairs(tCamps) do
        if v ~= nil and GetUnitToLocationDistance( hUnit, v[constants.VECTOR] ) < closestDistance then
            closestDistance = GetUnitToLocationDistance( hUnit, v[constants.VECTOR] )
            closestCamp = v
            --print(closestCamp..":"..closestDistance)
        end
    end
    return closestCamp
end

-------------------------------------------------------------------------------
-- Towers & Buildings Functions
-------------------------------------------------------------------------------

function U.GetTowerLocation(side, lane, n) --0 radiant 1 dire
	if (side==0) then
		if (lane==LANE_TOP) then
			if (n==1) then
				return U.Locations["RTT1"];
			elseif (n==2) then
				return U.Locations["RTT2"];
			elseif (n==3) then
				return U.Locations["RTT3"];
			end
		elseif (lane==LANE_MID) then
			if (n==1) then
				return U.Locations["RMT1"];
			elseif (n==2) then
				return U.Locations["RMT2"];
			elseif (n==3) then
				return U.Locations["RMT3"];
			end
		elseif (lane==LANE_BOT) then
			if (n==1) then
				return U.Locations["RBT1"];
			elseif (n==2) then
				return U.Locations["RBT2"];
			elseif (n==3) then
				return U.Locations["RBT3"];
			end
		end
	elseif(side==1) then
		if (lane==LANE_TOP) then
			if (n==1) then
				return U.Locations["DTT1"];
			elseif (n==2) then
				return U.Locations["DTT2"];
			elseif (n==3) then
				return U.Locations["DTT3"];
			end
		elseif (lane==LANE_MID) then
			if (n==1) then
				return U.Locations["DMT1"];
			elseif (n==2) then
				return U.Locations["DMT2"];
			elseif (n==3) then
				return U.Locations["DMT3"];
			end
		elseif (lane==LANE_BOT) then
			if (n==1) then
				return U.Locations["DBT1"];
			elseif (n==2) then
				return U.Locations["DBT2"];
			elseif (n==3) then
				return U.Locations["DBT3"];
			end
		end
	end
	return nil;
end

function U.GetLaneTower(team, lane, i)
	if i > 3 and i < 6 then
		return GetTower(team, 5 + i)
	end

	local j = i - 1
	if lane == LANE_MID then
		j = j + 3
	elseif lane == LANE_BOT then
		j = j + 6
	end

	if j < 9 and j > -1 and (lane == LANE_BOT or lane == LANE_MID or lane == LANE_TOP) then
		return GetTower(team, j)
	end

	return nil
end

function U.Fountain(team)
	if team==TEAM_RADIANT then
		return Vector(-7093,-6542);
	end
	return Vector(7015,6534);
end

-------------------------------------------------------------------------------
-- Creep Functions
-------------------------------------------------------------------------------

-- returns a VECTOR() with location being the center point of provided creep array
function U.GetCenterOfCreeps(creeps)
	local center=Vector(0,0);
	local n=0.0;
	local meleeW=2;
	if creeps==nil or #creeps==0 then
		return nil;
	end

	for _,creep in pairs(creeps) do
		if (string.find(creep:GetUnitName(),"melee")~=nil) then
			center = center + (creep:GetLocation())*meleeW;
			n=n+meleeW;
		else
			n=n+1;
			center = center + creep:GetLocation();
		end
	end
	if n==0 then
		return nil;
	end
	center=center/n;

	return center;
end

function U.CreepGC()
    -- does it works? i don't know
    --print("CreepGC");
    local swp_table = {}
    for handle,time_health in pairs(self["creeps"])
    do
        local rm = false;
        for t,_ in pairs(time_health)
        do
            if(GameTime() - t > 60) then
                rm = true;
            end
            break;
        end
        if not rm then
            swp_table[handle] = time_health;
        end
    end

    U.creeps = swp_table;
end

function U.UpdateCreepHealth(creep)
    if U.creeps == nil then
        U.creeps = {};
    end

    if(U.creeps[creep] == nil) then
        U.creeps[creep] = {};
    end
    if(creep:GetHealth() < creep:GetMaxHealth()) then
        U.creeps[creep][GameTime()] = creep:GetHealth();
    end

    if(#U.creeps > 1000) then
        self:CreepGC();
    end
end

function U.GetCreepHealthDeltaPerSec(creep)
    if U.creeps == nil then
        U.creeps = {};
    end

    if(U.creeps[creep] == nil) then
        return 0;
    else
        for _time,_health in U.PairsByKeys(U.creeps[creep],U.SortFunc) do
            -- only Consider very recent datas
            if(GameTime() - _time < 3) then
                local e = (_health - creep:GetHealth()) / (GameTime() - _time);
                return e;
            end
        end
        return 0;
    end
end

-- takes a "RANGE", returns creep handle and health value of that creep
function U.GetWeakestCreep(creeps)
	local WeakestCreep=nil;
	local LowestHealth=10000;

	for _,creep in pairs(creeps) do
		U.UpdateCreepHealth(creep)
		if creep:IsAlive() then
			if creep:GetHealth()<LowestHealth then
				LowestHealth=creep:GetHealth();
				WeakestCreep=creep;
			end
		end
	end

	return WeakestCreep, LowestHealth;
end

-------------------------------------------------------------------------------
-- Functions for Offense & Defense
-------------------------------------------------------------------------------

function U.IsHeroAttackingMe(hero, fTime)
	if (hero == nil) or (not hero:IsAlive()) then return false end

	local fTime = fTime or 2.0
	local npcBot = GetBot()

	if npcBot:WasRecentlyDamagedByAnyHero(hero, fTime) then
		return true
	end
	return false
end

function U.IsAnyHeroAttackingMe(fTime)
	local fTime = fTime or 2.0
	local npcBot = GetBot()

	if npcBot:WasRecentlyDamagedByAnyHero(fTime) then
		return true
	end
	return false
end

function U.IsTowerAttackingMe(fTime)
	local fTime = fTime or 2.0
	local npcBot = GetBot()

	if npcBot:WasRecentlyDamagedByTower(fTime) then
		return true
	end
	return false
end

function U.IsCreepAttackingMe(fTime)
	local fTime = fTime or 2.0
	local npcBot = GetBot()

	if npcBot:WasRecentlyDamagedByCreep(fTime) then
		return true
	end
	return false
end

-- returns a VECTOR() with location being the center point of provided hero array
function U.GetCenter(Heroes)
	if Heroes==nil or #Heroes==0 then
		return nil;
	end

	local sum=Vector(0.0,0.0);
	local hn=0.0;

	for _,hero in pairs(Heroes) do
		if hero~=nil and hero:IsAlive() then
			sum=sum+hero:GetLocation();
			hn=hn+1;
		end
	end
	return sum/hn;
end

-- takes a "RANGE", returns hero handle and health value of that hero
-- FIXME - make it handle heroes that went invisible if we have detection
function U.GetWeakestHero(bot, r)
	local EnemyHeroes = bot:GetNearbyHeroes(r, true, BOT_MODE_NONE);

	if EnemyHeroes==nil or #EnemyHeroes==0 then
		return nil,10000;
	end

	local WeakestHero=nil;
	local LowestHealth=10000;

	for _,hero in pairs(EnemyHeroes) do
		if hero~=nil and hero:IsAlive() then
			if hero:GetHealth()<LowestHealth then
				LowestHealth=hero:GetHealth();
				WeakestHero=hero;
			end
		end
	end

	return WeakestHero, LowestHealth;
end

function U.FindTarget(dist)
	--npcBot:GetEstimatedDamageToTarget( true, WeakestCreep, AttackSpeed, DAMAGE_TYPE_PHYSICAL )
	local npcBot = GetBot()

	local mindis = 100000
	local candidate = nil
	local MaxScore = -1
	local damage = 0

	local Enemies = npcBot:GetNearbyHeroes(dist, true, BOT_MODE_NONE);

	if Enemies == nil or #Enemies == 0 then
		setHeroVar("Target", nil)
		return nil, 0.0, 0.0
	end

	local Towers = npcBot:GetNearbyTowers(1100, true)
	local AlliedTowers = npcBot:GetNearbyTowers(950, false)
	local AlliedCreeps = npcBot:GetNearbyCreeps(1000, false)
	local EnemyCreeps = npcBot:GetNearbyCreeps(700 ,true)
	local nEc = 0
	local nAc = 0
	if AlliedCreeps ~= nil then
		nAc = #AlliedCreeps
	end
	if EnemyCreeps ~= nil then
		nEc = #EnemyCreeps
	end

	local nTo = 0
	if Towers ~= nil then
		nTo = #Towers
	end

	local fTo = 0
	if AlliedTowers ~= nil then
		fTo = #AlliedTowers
	end

	for _,enemy in pairs(Enemies) do
		if U.NotNilOrDead(enemy) and enemy:GetHealth()>0 and GetUnitToLocationDistance(enemy, U.Fountain(U.GetOtherTeam()))>1350 then
			local myDamage = npcBot:GetEstimatedDamageToTarget(true, enemy, 4.5, DAMAGE_TYPE_ALL)

			local nfriends = 0
			for j=1,5,1 do
				local enemy2 = GetTeamMember(U.GetOtherTeam(),j)
				if U.NotNilOrDead(enemy2) and enemy2:GetHealth()>0 then
					if GetUnitToUnitDistance(enemy,enemy2)<1200 and enemy2:GetHealth()/enemy2:GetMaxHealth()>0.4 then
						nfriends = nfriends+1
					end
				end
			end

			local nMyFriends=0
			for j =1,5,1 do
				local Ally = GetTeamMember(GetTeam(),j)
				if U.NotNilOrDead(Ally) and GetUnitToUnitDistance(enemy,Ally)<1100 then
					nMyFriends = nMyFriends+1
				end
			end

			local lvl = U.GetHeroLevel()
			local score = Min(myDamage/enemy:GetHealth(),4) + (nMyFriends)/1.7 - (nfriends)/1.7 - GetUnitToUnitDistance(enemy,npcBot)/3500 -(1-npcBot:GetHealth()/npcBot:GetMaxHealth()) - nTo/(Min(lvl/8,3)) + fTo/(Min(lvl/8,3)) - nEc/(2*lvl) + nAc/(2*lvl);
			if score > MaxScore then
				damage = myDamage
				candidate = enemy
				MaxScore = score
			end
		end
	end

	return candidate, damage, MaxScore
end

-------------------------------------------------------------------------------
-- Item & Courier Functions
-------------------------------------------------------------------------------

function U.NumberOfItems(bot)
	local n = 0;

	for i = 0, 5, 1 do
        local item = bot:GetItemInSlot(i);
				if item ~= nil then
					n = n+1;
				end
    end

	return n;
end

function U.NumberOfItemsInBackpack(bot)
	local n = 0;

	for i = 6, 8, 1 do
        local item = bot:GetItemInSlot(i);
				if item ~= nil then
					n = n+1;
				end
    end

	return n;
end

function U.NumberOfItemsInStash(bot)
	if bot:GetStashValue() == 0 then return 0 end

	local n = 0;

	for i = 9, 14, 1 do
        local item = bot:GetItemInSlot(i);
				if item ~= nil then
					n = n+1;
				end
    end

	return n;
end

function U.HaveItem(npcBot, item_name)
    local slot = npcBot:FindItemSlot(item_name)
		if slot >= 0 then
			local slot_type = npcBot:GetItemSlotType(slot)
			if slot_type == ITEM_SLOT_TYPE_MAIN then
				return npcBot:GetItemInSlot(slot);
			elseif slot_type == ITEM_SLOT_TYPE_BACKPACK then
				print("FIXME: Implement swapping BACKPACK to MAIN INVENTORY of item: ", item_name)
				return nil
			elseif slot_type == ITEM_SLOT_TYPE_STASH then
				if npcBot:HasModifier("modifier_fountain_aura") then
					if U.NumberOfItems(bot) < 6 then
						U.MoveItemsFromStashToInventory(bot)
						return U.HaveItem(npcBot, item_name)
					else
						print("FIXME: Implement swapping STASH to MAIN INVENTORY of item: ", item_name)
					end
				end
				return nil
			else
				print("ERROR: condition should not be hit: ", item_name);
			end
		end

    return nil
end

function U.MoveItemsFromStashToInventory(bot)
	if U.NumberOfItems(bot) == 6 and U.NumberOfItemsInBackpack(bot) == 3 then return end
	if U.NumberOfItemsInStash(bot) == 0 then return end

	for i = 0, 5, 1 do
		if bot:GetItemInSlot(i) == nil then
			for j = 9, 14, 1 do
				local item = bot:GetItemInSlot(j)
				if item ~= nil then
					bot:Action_SwapItems(i, j)
				end
			end
		end
	end

	for i = 6, 8, 1 do
		if bot:GetItemInSlot(i) == nil then
			for j = 9, 14, 1 do
				local item = bot:GetItemInSlot(j)
				if item ~= nil then
					bot:Action_SwapItems(i, j)
				end
			end
		end
	end
end

function U.HaveTeleportation(npcBot)
	if U.GetHeroName(npcBot) == "furion" then
		return true
	end

	if U.HaveItem(npcBot, "item_tpscroll") ~= nil
		or U.HaveItem(npcBot, "item_travel_boots_1") ~= nil
		or U.HaveItem(npcBot, "item_travel_boots_2") ~= nil then
		return true
	end
	return false
end

function U.IsItemAvailable(item_name)
    local npcBot = GetBot();

	local item = U.HaveItem(npcBot, item_name)
	if item ~= nil then
		if item:IsFullyCastable() then
			return item
		end
	end
    return nil;
end

--important items for delivery
function U.HasImportantItem()
	 local npcBot = GetBot()

    for i = 9, 14, 1 do
        local item = npcBot:GetItemInSlot(i)
		if item ~= nil then
			if string.find(item:GetName(),"recipe") ~= nil or string.find(item:GetName(),"item_boots") ~= nil or string.find(item:GetName(),"item_bottle") then
				return true
			end

			if(item:GetName()=="item_ward_observer" and item:GetCurrentCharges() > 1) then
				return true
			end
		end
    end

    return false
end

function U.CourierThink(npcBot)
	local checkLevel, newTime = U.TimePassed(getHeroVar("LastCourierThink"), 1.0);

	if not checkLevel then return end
	setHeroVar("LastCourierThink", newTime)

	--print(U.GetHeroName(npcBot), " SV: ", npcBot:GetStashValue(), ", CV: ", npcBot:GetCourierValue(), ", HII: ", U.HasImportantItem())

	if npcBot:IsAlive() and (npcBot:GetStashValue() > 500 or npcBot:GetCourierValue() > 0 or U.HasImportantItem()) and IsCourierAvailable() then
		--print("got item");
		npcBot:Action_CourierDeliver();
		return;
	end
end

-------------------------------------------------------------------------------

return U;
