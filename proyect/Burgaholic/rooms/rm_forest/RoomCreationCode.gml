ini_open("data.ini")
	var _isPipeUnlocked = ini_read_real("Stages", "Forest", false)
ini_close();
global.prevRoom = _isPipeUnlocked ? rm_forestTube : -1;
global.nextRoom = rm_forest2;
global.stage = stage.forest;