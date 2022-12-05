/// @description Draw text

//Define borders
var _xborder = 52,
	_yborder = 8;
	
//Define ArrayDialogue
for(i=0; i <= calledFrom.var_dialogueAmmount; i++)
{
	arr_dialogue[i] = calledFrom.arr_dialogue[i];
	arr_portraitOrder[i] = calledFrom.arr_portraitOrder[i];
};

draw_sprite(spr_textbox, 0, 48, 0) //draw textbox
draw_sprite(spr_portraits, arr_portraitOrder[var_number], 0, 0);

draw_set_font(fnt_general);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _text = arr_dialogue[var_number],
	_width = 268;
msg_drawnText = string_copy(_text, 1, msg_char);

if(msg_char <= string_length(_text))
{
	msg_char += msg_speed;
	if(!audio_is_playing(sfx_chat))
	audio_play_sound(sfx_chat, 1, false);
};

//draw outline lol
draw_set_color(BLACK);
draw_text_ext(x+_xborder+1, y+_yborder +var_yDisplace, msg_drawnText, -1, _width);
draw_text_ext(x+_xborder-1, y+_yborder +var_yDisplace, msg_drawnText, -1, _width);
draw_text_ext(x+_xborder, y+_yborder+1 +var_yDisplace, msg_drawnText, -1, _width);
draw_text_ext(x+_xborder, y+_yborder-1 +var_yDisplace, msg_drawnText, -1, _width);

//draw text
draw_set_color(WHITE);
draw_text_ext(x+_xborder, y+_yborder, msg_drawnText, -1, _width);

if(keyboard_check_pressed(global.jumpKey))
{
	if(var_number < calledFrom.var_dialogueAmmount)
	{
		var_number++;
	}
	else
	{
		if(instance_exists(obj_player))
		{
			obj_player.var_state = STATE_MACHINE.normal;
			calledFrom.var_chatting = false;
			
			instance_destroy();
		};
	};
	
	msg_char = 0;
};