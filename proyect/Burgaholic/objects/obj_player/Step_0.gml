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
	
	case STATE_MACHINE.dash:
		state_dash();
	break;
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

if(x > room_width -_halfSprite)
{
	if(global.nextRoom != -1) and (!roomCooldown)
	{
		room_goto(global.nextRoom)
		x -= room_width +_halfSprite
		y -=2;
		roomCooldown = true;
	}
	else
	{
		x = room_width -_halfSprite;
		y -=2;
	};
};
else if((x < _halfSprite))
{
	if(global.prevRoom != -1) and (!roomCooldown)
	{
		room_goto(global.prevRoom)
		x += room_width +_halfSprite
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