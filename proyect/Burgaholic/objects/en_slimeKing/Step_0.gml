switch(var_state)
{
	case SLIME_STATE.spawning:
		sprite_index = spr_enSlimeKingShowup;
		if(image_index >= image_number-1)
		{
			var_state = SLIME_STATE.idle;
		};
		var_stateCurrent = var_state;
	break;
	
	case SLIME_STATE.running:
		sprite_index = spr_enSlimeKingRun;
		if(alarm[1] = -1) {alarm[1] = irandom_range(120, 180)};
		
		collisions();
		
		var_stateCurrent = var_state;
	break;
	
	case SLIME_STATE.jumping:
		
		if(place_meeting(x, y+1, obj_wall)){var_state = SLIME_STATE.running}
		var_vspd += var_grav;
		
		
		if(var_vspd < 0)
		{
			sprite_index = spr_enSlimeKingJump;
		}
		else
		{
			sprite_index = spr_enSlimeKingFall;
		};
		
		collisions();
		
		var_stateCurrent = var_state;
	break;
	
	case SLIME_STATE.idle:
		sprite_index = spr_enSlimeKingIdle;
		if(alarm[0] = -1) {alarm[0] = 15};
		
		var_stateCurrent = var_state;
	break;
	
	case SLIME_STATE.hit:
		sprite_index = spr_enSlimeKingHIT;
		if(alarm[2] = -1){alarm[2] = 15};
		break;
};
image_xscale = var_spd = 0 ? 1 : sign(var_spd);


/*if(place_meeting(x, y, obj_player)) and (var_state != SLIME_STATE.hit)
{
	if(obj_player.var_canDMG)
	{
		var_hp --;
		var_state = SLIME_STATE.hit;
	};
};*/

if(var_hp <= 0)
{
	var _keeper = instance_create_depth(x, y-32, depth, obj_keeperBeaten)
	repeat(16){instance_create_depth(x, y-32, depth, obj_wasteFX)};
	screenshake(5, 1, .2)
	instance_destroy();
	
}
//Bounce off walls
if(place_meeting(x+sign(var_spd), y, obj_wall))
{
	var_spd = -var_spd;
};