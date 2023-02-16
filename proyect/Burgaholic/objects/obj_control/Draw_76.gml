/// @description Insert description here
// You can write your code in this editor
ini_open("data.ini")
	var _window = ini_read_real("options", "window", 0) +1;
ini_close();
draw_sprite_tiled_ext(spr_gameBackground, 0, 0, 0, _window, _window, image_blend, image_alpha)