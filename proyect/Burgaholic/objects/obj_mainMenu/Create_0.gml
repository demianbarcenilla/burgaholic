enum MAIN_MENU
{
	main,
	options,
	achievements
};
var_selected = 0;
var_state = MAIN_MENU.main
var_selectedDisplace = 0;

var_burgDisplace = 128;

var_isChangingControls = false; //Declared HERE
var_keybind = 0; //The current key you're changing