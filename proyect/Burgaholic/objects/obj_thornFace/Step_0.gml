if(image_index = 0)
{
	if(instance_exists(obj_player))
	{
		if(obj_player.y >= y-(sprite_width/2)) and (obj_player.y <= y+(sprite_width/2))
		{
			if(obj_player.x < x)
			{
				var_dir = -1;
			}
			else
			{
				var_dir = 1;
			}
			
			if(!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, true))
			{
				image_index = 1;
			};
		};
	};
}

else if(image_index = 1)
{
	var_spd += var_fric *var_dir;
	if(place_meeting(x + sign(var_spd), y, obj_wall))
	{
		image_index = 0;
		var_spd = 0;
	};
};

collisionBasic();