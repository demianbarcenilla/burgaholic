//Draw Self
draw_sprite_ext(sprite_index, image_index, x, y, var_xscale, var_yscale, image_angle, image_blend, image_alpha)

//Draw Arrows
for(i = 0; i < 4; i++)
{
	var _condition = (sprite_index == spr_dansMOVE) and (image_index = i)
	var _sprite = _condition ? spr_dansArrowColored : spr_dansArrow;
	
	draw_sprite(_sprite, i, 160 + (i*20), arrowHeight)
}
