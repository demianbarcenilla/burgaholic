global.prevRoom = room_previous(room);
global.nextRoom = room_next(room);
global.stage = stage.ashtray;

//If you somehow skipped marcus, gives you the burger anyways
ini_open("data.ini");
	//Write the burger unlocked
	ini_write_real("burgersUnlocked", "158", true);
	
	//Delete the marcus fight
	if(ini_read_real("Marcus", "Encountered", 0) < 2)
	{
		ini_write_real("Marcus", "Encountered", 2);
	}
ini_close();