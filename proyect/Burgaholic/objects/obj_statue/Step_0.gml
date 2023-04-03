if(place_meeting(x, y, obj_player))
{
	screenshake(120, .5, .1)
	mask_index = spr_blank;
	
	if(alarm[0] = -1)
	{
		alarm[0] = 60;
	};
};

if(sprite_index = spr_statueAnim) and (image_index = image_number -1)
{
	var_flash = true;
	
	sprite_index = spr_blank;
	
	room_goto(global.onionRoom);
	global.stage = global.prevStage;
	alarm[1] = 2;
	alarm[2] = 60;
	
	ini_open("data.ini");
		ini_write_real("burgersUnlocked", var_burgerGenie, true);
	ini_close();
};