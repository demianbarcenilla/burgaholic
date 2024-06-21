switch(var_state)
{
	case 0: //Floating hand
		sprite_index = spr_bossVolHand;
		var_shake = false;
		
		y += osc_step(5, .5)
		
		stepAlarm(0, irandom_range(120, 180)); //Set alarm 0 to 120/180 frames. This'll switch the state
	break;
	
	case 1: //Punch
		var_shake = false;
		sprite_index = spr_bossVolHandPunch;
		collisionBasic()
	
		var _touchGround = (place_meeting(x, y+sign(var_vspd), obj_wall)) or (place_meeting(x +sign(var_spd), y, obj_wall))
		if(_touchGround)
		{
			var_state = 2; 
		};
	break;
	
	case 2: //Come Back
		x = lerp(x, xstart-32, .05)
		y = lerp(y, ystart, .05)
		
		//If already reached desired position, snap to it and repeat
		if(y < ystart+5)
		{
			x = xstart-32;
			y = ystart;
			
			instance_destroy();
			vfx_dirt();
		};
	break;
	
	case 3: //Anticipation
		sprite_index = spr_bossVolHand;
		
		var_shake = true;
		stepAlarm(1, 30);
	break;
};