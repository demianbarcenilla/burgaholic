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

show_debug_message(var_state)