/// @description Draw "Press Jump to Start!"
if(var_drawPressStart)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_holicSmall);
	draw_text(x+(sprite_width/2), y+(sprite_height/2), "jump to start!");
};