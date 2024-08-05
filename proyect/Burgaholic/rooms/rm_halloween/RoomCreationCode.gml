global.specialMusic = false;
global.stage = stage.special;

global.prevRoom = room_previous(room);
global.nextRoom = room_next(room);

ini_open("data.ini")
	obj_control.var_timeCurStagePB = ini_read_real("timer", string(global.stage), 0);
ini_close();
obj_control.var_runTimeCurStage = true;