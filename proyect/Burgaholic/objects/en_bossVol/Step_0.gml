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
		sprite_index = spr_bossVolIdle;
		
		if(!instance_exists(en_bossVol_hand))
		{
			stepAlarm(4, 120)
		};
		
		var_stateCurrent = var_state;
		
	break;
	
	case PEPPER_STATE.hit:
		sprite_index = var_hitSprite;
		stepAlarm(2, 30);
	break;
};

if(var_state != SLIME_STATE.hit)
{
	var_stateCurrent = var_state;
};

image_xscale = var_spd = 0 ? 1 : sign(var_spd);

if(var_hp <= 0)
{
	var _keeper = instance_create_depth(x, y-32, depth, obj_keeperBeaten)
	repeat(16){instance_create_depth(x, y-32, depth, obj_wasteFX)};
	screenshake(5, 1, .2)
	ini_open("data.ini");
		if(ini_read_real("Stages", "Total", 0) < 1)
		{
			ini_write_real("Stages", "Total", 1)
		};
	ini_close();
	instance_destroy();
}