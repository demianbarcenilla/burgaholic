if(keyboard_check_pressed(global.k_jump))
{
	room_goto(global.nextRoom);
	if(instance_exists(obj_arcadeController))
	{
		global.music = obj_arcadeController.arr_arcade[global.stage, 2];
	};
};