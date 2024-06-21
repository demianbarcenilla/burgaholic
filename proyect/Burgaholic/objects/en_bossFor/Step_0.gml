switch(var_state)
{
	case SLIME_STATE.spawning:
		if(image_index >= image_number-1)
		{
			var_state = SLIME_STATE.ascent;
			global.specialMusic = false;
		};
		
		var_stateCurrent = var_state;
	break;
	
	case SLIME_STATE.ascent:
		image_index = 3;
		
		var _height = room_height/4;
		
		y = lerp(y, _height, .05);
		if(round(y < _height+5))
		{
			var_state = SLIME_STATE.floating
			var_spd = 3;
		};
	break;
	
	case SLIME_STATE.floating:
		image_index = 0;
		
		var_vspd = osc_step(5, .5);
		
		stepAlarm(1, irandom_range(120, 180));
		
		collisions();
		
		//Bounce off walls
		enemy_wallBounce(false);
	break;
	
	case SLIME_STATE.charging:
		image_index = 2;
		
		if(alarm[3] = -1)
		{
			alarm[3] = 30;
		};
		
		var_shake = true;
	break;
	
	case SLIME_STATE.bouncing:
		var_shake = false;
		image_index = 2;
		
		if(alarm[3] = -1)
		{
			alarm[3] = 180;
		};
		
		collisionBasic();
		enemy_wallBounce(true);
	break;
	
	case SLIME_STATE.stuck:
		
		if(!place_meeting(x, y+1, obj_wall))
		{
			image_index = 2;
		}
		else
		{
			image_index = 4;
			var_shake = true;
			var_vspd = 0;
			var_spd = 0;
			if(alarm[3] = -1)
			{
				alarm[3] = 180;
			};
		};
		
		collisionBasic();
		enemy_wallBounce(true);
	break;
	
	case SLIME_STATE.hit:
		image_index = 5;
		if(alarm[2] = -1)
		{
			alarm[2] = 30;
		};
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

if(var_state = SLIME_STATE.spawning)
{
	image_speed = .4;
	sprite_index = spr_bossForSpawn
}
else
{
	image_speed = 0;
	sprite_index = spr_bossFor;
};