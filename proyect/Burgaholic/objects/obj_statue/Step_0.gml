if(place_meeting(x, y, obj_player))
{
	screenshake(120, .5, .1)
	mask_index = spr_blank;
	
	if(alarm[0] = -1)
	{
		alarm[0] = 60;
	};
	
	obj_player.k_dirLock = 0;
	obj_player.k_jumpCap = 0;
	
	persistent = true;
};

if(sprite_index = spr_statueAnim) and (image_index = image_number -1)
{
	var_flash = true;
	
	sprite_index = spr_blank;
	
	obj_player.y = -255;
	room_goto(global.onionRoom);
	
	global.subStage = substage.normal
	alarm[1] = 2;
	alarm[2] = 60;
	
	ini_open("data.ini");
		//If not previously unlocked, announce to the player that the new burger has been unlocked
		if(!ini_read_real("burgersUnlocked", var_burgerGenie, false))
		{
			obj_control.isUnlockingBurg = true
			obj_control.isUnlockingBurg_type = var_burgerGenie
		};
	
		//Write the burger unlocked
		ini_write_real("burgersUnlocked", var_burgerGenie, true);
	ini_close();
};