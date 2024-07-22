switch(var_state)
{
	case CORE_STATE.spawning:
		sprite_index = spr_bossCorSpawn;
		if(image_index >= image_number-1)
		{
			var_state = CORE_STATE.idle;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case CORE_STATE.idle:
		image_speed = 0;
		sprite_index = spr_bossCor;
		
		image_index = var_vspd < 0 ? 0 : 1;
		
		var_vspd += var_grav;
		
		enemy_wallBounce(true);
		collisionBasic();
		
		if(place_meeting(x, y+1, obj_wall))
		{
			var_vspd = -8;
		}
		
		var_stateCurrent = var_state;
	break;
	
	case CORE_STATE.hit:
		sprite_index = var_hitSprite;
		stepAlarm(2, 30);
	break;
};

if(var_state != CORE_STATE.hit)
{
	var_stateCurrent = var_state;
};

image_xscale = var_spd = 0 ? image_xscale : sign(var_spd);

if(var_hp <= 0)
{
	save_bossBeaten(7);
}