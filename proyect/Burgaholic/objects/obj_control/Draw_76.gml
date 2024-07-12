/// @description Draw on black borders
ini_open("settings.ini")
	var _window = ini_read_real("options", "window", 0) +1;
ini_close();
draw_sprite_tiled_ext(spr_gameBackground, 0, 0, 0, _window, _window, image_blend, image_alpha)