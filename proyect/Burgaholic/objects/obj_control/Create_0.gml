/// @description INITIALIZE
#macro IMAGE_SPEED .4;
shaking = false;
enum stage
{
	bonus,
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

global.stage = stage.forest;
global.prevStage = stage.forest;

shakeTime = 0;
shakeAmmount = 0;
shakeFade = 0;

global.prevRoom = -1;
global.nextRoom = -1;
global.music = mus_forest;

global.lang = lang.english;

arr_music[0] = mus_bonus;
arr_music[1] = mus_forest;
arr_music[2] = mus_volcano;

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
