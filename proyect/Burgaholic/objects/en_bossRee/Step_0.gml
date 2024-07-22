switch(var_state)
{
	case FISH_STATE.spawning:
		sprite_index = spr_bossReeSpawning;
		if(image_index >= image_number-1)
		{
			var_state = FISH_STATE.idle;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case FISH_STATE.idle:
		stepAlarm(0, irandom_range(60, 120))
		sprite_index = spr_bossRee;
		
		var_spd = 0;
		var_vspd += var_grav;
		collisionBasic();
		
		var_stateCurrent = var_state;
	break;
	
	case FISH_STATE.jump:
		var_vspd += var_grav;
		
		//SHOOT
		if(var_vspd < 0)
		{
			 sprite_index = spr_bossReeSpin;
			 stepAlarm(3, 10);
		}
		else
		{
			sprite_index = spr_bossReeFall;
		}
		
		collisionBasic()
		enemy_wallBounce(true);
		
		//Grounded
		if(place_meeting(x, y+1, obj_wall))
		{
			bossReef_createBullets(-3, .4);
			
			var_state = FISH_STATE.idle;
			var_vspd = 0;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case FISH_STATE.hit:
		sprite_index = var_hitSprite;
		stepAlarm(2, 30);
	break;
};

if(var_state != FISH_STATE.hit)
{
	var_stateCurrent = var_state;
};

image_xscale = var_spd = 0 ? image_xscale : sign(var_spd);

if(var_hp <= 0)
{
	save_bossBeaten(5);
}