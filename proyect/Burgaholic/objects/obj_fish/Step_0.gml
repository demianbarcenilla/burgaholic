if(var_state = 0)
{
	var _dir = keyboard_check(global.k_right) - keyboard_check(global.k_left);
	
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
		if(keyboard_check_pressed(global.k_up))
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
			sprite_index = spr_fish;
		}
		else
		{
			sprite_index = spr_fishRun;
		};
	}
	else //ANIMATE JUMP
	{
		var_vspd += var_grav;
	
		image_speed = 0;
		image_index = 0;
		sprite_index = spr_fishJump;
	};

	if(place_meeting(x, y, obj_fishEnemyDADDY))
	{
		var_state = 1;
		alarm[0] = 60;
		var_vspd = -var_jspd;
		
		audio_play_sound(sfx_explosion, 1, false);
	};
	
	if(keyboard_check_pressed(global.k_jump))
	{
		var _bullet = instance_create_depth(x+(image_xscale*4), y-3, depth+1, obj_spryBullet);
		_bullet.var_spd = image_xscale*3;
		_bullet.var_vspd = 0;
		_bullet.wave = true;
		audio_play_sound(sfx_noiseShort, 1, false);
		
		alarm[2] = 60*10;
		
	};
	collisionBasic();
}
else
{
	x += var_spd;
	y += var_vspd;
	var_vspd += var_grav;
	sprite_index = spr_fishDead;
	image_angle += 15;	
};

if(var_score >= 1000)
{
	burg_unlockAndDisplay(98);
}

if(var_score >= 2000)
{
	burg_unlockAndDisplay(99);
}