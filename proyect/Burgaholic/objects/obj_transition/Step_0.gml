if(image_index = 3)
{
	room_goto(specialRoom);
	global.stage = stage.bonus;
};
if(image_index = 4)
{
	screenshake(30, 1, .2);
};

if(image_index > image_number -1)
{
	instance_destroy();
};