if(keyboard_check_pressed(global.k_special))
{
	instance_destroy();
};

//draw burgers
for(var i = 0; i < 3; i++)
{
	ini_open("data.ini");
		var _unlocked = ini_read_real("burgersUnlocked", var_arcadeBurgerStart+i, 0);
	ini_close();
		
	if(_unlocked)
	{
		if(arr_burgIcon[i] = -1)
		{
			arr_burgIcon[i] = instance_create_depth(var_burgIconX+(16*i), var_burgIconY, depth, obj_burgIcon);
		};
	};
};