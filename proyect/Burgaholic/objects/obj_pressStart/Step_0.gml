if(keyboard_check_pressed(global.k_jump))
{
	room_goto(global.nextRoom);
};

if(keyboard_check_pressed(global.k_special))
{
	room_goto(global.currentRoom);
	with(obj_control){alarm[10] = 2};
};