//grounded in a one way wall
if(place_meeting(x, y+1, obj_oneWay)) and (!place_meeting(x, y, obj_oneWay)) //one way platform ground
{
	var_oneWayGrounded = true;
}
else
{
	var_oneWayGrounded = false;
};

//Ground Check (Either One Way or Normal)
if(place_meeting(x, y+1, obj_wall)) or (var_oneWayGrounded)
{
	var_grounded = true;
};
else
{
	var_grounded = false;
};
	
if(hp > 0)
{
	switch(var_state)
	{
		case STATE_MACHINE.normal:
			state_normal();
		break;
	
		case STATE_MACHINE.wallrun:
			state_walkingWall();
		break;
	
		case STATE_MACHINE.hit:
			state_hit();
		break;
	
		case STATE_MACHINE.pound:
			state_pound();
		break;
	
		case STATE_MACHINE.roll:
			state_roll();
		break;
		
		case STATE_MACHINE.bump:
			state_bump();
		break;
	
		case STATE_MACHINE.dash:
			state_dash();
		break;
	}
}
else //DEAD
{
	if(var_state != STATE_MACHINE.dead)
	{
		var_state = STATE_MACHINE.dead
		var_vspd = -6;
		repeat(4)
		{
			instance_create_depth(x, y, depth-1, obj_cloudSFX);
		};
	};
	else
	{
		state_dead();
	};
}

if(keyboard_check_pressed(ord("R")))
{
	game_restart();
};
if(keyboard_check_pressed(vk_f11))
{
	if(window_get_fullscreen() = true)
	{
		window_set_fullscreen(false);
	};
	else
	{
		window_set_fullscreen(true);
	};
};

var _halfSprite = 12;
//Switch Room

//Get hurt with spikes
if(place_meeting(x, y, obj_spike)) and 
(var_state != STATE_MACHINE.hit) and
(var_state != STATE_MACHINE.dead) and
(!invincibleFrames)
{
		hp --;
		var_spd = var_mspd * -image_xscale;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.hit
};

if(x > room_width -_halfSprite+1)
{
	if(global.nextRoom != -1) and (!roomCooldown)//IF THERE'S OTHER ROOM
	{
		room_goto(global.nextRoom)
		x = _halfSprite+1;
		y -=2;
		roomCooldown = true;
		
		if(instance_exists(obj_pickle))
		{
			with(obj_pickle)
			{
				if(var_touched)
				{
					x = (_halfSprite -15) *pickleNumber;
				};
			};
		}
	}
	else //IF THERE'S NO ROOM
	{
		x = room_width -_halfSprite+1;
	};
};
else if((x < _halfSprite))
{
	if(global.prevRoom != -1) and (!roomCooldown)
	{
		room_goto(global.prevRoom)
		alarm[11] = 1;
		roomCooldown = true;
	}
	else
	{
		x = _halfSprite;
	};
}

if(roomCooldown and (alarm[10] = -1))
{
	alarm[10] = 15;
}

//Start countdown to stop invincibility
if(invincibleFrames)
{
	//Flickering
	if(alarm[4]= -1){alarm[4] = 5};
	
	//Disable
	if(alarm[3] = -1){alarm[3] = 90};
}
else
{
	visible = true;
}

//DIE INSTANTLY WHEN FALLING TO A PIT
if(y > room_height + sprite_height){hp = 0};

show_debug_message(var_state)
