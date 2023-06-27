draw_sprite(spr_burgerList, var_page, SCREEN_WIDTH/2, 14)

if(keyboard_check_pressed(global.k_right))
{
	var_selectedX ++;
}

if(keyboard_check_pressed(global.k_left))
{
	var_selectedX --;
}

if(keyboard_check_pressed(global.k_down))
{
	var_selectedY ++;
}

if(keyboard_check_pressed(global.k_up))
{
	var_selectedY --;
}

var_selectedX = clamp(var_selectedX, -1, 8)
var_selectedY = clamp(var_selectedY, 0, 2)
var _arrowDisplace = 8;

for(i = 0; i < 8; i++) //Draw Burgers
{
	var _xpos = i
	for(ii = 0; ii < 3; ii++)
	{
		var _ypos = ii;
		var _id = _xpos + (_ypos*8) +(var_page*8*3);
		
		ini_open("data.ini");
			var _unlocked = ini_read_real("burgersUnlocked", _id, 0);
		ini_close();
		
		if(_unlocked)
		{
			draw_sprite(spr_burgers, _id, 32 + (32*_xpos), 48 + (32*_ypos))
		}
		else
		{
			gpu_set_fog(true, $502C33, 0, 10)
				draw_sprite(spr_burgers, _id, 32 + (32*_xpos), 48 + (32*_ypos))
			gpu_set_fog(false, c_white, 0, 10)
		}
	};
};

if(var_selectedX > -1) and (var_selectedX < 8) //Burger Selected
{
	draw_sprite(spr_burgerFrame, 0, 32 + (32*var_selectedX), 48 + (32*var_selectedY))
	draw_sprite(spr_arrow, 0, _arrowDisplace, SCREEN_HEIGHT/2)
	draw_sprite(spr_arrow, 1, SCREEN_WIDTH-_arrowDisplace, SCREEN_HEIGHT/2)
	
	//WRITE BURGER NAME/DESCRIPTION
	
	ini_open("data.ini"); //Check if Unlocked before drawing the attributes
		var _unlocked = ini_read_real("burgersUnlocked", var_burgerSelected, 0);
	ini_close();
	
	if(_unlocked)
	{
		ini_open("lang_" + global.langString + ".ini")
			draw_set_color(make_color_rgb(226, 243, 228))
			draw_set_font(fnt_holic)
			draw_text_ext(SCREEN_WIDTH/2, 24, ini_read_string("burgNames", var_burgerSelected, 0), 0, 240)
			
			draw_set_color(make_color_rgb(70, 135, 143))
			draw_set_font(fnt_holicSmall)
			draw_text_ext(SCREEN_WIDTH/2, 130+24, ini_read_string("burgDescriptions", var_burgerSelected, 0), 0, 240)
		ini_close();
	}
	else
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_top)
		
		draw_set_color(make_color_rgb(60, 84, 96))
		draw_text_ext(SCREEN_WIDTH/2, 24, "Locked", 0, 240)

		draw_set_color(make_color_rgb(52, 65, 99))
		draw_set_font(fnt_holicSmall)
		draw_text_ext(SCREEN_WIDTH/2, 130+24, "...", 0, 240)
	};
};
else if(var_selectedX <= -1) //Left Arrow Selected
{
	draw_sprite(spr_arrow, 2, _arrowDisplace, SCREEN_HEIGHT/2)
	draw_sprite(spr_arrow, 1, SCREEN_WIDTH-_arrowDisplace, SCREEN_HEIGHT/2)	
	
	if(keyboard_check_pressed(global.k_jump))
	{
		if(var_page = 0)
		{
			var_page = 6;
		}
		else
		{
			var_page--;
		};
	};
};
else //Right Arrow Selected
{
	draw_sprite(spr_arrow, 0, _arrowDisplace, SCREEN_HEIGHT/2)
	draw_sprite(spr_arrow, 3, SCREEN_WIDTH-_arrowDisplace, SCREEN_HEIGHT/2)
	
	if(keyboard_check_pressed(global.k_jump))
	{
		if(var_page = 6)
		{
			var_page = 0;
		}
		else
		{
			var_page++;
		};
		
	};
}

var_page = clamp(var_page, 0, 6);

var_burgerSelected = var_selectedX + (var_selectedY*8) +(var_page*8*3)
		
draw_set_font(fnt_holic)
draw_set_halign(fa_center)