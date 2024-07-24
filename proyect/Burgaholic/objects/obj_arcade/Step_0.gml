if(place_meeting(x, y, obj_player)) and (keyboard_check_pressed(global.k_up))
{
	audio_play_sound(sfx_hit4, 1, 0)
	
	room_goto(var_arcadeGame);
	with(obj_player)
	{
		var_state = STATE_MACHINE.arcade
		
		var _controller = instance_create_depth(x, y, depth, obj_arcadeController);
		_controller.xx = obj_player.x;
		_controller.yy = obj_player.y;
	}		
	global.currentRoom = room;
};

