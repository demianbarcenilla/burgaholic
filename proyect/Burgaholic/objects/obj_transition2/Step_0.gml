if(image_index = 7)
{
	instance_destroy(obj_player);
	global.specialMusic = false;
	room_goto(var_room)
};

if(image_index > image_number -1)
{
	instance_destroy();
};