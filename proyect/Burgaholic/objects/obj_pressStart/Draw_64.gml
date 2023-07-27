//draw burgers
for(var i = 0; i < 3; i++)
{
	ini_open("data.ini");
		var _unlocked = ini_read_real("burgersUnlocked", var_arcadeBurgerStart+i, 0);
	ini_close();
		
	if(_unlocked)
	{
		draw_sprite(spr_burgers, var_arcadeBurgerStart+i, 112+(32*i), 144)
	}
	else
	{
		gpu_set_fog(true, $502C33, 0, 10)
			draw_sprite(spr_burgers, var_arcadeBurgerStart+i, 112+(32*i), 144)
		gpu_set_fog(false, c_white, 0, 10)
	};
};