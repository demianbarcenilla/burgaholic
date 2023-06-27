y += osc_step(1, .1);

if(place_meeting(x, y, obj_player))
{
	obj_player.var_state = STATE_MACHINE.submarine;
	instance_destroy();
	screenshake(5, 5, .1)
};