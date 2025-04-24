if(var_state = 0)
{
	var _hdir = keyboard_check(global.k_right) - keyboard_check(global.k_left);
	var _vdir = keyboard_check(global.k_down) - keyboard_check(global.k_up);
	
	if (_hdir != 0)
	{
		image_xscale = _hdir;
	}
	
	var_spd = _hdir * max_spd;
	var_vspd = _vdir * max_spd;
	
	if(keyboard_check_pressed(global.k_jump))
	{
		canUnlock_dashless = false;
		var_state = 1;
		sprite_index = spr_burgTennis;
		dash_timer = dash_timer_max;
		audio_play_sound(sfx_jump, 0, 0);
	}
	
	collisionBasic();
}
else if(var_state = 1)
{
	var_spd = image_xscale * dash_spd;
	var_vspd = 0;
	dash_timer--;
	
	if(dash_timer <= 0)
	{
		var_state = 0;
		
		sprite_index = spr_burgTennisStill;
	}
	
	collisionBasic();
}
else
{
	var _deadInstance = instance_create_depth(x, y, depth, obj_staticFX)
	_deadInstance.sprite_index = spr_burgTennisDead;
	_deadInstance.var_func = function(){room_goto(rm_arcadeTennis)};
	
	instance_destroy();
};