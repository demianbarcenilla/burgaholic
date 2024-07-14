event_inherited()

switch(var_state)
{
	case KEY_STATE.still: //Starting POS
		y += osc_step(1, .1); //Oscillate in place
		
		if(place_meeting(x, y, obj_player))
		{
			//We fill the last entry with the ID
			array_push(obj_player.arr_pickles, id)
			
			pickle_set_number();
			
			//Set the delay for destroying (always quick)
			delay = 1
			
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
	
	case KEY_STATE.following: //Following Player
		
		//Make persistent
		persistent = true;
		
		if(instance_exists(obj_player))
		{
			pickle_follow();
		};
		
		pickle_set_number();
	break;
	
	case KEY_STATE.destroy:
		if(instance_exists(obj_barrierKeyhole))
		{	
			if(canLerp = true)
			{
				key_lerp_checkpoint()
			}
			else
			{
				//Set delay between pickles
				if(alarm[0] = -1)
				{
					alarm[0] = 1
				}
					
				pickle_follow();
			};
		}
	break;	
}