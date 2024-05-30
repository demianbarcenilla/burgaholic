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
		var_state = 1;
		sprite_index = spr_burgTennisDash;
		dash_timer = dash_timer_max;
		audio_play_sound(sfx_jump, 0, 0);
	}
	/*
	//Horizontal Movement
	if(_dir != 0)
	{
		var_spd += var_fric*_dir;
		image_xscale = _dir; //Flip Sprite
	}
	else
	{
		var _ice = place_meeting(x, y+1, obj_ice)
		var_spd = lerp(var_spd, 0, _ice ? .05 : .2);
	};
	
	//Instead of clamping, use linear interpolation so i can use 
	//higher speeds than the max, for certain game feel fx
	if(var_spd > var_mspd)
	{
		var_spd = lerp(var_spd, var_mspd, .1)
	}
	else if(var_spd < -var_mspd)
	{
		var_spd = lerp(var_spd, -var_mspd, .1) 
	};
	
	//Vertical Movement / ANIMATION
	if(place_meeting(x, y+1, obj_wall))
	{	
		if(keyboard_check_pressed(global.k_jump))
		{
			var_vspd = -var_jspd;
			audio_play_sound(sfx_jump, 0, 0);
		}
		else
		{
			var_vspd = 0;
		}
	
		//Animate
		image_speed = .4;
		if(abs(var_spd) <= .5)
		{
			sprite_index = spr_burg;
		}
		else
		{
			sprite_index = spr_burgRun;
		};
	}
	else //ANIMATE JUMP
	{
		var_vspd += var_grav;
	
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_burg;
	};

	if(place_meeting(x, y, obj_arcadeEnemyTemplate))
	{
		var_state = 1;
		alarm[0] = 60;
		var_vspd = -var_jspd;
	};
*/	
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
		
		sprite_index = spr_burg;
	}
	
	collisionBasic();
}
else
{
	sprite_index = spr_burgDead;
	image_angle += 15;
};