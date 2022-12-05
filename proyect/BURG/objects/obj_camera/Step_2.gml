/// @description Position Camera
camera_set_view_size(view, view_width, view_height);

if(instance_exists(obj_player))
{
	var _x = clamp(obj_player.x - view_width/2, 0, room_width -view_width),
		_y = clamp(obj_player.y - view_height/2, 0, room_height -view_height),
		_cur_x = camera_get_view_x(view),
		_cur_y = camera_get_view_y(view),
		_spd = 0.1;
	
	if(var_shakeEnabled)
	{
		var_shakeTime--;
		
		_cur_x += choose(-var_shakeAmmount, var_shakeAmmount);
		_cur_y += choose(-var_shakeAmmount, var_shakeAmmount);
		camera_set_view_pos(view, _x, _y);
		
		if(var_shakeTime <= 0)
		{
			var_shakeAmmount --;
			
			if(var_shakeAmmount >= 0)
			{
				var_shakeAmmount = 0;
				var_shakeTime = 0;
				var_shakeEnabled = false;
				var_shadeFade = 0;
			};
		};
	}
	
	camera_set_view_pos
		(
			view, 
			lerp(_cur_x, _x, _spd), 
			lerp(_cur_y, _y, _spd)
		);
	
	//Parallax
	layer_x("parallax", _cur_x *0.25);
	layer_x("parallax2", _cur_x *0.5);
	layer_x("parallax3", _cur_x *0.75);
	layer_x("background", _cur_x *1);
};

