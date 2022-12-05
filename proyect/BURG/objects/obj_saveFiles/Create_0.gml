input = false;

enum FILE_DATA{
	level,
	name,
	time,
	burgers,
	pickles,
	onions,
	curStage,
	checkpoint
};
//Savefile data

ini_open("saves.ini");
var _curSavefile = 1;
arr_files[_curSavefile, FILE_DATA.level] = ini_read_real("save-1", "level", 0)//Level
arr_files[_curSavefile, FILE_DATA.name] = ini_read_string("save-1", "name", "Empty")//Name
arr_files[_curSavefile, FILE_DATA.time] = ini_read_real("save-1", "time", 00.00)//Time Played
arr_files[_curSavefile, FILE_DATA.burgers] = ini_read_real("save-1", "totalBurgers", 0)//Burgers Collected
arr_files[_curSavefile, FILE_DATA.pickles] = ini_read_real("save-1", "totalPickles", 0)//Pickles Collected
arr_files[_curSavefile, FILE_DATA.onions] = ini_read_real("save-1", "totalOnions", 0)//Onions Collected
arr_files[_curSavefile, FILE_DATA.curStage] = ini_read_real("save-1", "curStage", rm_grassLobby)//Current Stage
arr_files[_curSavefile, FILE_DATA.checkpoint] = ini_read_real("save-1", "checkpoint", arr_files[_curSavefile, FILE_DATA.curStage])//Current Stage
_curSavefile = 2;
arr_files[_curSavefile, FILE_DATA.level] = ini_read_real("save-2", "level", 0)//Level
arr_files[_curSavefile, FILE_DATA.name] = ini_read_string("save2", "name", "Empty")//Name
arr_files[_curSavefile, FILE_DATA.time] = ini_read_real("save-2", "time", 00.00)//Time Played
arr_files[_curSavefile, FILE_DATA.burgers] = ini_read_real("save-2", "totalBurgers", 0)//Burgers Collected
arr_files[_curSavefile, FILE_DATA.pickles] = ini_read_real("save-2", "totalPickles", 0)//Pickles Collected
arr_files[_curSavefile, FILE_DATA.onions] = ini_read_real("save-2", "totalOnions", 0)//Onions Collected
arr_files[_curSavefile, FILE_DATA.curStage] = ini_read_real("save-2", "curStage", rm_grassLobby)//Current Stage
arr_files[_curSavefile, FILE_DATA.checkpoint] = ini_read_real("save-2", "checkpoint", arr_files[_curSavefile, FILE_DATA.curStage])//Current Stage
_curSavefile = 3;
arr_files[_curSavefile, FILE_DATA.level] = ini_read_real("save-3", "level", 0)//Level
arr_files[_curSavefile, FILE_DATA.name] = ini_read_string("save-3", "name", "Empty")//Name
arr_files[_curSavefile, FILE_DATA.time] = ini_read_real("save-3", "time", 00.00)//Time Played
arr_files[_curSavefile, FILE_DATA.burgers] = ini_read_real("save-3", "totalBurgers", 0)//Burgers Collected
arr_files[_curSavefile, FILE_DATA.pickles] = ini_read_real("save-3", "totalPickles", 0)//Pickles Collected
arr_files[_curSavefile, FILE_DATA.onions] = ini_read_real("save-3", "totalOnions", 0)//Onions Collected
arr_files[_curSavefile, FILE_DATA.curStage] = ini_read_real("save-3", "curStage", rm_grassLobby)//Current Stage
arr_files[_curSavefile, FILE_DATA.checkpoint] = ini_read_real("save-3", "checkpoint", arr_files[_curSavefile, FILE_DATA.curStage])//Current Stage
ini_close();

var_selected = 1;
alarm[0]= 10;