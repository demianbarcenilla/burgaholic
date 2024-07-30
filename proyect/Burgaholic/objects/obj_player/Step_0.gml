//grounded in a one way wall
var _waterEffect = place_meeting(x, y, obj_water) and (var_effect != 1)
if(place_meeting(x, y+1, obj_oneWay)) and (!place_meeting(x, y, obj_oneWay)) //one way platform ground
{
	var_oneWayGrounded = true;
}
else
{
	var_oneWayGrounded = false;
};

//Ground Check (Either One Way or Normal)
if((place_meeting(x, y+1, obj_wall)) or (var_oneWayGrounded))
{
	var_grounded = true;
	var_canPunch = true;
}
else
{
	var_grounded = false;
};

//STATE MACHINE
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
		
		case STATE_MACHINE.windup:
			state_windup();
		break;
		
		case STATE_MACHINE.bounce:
			state_bounce();
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
		
		case STATE_MACHINE.punch:
			state_punch();
		break;
		
		case STATE_MACHINE.moss:
			state_moss();
		break;
		
		case STATE_MACHINE.shroomed:
			state_shroomed();
		break;
		
		case STATE_MACHINE.tubeIn:
			state_tube();
		break;
		
		case STATE_MACHINE.tubeOut:
			state_tubeOut();
		break;
		
		case STATE_MACHINE.still:
			state_still();
		break;
		
		case STATE_MACHINE.bubble:
			state_bubble();
		break;
		
		case STATE_MACHINE.respawn:
			state_respawn();
		break;
		
		case STATE_MACHINE.stunned:
			sprite_index = sprite("spr_playerStunned");
			if(!place_meeting(x, y+1, obj_wall))
			{
				var_vspd += var_grav;
			}
			
			collisionBasic();
		break;
		
		case STATE_MACHINE.arcade:
			sprite_index = spr_blank;
		break;
	};
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
		
		ini_open("data.ini");
			var _deaths = ini_read_real("other", "deaths", 0);
			_deaths ++;
			ini_write_real("other", "deaths", _deaths);
		ini_close();
		
		with(obj_control){var_drawDeathCount = true};
		
		screenshake(10, .5, .1)
		audio_play_sound(sfx_dead, 1, false)
		
		array_resize(arr_pickles, 0)
	}
	else
	{
		state_dead();
	};
	global.subStage = 0;
}

var _halfSprite = 12;

//Get hurt with spike
if(place_meeting(x, y, obj_onlyHit)) and 
(var_state != STATE_MACHINE.hit) and
(var_state != STATE_MACHINE.dead) and
(!invincibleFrames)
{
		hp --;
		var_spd = var_mspd * -image_xscale;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.hit
		audio_play_sound(sfx_hit, 0, 0);
		y -= 2;
};

if(var_effect = 3) //Can't go offscreen when you're a fish
{
	if(y < sprite_height)
	{
		y = sprite_height;
	};
};

//IN REEF YOU'RE ALWAYS A FISH
if(global.stage = stage.reef) and (room != rm_reef)
{
	var_effect = 3;
};

//IN CORE YOU'RE ALWAYS A ???
if(global.stage = stage.core)
{
	var_effect = 4;
};

//IN SPECIAL YOU'RE ALWAYS TINY
if(global.stage = stage.special)
{
	var_effect = 6;
};

//CHANGE COLLISIONS WHEN YOU'RE TINY
if(var_effect == 6)
{
	mask_index = spr_playerIdle_mini;
}
else
{
	mask_index = spr_playerIdle;
}
//Change your room
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
		
		if(instance_exists(obj_key))
		{
			with(obj_key)
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
}
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

//Water makes you float
if(place_meeting(x, y, obj_water))
{
	if(var_effect != 1)
	{
		var_grav = -.45;
		var_vspd = clamp(var_vspd, -var_jspd*1.5, var_jspd)
	}
	else
	{
		var_grav = .35;
	}
	var_fric = .15;
	var_mspd = con_mspd/2;
	var_jspd = 6.25;
}
else if(place_meeting(x, y+1, obj_ice))
{
	var_grav = .45;
	var_fric = .05;
	var_jspd = 6.25;
	var_mspd = var_mspd*1.5;
}
else //Normal Stats
{
	var_fric = .15;
	var_grav = .45;
	var_mspd = con_mspd;
	var_jspd = 6.25;
	
	/*Bump head against ceilings (unused, makes game WAY harder)
	if(place_meeting(x, y-1, obj_wall))
	{
		if(var_vspd < 0){var_vspd = 0};
	}*/
};

//TAGS for sprites
switch (var_effect)
{
	case 0:
		var_spriteMod = "";
	break;
	
	case 1:
		var_spriteMod = "_crab";
	break;
	
	case 2:
		var_spriteMod = "_pepper";
	break;
	
	case 3:
		var_spriteMod = "_fish";
	break;
	
	case 4:
		var_spriteMod = "_core";
	break;
	
	case 5:
		var_spriteMod = "_soul";
	break;
	
	case 6:
		var_spriteMod = "_mini";
	break;
	
	default:
		var_spriteMod = "";
	break;
}

//Bubble FX when underwater
if(place_meeting(x, y, obj_water)) or (global.stage = stage.reef)
{
	var_bubbleTimer --;
	if(var_bubbleTimer = -1)
	{
		var_bubbleTimer = 20;
		var _bubble = instance_create_depth(x+irandom_range(-8, 8), y-24, depth-1, obj_bubbleFX);
	};
};

//DIE INSTANTLY WHEN FALLING TO A PIT
var _pitDie = true
if(instance_exists(obj_statue)) //Don't die if you're in a bonus level transition
{
	if(obj_statue.var_flash = true)
	{
		_pitDie = false;
	};
};	

var _isOnPit = (y > room_height + sprite_height) and (_pitDie),
	_isOnToxicWall = place_meeting(x, y, obj_walltoxic),
	_isOnWaste = place_meeting(x, y, obj_wastePool),
	_isInsideWall = place_meeting(x, y, obj_switchWall),
	_hpToZero = _isOnPit or _isOnToxicWall or _isOnWaste or _isInsideWall

if(_hpToZero){hp = 0};

if(keyboard_check_pressed(ord("R")))
{
	game_restart();
};

if(place_meeting(x, y+1, obj_wall))
{
	var_combo = 0;
};

if(update_pickles)
{
	update_pickle_list();
	update_pickles = false
}