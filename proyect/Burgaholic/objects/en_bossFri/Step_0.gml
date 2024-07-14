switch(var_state)
{
	case FRIDGE_STATE.spawning:
		sprite_index = spr_bossFriSpawn;
		if(image_index >= image_number-1)
		{
			var_state = FRIDGE_STATE.idle;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case FRIDGE_STATE.idle:
		stepAlarm(0, irandom_range(30, 90))
		sprite_index = spr_bossFri;
		
		var_spd = 0;
		var_vspd += var_grav;
		collisionBasic();
		
		var_stateCurrent = var_state;
	break;
	
	case FRIDGE_STATE.jump:
		sprite_index = spr_bossFriJump;
		
		var_vspd += var_grav;
		
		collisionBasic()
		enemy_wallBounce(true);
		
		//DROP
		if(instance_exists(obj_player))
		{
			if(obj_player.x >= x-(sprite_width/2)) and (obj_player.x <= x+(sprite_width/2))
			{
				var_state = FRIDGE_STATE.fall
			};
		};
		
		//Grounded
		if(place_meeting(x, y+1, obj_wall))
		{
			var_state = FRIDGE_STATE.stuck;
			
			bossFridge_spawnSpikes();
		};
		
		var_stateCurrent = var_state;
	break;
	
	case FRIDGE_STATE.fall:
		sprite_index = spr_bossFriTackle;
		var_spd = 0;
		var_vspd += var_grav*1.5;
		
		if(place_meeting(x, y+1, obj_wall))
		{
			var_state = FRIDGE_STATE.stuck;
			
			bossFridge_spawnSpikes();
		};
		
		collisionBasic()
		
		var_stateCurrent = var_state;
	break;
	
	case FRIDGE_STATE.stuck:
		sprite_index = spr_bossFriStuck;
		
		stepAlarm(1, 180);
		
		var_stateCurrent = var_state;
	break;
	
	case FRIDGE_STATE.hit:
		sprite_index = var_hitSprite;
		stepAlarm(2, 30);
	break;
};

if(var_state != FRIDGE_STATE.hit)
{
	var_stateCurrent = var_state;
};

image_xscale = var_spd = 0 ? image_xscale : sign(var_spd);

if(var_hp <= 0)
{
	save_bossBeaten(4);
}