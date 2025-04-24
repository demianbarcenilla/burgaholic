
if(var_state = 0)
{
	var _dir = keyboard_check(global.k_right) - keyboard_check(global.k_left);
	
	//Horizontal Movement
	if(_dir != 0)
	{
		var_spd += var_fric*_dir;
		sprite_index = spr_spryRun;
		
		image_xscale = _dir; //Flip Sprite
	}
	else
	{
		var_spd = lerp(var_spd, 0, .2);
		sprite_index = spr_spry;
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

	//DIE
	if(place_meeting(x, y, obj_arcadeEnemyTemplate))
	{
		var_state = 1;
		alarm[0] = 60;
		var_vspd = -5;
		
		audio_play_sound(sfx_explosion, 1, false);
	};
	
	collisionBasic();
	
	if(keyboard_check(global.k_jump))
	{
		if(var_reloaded)
		{
			instance_create_depth(x, y-12, depth+1, obj_spryBullet);
			
			var_reloaded = false;
			
			audio_play_sound(sfx_noiseShort, 1, false)
			alarm[3] = 60*10;
		}
		else
		{
			stepAlarm(2, 3)
		};
		
	};
}
else
{
	x += var_spd;
	y += var_vspd;
	var_vspd += var_grav;
	sprite_index = spr_spryDead;
	image_angle += 15;	
};

if(var_score >= 500)
{
	burg_unlockAndDisplay(58);
}

if(var_score >= 750)
{
	burg_unlockAndDisplay(59);
}