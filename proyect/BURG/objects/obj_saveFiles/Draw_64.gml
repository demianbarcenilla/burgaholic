
ini_open("saves.ini")

//Save File 1
draw_sprite(spr_saveLevels, arr_files[1, FILE_DATA.level], 16, 16);
draw_sprite(spr_saveFiles, 0, 16, 64);
draw_set_color(WHITE);
draw_set_font(fnt_general);
draw_set_halign(fa_center);

//Drawing the info
draw_text_ext(48, 64, arr_files[1, FILE_DATA.name], -1, 64);
draw_text_ext(48, 88, "Time: "+ string_format(arr_files[1, FILE_DATA.time], 2, 2), -1, 64);
draw_text_ext(48, 112, "Burgers: "+string(arr_files[1, FILE_DATA.burgers]), -1, 64);
draw_text_ext(48, 136, "Pickles: " +string(arr_files[1, FILE_DATA.pickles]), -1, 64);
draw_text_ext(48, 160, "Onions:" +string(arr_files[1, FILE_DATA.onions]), -1, 64);

//Save File 2
draw_sprite(spr_saveLevels, arr_files[2, FILE_DATA.level], 128, 16);
draw_sprite(spr_saveFiles, 0, 128, 64);
draw_set_color(WHITE);
draw_set_font(fnt_general);
draw_set_halign(fa_center);

//Drawing the info
draw_text_ext(160, 64, arr_files[2, FILE_DATA.name], -1, 64);
draw_text_ext(160, 88, "Time: "+ string_format(arr_files[2, FILE_DATA.time], 2, 2), -1, 64);
draw_text_ext(160, 112, "Burgers: "+string(arr_files[2, FILE_DATA.burgers]), -1, 64);
draw_text_ext(160, 136, "Pickles: " +string(arr_files[2, FILE_DATA.pickles]), -1, 64);
draw_text_ext(160, 160, "Onions:" +string(arr_files[2, FILE_DATA.onions]), -1, 64);

//Save File 3
draw_sprite(spr_saveLevels, arr_files[3, FILE_DATA.level], 240, 16);
draw_sprite(spr_saveFiles, 0, 240, 64);
draw_set_color(WHITE);
draw_set_font(fnt_general);
draw_set_halign(fa_center);

//Drawing the info
draw_text_ext(272, 64, arr_files[3, FILE_DATA.name], -1, 64);
draw_text_ext(272, 88, "Time: "+ string_format(arr_files[3, FILE_DATA.time], 2, 2), -1, 64);
draw_text_ext(272, 112, "Burgers: "+string(arr_files[3, FILE_DATA.burgers]), -1, 64);
draw_text_ext(272, 136, "Pickles: " +string(arr_files[3, FILE_DATA.pickles]), -1, 64);
draw_text_ext(272, 160, "Onions:" +string(arr_files[3, FILE_DATA.onions]), -1, 64);

//Drawing the selection frame
switch(var_selected)
{
	case 1:
		draw_sprite(spr_saveFrame, 0 , 16, 16)
	break;
	
	case 2:
		draw_sprite(spr_saveFrame, 0 , 128, 16)
	break;
	
	case 3:
		draw_sprite(spr_saveFrame, 0 , 240, 16)
	break;
};
if(keyboard_check_pressed(global.leftKey))
{
	var_selected--
};

if(keyboard_check_pressed(global.rightKey))
{
	var_selected++
};

var_selected = clamp(var_selected, 1, 3)