draw_set_font(fnt_holicSmall)
draw_sprite(spr_chatBackground, 0, 0, 0)
draw_sprite(spr_chatBoxes, var_chatbox, 0, 0)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_ext(36, 6, arr_dialogue[dialogue_current], 11, 280)

if(keyboard_check_pressed(global.k_jump))
{
	dialogue_current++
	if(dialogue_current > array_length(arr_dialogue)-1)
	{
		instance_destroy();
		var_event();
	};
};