switch(var_state)
{
	case ROCK_STATE.rest: //When the Thornface is NOT moving
		image_index = 0;
		
		if(instance_exists(obj_player))
		{
			//Shake if the player's in range
			var _downCheck = 2 //Range is bigger downwards when player's grounded (doesn't detect player otherwise).
			
			if(obj_player.var_grounded){_downCheck = 1};
			
			if(obj_player.y >= y-(sprite_width/2)) and (obj_player.y <= y+(sprite_width/_downCheck)) 
			{
				if(obj_player.x < x) //Your direction will change depending on where the player was located
				{
					var_dir = -1; //go left
				}
				else
				{
					var_dir = 1; //go right
				}
				
				//If there are NO walls between the player and self, move to shaking state
				if(!collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, true))
				{
					var_state = ROCK_STATE.shake;
				};
			};
		};
	break;
	
	case ROCK_STATE.shake: //when the rock is shaking (anticipation for the attack)
		
		image_index = 1;
		var_shake = true; //INTERACTS WITH DRAW EVENT!! If true, self will be drawn with a shake effect
		
		if(alarm[0] = -1)
		{
			alarm[0] = alarmTime;
			audio_play_sound(sfx_rock, 10, 0)
		};
		
	break;
	
	case ROCK_STATE.move: //Once you stop shaking, MOVE!
		image_index = 1;
		var_shake = false;

		var_spd += var_fric *var_dir;
		if(place_meeting(x + sign(var_spd), y, obj_wall)) //If you hit a wall, go to rest state again.
		{
			image_index = 0;
			var_spd = 0;
			var_state = ROCK_STATE.rest;
		};
	break;
}

collisionBasic();