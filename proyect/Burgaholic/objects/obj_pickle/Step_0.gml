event_inherited()
switch(var_state)
{
	case PICKLE_STATE.still: //Starting POS
		y += osc_step(1, .1); //Oscillate in place
		
		if(place_meeting(x, y, obj_player))
		{
			//We fill the last entry with the ID
			array_push(obj_player.arr_pickles, id)
			
			pickle_set_number();
			
			//Set the delay for destroying
			delay = 10*(pickleNumber) +1;
			
			//Update the angle the pickle is rotating
			pickle_angleUpdate();
			
			//If rotating, Screenshake
			if(pickleNumber > 2)
			{
				screenshake(10, .6, .2)
			};
			
			player_pickleCheck()
			
			var_state = PICKLE_STATE.following;
		};
	break;
	
	case PICKLE_STATE.following: //Following Player
		
		//Make persistent
		persistent = true;
		
		if(instance_exists(obj_player))
		{
			pickle_follow();
			
			//Make invisible when arcade
			if(obj_player.var_state = STATE_MACHINE.arcade){sprite_index = spr_blank}
			else{sprite_index = var_sprite};
		};
		
		pickle_set_number();
	break;
	
	case PICKLE_STATE.destroy:
		if(instance_exists(obj_checkpoint)) //If checkpoint exists, aproach
		{
			if(canLerp = true)
			{
				pickle_lerp_checkpoint()
			}
			else
			{
				//Set delay between pickles
				if(alarm[0] = -1)
				{
					alarm[0] = delay
				}
					
				pickle_follow();
			};
		}
		else //Otherwise, delete pickle and save automatically
		{
			pickleSave();
		}
	break;
}