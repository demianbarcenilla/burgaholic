switch(var_state)
{
	case CAMEL_STATE.spawning:
		sprite_index = spr_bossBeaSpawn;
		if(image_index >= image_number-1)
		{
			var_state = SLIME_STATE.ascent;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case CAMEL_STATE.charge:
		stepAlarm(0, irandom_range(60, 120))
		sprite_index = spr_bossBeaCharge;
		
		var _spdMult = 8
		if(abs(var_spd) = var_mspd*_spdMult)
		{
			var_spd /= _spdMult;
		};
		
		collisionBasic();
		
		var_stateCurrent = var_state;
	break;
	
	case CAMEL_STATE.rush:
		sprite_index = spr_bossBeaRun;
		
		var_spd = var_mspd *image_xscale;
		
		
		collisionBasic()
		
		//Grounded
		if(place_meeting(x, y+1, obj_wall))
		{
			var_vspd = 0;
			
			if(place_meeting(x +sign(var_spd), y, obj_wall))
			{
				var_vspd = -3;
				
				sprite_index = spr_bossBeaHit;
				image_xscale *= -1;
			};
			
			if(sprite_index = spr_bossBeaHit)
			{
				var_state = CAMEL_STATE.charge;
			};
		}
		else //Air
		{
			var_vspd -= var_grav;
		};
		
	break;
	
	case CAMEL_STATE.hit:
		sprite_index = var_hitSprite;
		stepAlarm(2, 30);
	break;
};

if(var_state != CAMEL_STATE.hit)
{
	var_stateCurrent = var_state;
};

image_xscale = var_spd = 0 ? 1 : sign(var_spd);

if(var_hp <= 0)
{
	save_bossBeaten(2);
}