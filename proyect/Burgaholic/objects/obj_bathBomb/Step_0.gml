if(place_meeting(x, y, obj_player))
{
	obj_player.var_effect = 3;
	repeat(100)
	{
		var _bubble = instance_create_depth(x, y-20, depth-1, obj_bubbleFX);
		_bubble.var_state = 0;
	};
	audio_play_sound(sfx_explosion, 1, false);
	instance_destroy();
};