#include <amxmodx>
#include <zombie_plague/add_commas>
//#include <zombie_plague/zp_packs_system>
//#include <zombie_plague/zp_points_system>

#define PLUGIN  "[ZP] Leader Info"
#define VERSION "1.0"
#define AUTHOR  "DadoDz"

native zp_get_user_packs(index);
native zp_get_user_points(index);

new g_playername[33][32];

public plugin_init()
{
    register_plugin(PLUGIN, VERSION, AUTHOR);

    register_logevent("logevent_round_end", 2, "1=Round_End");
}

public client_putinserver(id) get_user_name(id, g_playername[id], charsmax(g_playername[]));

public logevent_round_end() set_task(1.0, "Leader");

public Leader()
{
	new iPack = 0, iPoint = 0;
	new iLeaderPacks = GetLeader_Packs(iPack);
	new iLeaderPoints = GetLeader_Points(iPoint);

	if (!is_user_connected(iLeaderPacks) && !is_user_connected(iLeaderPoints))
		return;

	static PacksString[16], PointsString[16], leaderPacksName[32], leaderPointsName[32];
	add_commas(iPack, PacksString, charsmax(PacksString));
	add_commas(iPoint, PointsString, charsmax(PointsString));

	if (is_user_connected(iLeaderPacks))
		copy(leaderPacksName, charsmax(leaderPacksName), g_playername[iLeaderPacks]);
	else
		copy(leaderPacksName, charsmax(leaderPacksName), "N/A");

	if (is_user_connected(iLeaderPoints))
		copy(leaderPointsName, charsmax(leaderPointsName), g_playername[iLeaderPoints]);
	else
		copy(leaderPointsName, charsmax(leaderPointsName), "N/A");

	client_print_color(0, 0, "^x04[^x01ZP^x04]^x03 %s^x01 is Leader with^x04 %s Packs^x01.", leaderPacksName, PacksString);
	client_print_color(0, 0, "^x04[^x01ZP^x04]^x03 %s^x01 is Leader with^x04 %s Points^x01.", leaderPointsName, PointsString);
}

GetLeader_Packs(&iPack)
{
	new iPlayers[32], iNum, id, i, iLeader, iPacks;
	get_players(iPlayers, iNum, "ch");

	for (i = 0; i < iNum; i++)
	{
		id = iPlayers[i];
		iPacks = zp_get_user_packs(id);

		if (iPacks > iPack)
		{
			iPack = iPacks;
			iLeader = id;
		}
	}
	
	return iLeader;
}

GetLeader_Points(&iPoint)
{
	new iPlayers[32], iNum, id, i, iLeader, iPoints;
	get_players(iPlayers, iNum, "ch");
	
	for (i = 0; i < iNum; i++)
	{
		id = iPlayers[i];
		iPoints = zp_get_user_points(id);

		if (iPoints > iPoint)
		{
			iPoint = iPoints;
			iLeader = id;
		}
	}
	
	return iLeader;
}
