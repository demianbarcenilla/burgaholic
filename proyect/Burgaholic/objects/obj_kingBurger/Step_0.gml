y += osc_step(1, .1);

if(place_meeting(x, y, obj_player))
{
	ini_open("data.ini");
		//If not previously unlocked, announce to the player that the new burger has been unlocked
		if(!ini_read_real("burgersUnlocked", 159, false))
		{
			obj_control.isUnlockingBurg = true
			obj_control.isUnlockingBurg_type = 159
		};
	
		//Write the burger unlocked
		ini_write_real("burgersUnlocked", 159, true);
	ini_close();
	
	audio_play_sound(snd_kingburger, 0, false)
	instance_destroy();
	screenshake(5, 2, .1)
}
