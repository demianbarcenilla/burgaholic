/// @description INITIALIZE
#macro IMAGE_SPEED .4
#macro SCREEN_WIDTH 320
#macro SCREEN_HEIGHT 224

shaking = false;
enum stage
{
	forest,
	volcano,
	beach,
	rust,
	reef,
	ashtray,
	core,
	pond
};

enum lang
{
	english,
	spanish
};

enum substage
{
	normal,
	bonus,
	boss
};

global.stage = stage.forest;
global.prevStage = stage.forest;

shakeTime = 0;
shakeAmmount = 0;
shakeFade = 0;

global.prevRoom = -1;
global.nextRoom = -1;

global.subStage = substage.normal;
global.music = mus_0;

global.lang = lang.english;

global.currentRoom = rm_forest;

//GUI
isUnlockingBurg = false;
isUnlockingBurg_type = 0;
burgerDisplace = 64;
burgerDisplace_current = burgerDisplace;

global.pickles = 0;

ini_open("data.ini");
	global.pickles = ini_read_real("PicklesUnlocked", "Held", global.pickles);
ini_close();

global.onionRoom = 0;
//Load Data

ini_open("data.ini")
	//Window Size
	var _window = ini_read_real("options", "window", 0), _width = 320, _height = 224;
	switch(_window)
	{
		case 0:
			window_set_fullscreen(false);
			window_set_size(_width, _height);
		break;
						
		case 1:
			window_set_fullscreen(false);
			window_set_size(_width *2, _height *2);
		break;
						
		case 2:
			window_set_fullscreen(false);
			window_set_size(_width *3, _height *3);
		break;
						
		case 3:
			window_set_fullscreen(true);
		break;
	};
ini_close();

if(room = rm_init)
{
	room_goto(rm_mainMenu)
};

audio_group_load(ag_music);
audio_group_set_gain(ag_music, 1, 0);

audio_group_load(ag_sfx);

//Keys
global.k_left = ord("A");
global.k_right = ord("D");
global.k_up = ord("W");
global.k_down = ord("S");

global.k_jump = ord("O");
global.k_special = ord("I");

arr_lang[lang.english] = "english"
arr_lang[lang.spanish] = "spanish"

global.lang = 0;
global.langString = arr_lang[global.lang];

/*Unlock/Lock ALL Burgers
ini_open("data.ini");
	for(i = 0; i < 300; i++)
	{
		ini_write_real("burgersUnlocked", i, 1);
	};
ini_close();
instance_create_depth(x, y, depth, obj_shader);
