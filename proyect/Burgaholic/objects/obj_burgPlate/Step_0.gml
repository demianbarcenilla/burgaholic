if(place_meeting(x, y, obj_burg))
{
	if(obj_burg.var_state = 0)
	{
		instance_destroy(obj_burg);
		image_index = 1
	
		if(alarm[0] = -1)
		{
			alarm[0] = 60;
		};
	};
};