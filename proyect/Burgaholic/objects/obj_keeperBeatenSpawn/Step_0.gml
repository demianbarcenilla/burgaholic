if(place_meeting(x, y, obj_player)) and (keyboard_check_pressed(global.k_up))
{
	with(obj_player)
	{
		var_spd = 0;
		var_vspd = 0;
	};
	var_action();
};

if(!place_meeting(x, y+1, obj_wall))
{
	var_vspd -= var_grav;
};
collisionBasic();