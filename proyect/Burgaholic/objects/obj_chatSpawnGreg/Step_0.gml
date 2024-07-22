if(!var_jumping)
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
else
{
	sprite_index = spr_gregJump;
	
	var_vspd += var_grav
	y += var_vspd
	
	if(var_vspd > 0)
	{
		depth = 250;
	};
	
	if(y > room_height+128)
	{
		screenshake(10, 2, .1)
		instance_destroy();
		instance_create_depth(x, y, depth, obj_bossPond)
	};
};