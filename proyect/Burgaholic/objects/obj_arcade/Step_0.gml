if(place_meeting(x, y, obj_player)) and (keyboard_check_pressed(global.k_up))
{
	audio_play_sound(sfx_hit4, 1, 0)
	
	instance_deactivate_all(false);
	instance_activate_object(obj_control);
	room_goto(var_arcadeGame);
		
	global.currentRoom = room;
};

