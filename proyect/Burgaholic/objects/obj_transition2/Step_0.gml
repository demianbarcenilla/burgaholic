if(image_index = 7)
{
	global.specialMusic = false;
	room_goto(var_room)
};

if(image_index > image_number -1)
{
	instance_destroy();
};