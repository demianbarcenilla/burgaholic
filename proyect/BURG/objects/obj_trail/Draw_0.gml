/// @description Greyscale Filter
//Shader
shader_set(sh_colorMixed);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shader_reset();

