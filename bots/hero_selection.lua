

----------------------------------------------------------------------------------------------------

function Think()
	gs = GetGameState()
	print( "game state: ", gs )

	if ( gs == GAME_STATE_HERO_SELECTION )
	then
		a = GetGameMode()
		print( "game mode: ", a);

		if ( a == GAMEMODE_AP )
		then 
			print ( "All Pick" )
			if ( GetTeam() == TEAM_RADIANT )
			then
				print( "selecting radiant" );
				if ( IsPlayerInHeroSelectionControl(2) )
				then
					SelectHero( 2, "npc_dota_hero_antimage" );
				end
				
				if ( IsPlayerInHeroSelectionControl(3) )
				then
					SelectHero( 3, "npc_dota_hero_bristleback" );
				end
				
				if ( IsPlayerInHeroSelectionControl(4) )
				then
					SelectHero( 4, "npc_dota_hero_bane" );
				end
				
				if ( IsPlayerInHeroSelectionControl(5) )
				then
					SelectHero( 5, "npc_dota_hero_viper" );
				end
				
				if ( IsPlayerInHeroSelectionControl(6) )
				then
					SelectHero( 6, "npc_dota_hero_crystal_maiden" );
				end
			elseif ( GetTeam() == TEAM_DIRE )
			then
				print( "selecting dire" );
				SelectHero( 7, "npc_dota_hero_axe" );
				SelectHero( 8, "npc_dota_hero_lion" );
				SelectHero( 9, "npc_dota_hero_juggernaut" );
				SelectHero( 10, "npc_dota_hero_witch_doctor" );
				SelectHero( 11, "npc_dota_hero_nevermore" );
			end
		elseif ( a == GAMEMODE_1V1MID )
		then
			print ( "1V1 MID" )
			if ( GetTeam() == TEAM_RADIANT )
			then
				print( "selecting radiant" );
				SelectHero( 2, "npc_dota_hero_abyssal_underlord" );
			elseif ( GetTeam() == TEAM_DIRE )
			then
				print( "selecting dire" );
				SelectHero( 7, "npc_dota_hero_drow_ranger" );
			end
		end
	end
end

function UpdateLaneAssignments()
	if ( GetTeam() == TEAM_RADIANT ) then
		return {
			[1] = LANE_BOT,
			[2] = LANE_TOP,
			[3] = LANE_BOT,
			[4] = LANE_MID,
			[5] = LANE_BOT,
		};
	elseif ( GetTeam() == TEAM_DIRE ) then
		return {
			[1] = LANE_BOT,
			[2] = LANE_BOT,
			[3] = LANE_TOP,
			[4] = LANE_BOT,
			[5] = LANE_MID,
		};
	end
end

----------------------------------------------------------------------------------------------------