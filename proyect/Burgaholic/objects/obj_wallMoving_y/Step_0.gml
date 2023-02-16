event_inherited()
var_spd = osc_step(inc, ampl)

y += var_spd

if(place_meeting(x, y-1, obj_player))
{
	obj_player.var_vspdCarry += var_spd;
};