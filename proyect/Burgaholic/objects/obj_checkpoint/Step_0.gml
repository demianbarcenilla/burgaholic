if(place_meeting(x, y, obj_player))
{
	obj_player.var_checkpoint = room;
	obj_player.var_checkpointX = x;
	obj_player.var_checkpointY = y;
};

if(instance_exists(obj_player))
{
	if(obj_player.var_checkpoint = room)
	{
		image_index = 1
	};
	else
	{
		image_index = 0;
	}
};