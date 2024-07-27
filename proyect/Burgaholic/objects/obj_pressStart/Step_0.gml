if(keyboard_check_pressed(global.k_jump))
{
	room_goto(global.nextRoom);
	if(instance_exists(obj_arcadeController))
	{
		with(obj_arcadeController)
		{
			global.music = arr_arcade[var_game, 2];
		};
	};
};