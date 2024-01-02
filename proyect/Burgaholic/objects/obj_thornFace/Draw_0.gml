if(var_shake)
{
	draw_sprite(sprite_index, image_index, x+shk_step(1), y +shk_step(1));
};

else
{
	draw_self();
};

/*
draw_set_color(c_white);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false)

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_font(fnt_holicSmall);
draw_text(x, y-8, "DIR" + string(var_dir))
draw_text(x, y+8, "NEW" + string(var_newDir))