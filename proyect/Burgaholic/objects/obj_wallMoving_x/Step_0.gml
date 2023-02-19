var_spd = osc_step(inc, ampl)

if(place_meeting(x, y-1, obj_player))
{
	obj_player.var_spdCarry = var_spd;
	
};

x += var_spd;