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
		sprite_index = spr_bossForAscent;
		
		var _height = room_height/4 -24;
		
		y = lerp(y, _height, .05);
		if(round(y < _height+5))
		{
			var_state = SLIME_STATE.floating
			var_spd = 3;
		};
	break;
	
	case SLIME_STATE.floating:
		sprite_index = spr_bossFor;
		
		var_vspd = osc_step(5, .5);
		
		stepAlarm(1, irandom_range(120, 180));
		
		collisions();
		
		//Bounce off walls
		enemy_wallBounce(false);
	break;
	
	case SLIME_STATE.charging:
		sprite_index = spr_bossForCharge;
		
		if(alarm[3] = -1)
		{
			alarm[3] = 30;
		};
		
		var_shake = true;
	break;
	
	case SLIME_STATE.bouncing:
		var_shake = false;
		sprite_index = spr_bossForBounce
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
			sprite_index = spr_bossForBounce;
		}
		else
		{
			sprite_index = spr_bossForStuck;
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
		sprite_index = var_hitSprite;
		
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
	save_bossBeaten(1);
}

if(var_state = SLIME_STATE.spawning)
{
	image_speed = .4;
}
else
{
	image_speed = .2;
};

if(var_state == SLIME_STATE.bouncing)
{
	var_angle += 10;
}
else
{
	var_angle = 0;
}