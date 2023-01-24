switch(var_state)
{
	case menu.pause:
		instance_activate_all();
		instance_destroy();
	break;
	
	case menu.options:
		var_state = menu.pause;
		var_selected = 0;
	break;
	
	case menu.burgers:
		var_state = menu.pause;
		var_selected = 0;
	break;
}