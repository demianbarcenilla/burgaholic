gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, var_color, alpha)
	alpha -= .1;
	if(alpha <= 0)
	{
		instance_destroy()
	}
gpu_set_blendmode(bm_normal)