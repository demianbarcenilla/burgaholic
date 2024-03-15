enum MAIN_MENU
{
	main,
	options,
	achievements,
	holic
};
var_selected = 0;
var_state = MAIN_MENU.holic;

var_selectedDisplace = 0;

var_burgDisplace = 128;

var_isChangingControls = false; //Declared HERE
var_keybind = 0; //The current key you're changing

t = 0;