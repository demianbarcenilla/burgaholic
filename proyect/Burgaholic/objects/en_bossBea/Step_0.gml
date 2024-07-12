switch(var_state)
{
	case CAMEL_STATE.spawning:
		sprite_index = spr_bossBeaSpawn;
		if(image_index >= image_number-1)
		{
			var_state = CAMEL_STATE.charge;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case CAMEL_STATE.charge:
		stepAlarm(0, irandom_range(60, 120))
		sprite_index = spr_bossBeaCharge;
		
		var_spd = 0;
		var_vspd += var_grav;
		
		collisionBasic();
		
		var_stateCurrent = var_state;
	break;
	
	case CAMEL_STATE.rush:
		sprite_index = spr_bossBeaRun;
		
		var_spd = var_mspd;
		
		
		collisionBasic()
		
		if(place_meeting(x +sign(var_spd), y, obj_wall))
		{
			var_vspd = -4;
			var_state = CAMEL_STATE.wall;			
			y -=5;
		};
		//Grounded
		if(!place_meeting(x, y+1, obj_wall))
		{
			var_vspd += var_grav;
		}
		
	break;
	
	case CAMEL_STATE.wall:
		sprite_index = spr_bossBeaHit;
		var_vspd += var_grav;
		var_spd = -var_mspd/4;
		if(place_meeting(x, y+1, obj_wall))
		{
			var_state = CAMEL_STATE.charge;
		};
		
		collisionBasic()
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

image_xscale = var_spd = 0 ? image_xscale : sign(var_spd);

if(var_hp <= 0)
{
	save_bossBeaten(3);
}