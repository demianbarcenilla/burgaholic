global.prevRoom = rm_beach18;
global.nextRoom = rm_beach20;

global.stage = stage.beach

//If you somehow skipped marcus, gives you the burger anyways
ini_open("data.ini");
	//Write the burger unlocked
	ini_write_real("burgersUnlocked", "157", true);
	
	//Delete the marcus fight
	if(ini_read_real("Marcus", "Encountered", 0) < 1)
	{
		ini_write_real("Marcus", "Encountered", 1);
	}
ini_close();