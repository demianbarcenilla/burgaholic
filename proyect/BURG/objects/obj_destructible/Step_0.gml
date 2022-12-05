/// @description Destroy
if(instance_exists(obj_player))
{
	if(place_meeting(x -sign(obj_player.var_hspd), y, obj_player) and (obj_player.var_state = STATE_MACHINE.damage))
	{
		var _sfx = audio_play_sound(sfx_glass, 2, false);
		audio_sound_pitch(_sfx, random_range(1.1, 0.9));
		
		instance_destroy();
	};
};