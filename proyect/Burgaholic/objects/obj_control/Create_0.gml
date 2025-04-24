randomize();

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
	pond,
	blank,
	special
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

var_drawDeathCount = false;
deathCountDisplace = 32;
deathCountDisplace_current = deathCountDisplace;

global.pickles = 0;

ini_open("data.ini");
	global.pickles = ini_read_real("PicklesUnlocked", "Held", global.pickles);
ini_close();

global.onionRoom = 0;

//Load Data
audio_group_load(ag_music);
audio_group_load(ag_sfx);

ini_open("settings.ini")
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
	
	//Music and sound
	audio_group_set_gain(ag_music, ini_read_real("options", "musicVol", 1), 0)
	audio_group_set_gain(ag_sfx, ini_read_real("options", "sfxVol", 1), 0)
	
	//Keys
	global.k_left = ini_read_real("keys", "left", vk_left);
	global.k_right = ini_read_real("keys", "right", vk_right);
	global.k_up = ini_read_real("keys", "up", vk_up);
	global.k_down = ini_read_real("keys", "down", vk_down);

	global.k_jump = ini_read_real("keys", "jump", ord("Z"));
	global.k_special = ini_read_real("keys", "dash", ord("X"));
	
	global.lang = ini_read_real("options", "language", 0);
	
	//0 = NO TIMER, 1 = STAGE, 2 = ANY%, 2= 100%
	global.timer = ini_read_real("options", "timer", 0);
ini_close();

ini_open("data.ini")
	var_runTimeGlobal = false;
	var_timeGlobal = ini_read_real("timer", "global", 0);
	var_time100 = ini_read_real("timer", "100", 0);
	
	var_runTimeCurStage = false;
	var_timeCurStage = 0;
	var_timeCurStagePB = ini_read_real("timer", string(global.stage), 0);
	var_timePerStage = ini_read_real("timer", "perStage", 0);
ini_close();

if(room = rm_init)
{
	room_goto(rm_mainMenu)
};

arr_lang[lang.english] = "english"
arr_lang[lang.spanish] = "spanish"

global.langString = arr_lang[global.lang];
global.specialMusic = false;

/*
//Unlock/Lock ALL Burgers
ini_open("data.ini");
	for(i = 0; i < 158; i++)
	{
		ini_write_real("burgersUnlocked", i, 1);
	};
	
	ini_write_real("Stages", "Total", 8)
ini_close();
