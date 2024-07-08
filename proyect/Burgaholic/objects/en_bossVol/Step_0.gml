switch(var_state)
{
	case PEPPER_STATE.spawning:
		sprite_index = spr_bossVolSpawn;
		if(image_index >= image_number-1)
		{
			var_state = SLIME_STATE.ascent;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case PEPPER_STATE.idle:
	
		var _spdMult = 8
		if(abs(var_spd) = var_mspd*_spdMult)
		{
			var_spd /= _spdMult;
		};
		
		//Bounce off walls
		enemy_wallBounce(false);
		
		var _random = irandom_range(0, 100)
			if(!var_hasExploded) and (_random < 1)
			{
				instance_create_depth(x,    y-21, depth-1, obj_explosionHURT);
				instance_create_depth(x-46, y-21, depth-1, obj_explosionHURT);
				instance_create_depth(x+46, y-21, depth-1, obj_explosionHURT);
				instance_create_depth(x, y-21+46, depth-1, obj_explosionHURT);
				instance_create_depth(x, y-21-46, depth-1, obj_explosionHURT);
				var_vspd = -10;
				var_spd *= _spdMult;
				var_hasExploded = true;
				y -= 2;
			};
			
		//Grounded
		if(place_meeting(x, y+1, obj_wall))
		{
			var_hasExploded = false;
			
			sprite_index = spr_bossVolWalk;
			var_vspd = 0;
			
			//Jump when player jumps
			if(keyboard_check_pressed(global.k_jump))
			{
				var_vspd = -8;
			};
		};
		
		else //When in the air
		{
			sprite_index = spr_bossVolJump;
			
			//Add gravity
			var_vspd += var_grav;
		}
		
		if(var_hasExploded)
		{
			sprite_index = spr_bossVolExplode;
			var_angle += 10;
		}
		else
		{
			var_angle = 0;
		}
		
		collisionBasic();
		
		var_stateCurrent = var_state;
	break;
	
	case PEPPER_STATE.hit:
		sprite_index = var_hitSprite;
		stepAlarm(2, 30);
	break;
};

if(var_state != PEPPER_STATE.hit)
{
	var_stateCurrent = var_state;
};

image_xscale = var_spd = 0 ? 1 : sign(var_spd);

if(var_hp <= 0)
{
	save_bossBeaten(2);
}