function enemy_wallBounce(dirt)
{
	if(place_meeting(x+sign(var_spd), y, obj_wall))
	{
		var_spd = -var_spd;
		if(dirt) vfx_dirt();
		screenshake(5, 2, .1);
	};

	if(place_meeting(x, y+sign(var_vspd), obj_wall))
	{
		var_vspd = -var_vspd;
		if(dirt) vfx_dirt();
		screenshake(5, 2, .1);
	};
}

function enemy_proyCreate(object, assignHspd, assignVspd)
{
	var _proy = instance_create_depth(x, y, depth+1, obj_slimeFall);
		_proy.var_spd = assignHspd;
		_proy.var_vspd = assignVspd;
}

function boss_draw()
{
	if(var_shake)
	{
		draw_sprite(sprite_index, image_index, x+shk_step(1), y +shk_step(1));
	}
	else
	{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, var_angle, image_blend, 1);
	};
}