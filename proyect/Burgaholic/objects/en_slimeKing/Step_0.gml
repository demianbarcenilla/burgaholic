if(!var_spawned)
{
	if(instance_exists(obj_player))
	{
		if(obj_player.x >= room_width/2)
		{
			bossBarriers()
			var_spawned = true;
			alarm[0] = 10;
		};
	};
};
else
{
	switch(var_state)
	{
		case STATE.spawning:
			if(sprite_index = spr_enSlimeKingShowup)
			{
				if(image_index = image_number-1)
				{
					var_state = STATE.running
				};
			};
		break;
		
		case STATE.idle:
		
		break;
		
		case STATE.running:
			sprite_index = spr_enSlimeKingRun;
			
			//Horizontal Collissions
			if(place_meeting(x+var_spd, y, obj_wall))
			{
				while(!place_meeting(x+sign(var_spd), y, obj_wall))
				{
					x += sign(var_spd);
				};
	
				if(place_meeting(x+sign(var_spd), y, obj_wall))
				{
					var_spd = 0;
				};
			}

			x += var_spd;
/*
			//Vertical Collissions
			if(place_meeting(x, y+var_vspd, obj_wall))
			{
				while(!place_meeting(x, y+sign(var_vspd), obj_wall))
				{
					y += sign(var_vspd);
				};
	
				if(place_meeting(x, y+sign(var_vspd), obj_wall))
				{
					var_vspd = 0
				};
			}
			
			if(!place_meeting(x, y+1, obj_wall))
			{
				var_vspd += var_grav;
			}
			
			y += var_vspd;*/
			
			image_xscale = sign(var_spd);
		break;
		
		case STATE.jumping:
		
		break;
	}
};