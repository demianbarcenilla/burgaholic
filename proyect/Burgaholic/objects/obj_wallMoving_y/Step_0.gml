var_spd = osc_step(inc, ampl)

if(place_meeting(x, y+1, obj_player)) and (var_spd <= 0)
{
	//obj_player.var_vspdCarry += var_spd;
};

y += var_spd