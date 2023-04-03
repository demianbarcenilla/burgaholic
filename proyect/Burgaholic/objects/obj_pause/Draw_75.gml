switch(var_state)
{
	case menu.pause:
		scr_menuPause()
	break;
	
	case menu.options:
		scr_menuOptions()
	break;
	
	case menu.burgers:
		if(!instance_exists(obj_burgerMenu))
		{
			instance_create_depth(x, y, depth, obj_burgerMenu)
		};
	break;
}