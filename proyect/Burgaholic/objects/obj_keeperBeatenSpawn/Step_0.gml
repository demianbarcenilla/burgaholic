if(global.stage != stage.pond)
{
	if(place_meeting(x, y, obj_player)) and (keyboard_check_pressed(global.k_up))
	{
		with(obj_player)
		{
			var_spd = 0;
			var_vspd = 0;
		};
		var_action();
	};
}

else //If you're on the pond, automatically trigger marcus' first chat
{
	if(place_meeting(x, y, obj_notebook))
	{
		instance_destroy(obj_notebook);
		var_action();
	};
	
};

if(!place_meeting(x, y+1, obj_wall))
{
	var_vspd -= var_grav;
};
collisionBasic();