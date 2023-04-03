if(instance_exists(obj_player))
{
	if(place_meeting(x -sign(obj_player.var_spd), y, obj_player))
	{
		with(obj_key)
		{
			if(var_touched)
			{
				var_destroy = true;
			};
		}
	}
};
