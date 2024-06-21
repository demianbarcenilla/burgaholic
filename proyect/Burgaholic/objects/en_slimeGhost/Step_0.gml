switch(var_state)
{
	case 0:
		var_vspd = osc_step(inc, ampl)
		
		y += var_vspd;
		
	break;
	
	case 1:
		sprite_index = spr_slimeGhostFree
		var_shake = true; //INTERACTS WITH DRAW EVENT!! If true, self will be drawn with a shake effect
		
		if(alarm[0] = -1)
		{
			alarm[0] = alarmTime;
			audio_play_sound(sfx_rock, 10, 0)
		};
	break;
	
	case 2:
		instance_create_depth(x, y, depth, en_slimeGhostMove)
		instance_destroy()
	break;
};

if(place_meeting(x, y-1, obj_player))
{
	obj_player.var_spdCarry = var_spd;
	
};