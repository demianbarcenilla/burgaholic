y += osc_step(1, .1);
if(place_meeting(x, y, obj_player))
{
	obj_player.var_effect = 1;
	audio_play_sound(sfx_pop, 1, 0);
	instance_destroy();
	screenshake(10, 5, .1)
	repeat(4){instance_create_depth(x, y, depth, obj_cloudSFX)}
};