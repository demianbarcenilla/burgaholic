if(var_end)
{
	instance_destroy(obj_player);
	global.specialMusic = false;
	room_goto(var_room)
	
	instance_destroy();
};