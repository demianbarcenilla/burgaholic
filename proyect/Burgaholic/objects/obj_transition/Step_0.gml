if(image_index = 3)
{
	if(!returning)
	{
		room_goto(specialRoom);
		global.subStage = substage.bonus;
	}
	else
	{
		room_goto(global.onionRoom)
		global.subStage = substage.normal;
	};
};
if(image_index = 4)
{
	if(returning)
	{
		if(instance_exists(obj_onion)) and (instance_exists(obj_player))
		{
			obj_player.x = obj_onion.x;
			obj_player.y = obj_onion.y;
			instance_destroy(obj_onion);
		};
	};
		
	screenshake(30, 1, .2);
};

if(image_index > image_number -1)
{
	instance_destroy();
};