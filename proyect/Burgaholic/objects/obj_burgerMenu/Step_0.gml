if(keyboard_check_pressed(global.k_special))
{
	//Emulate ESC key press (otherwise it won't exit the burg menu properly)
	keyboard_key_press(vk_escape);
};

if(keyboard_check_pressed(vk_escape))
{
	instance_destroy();
};