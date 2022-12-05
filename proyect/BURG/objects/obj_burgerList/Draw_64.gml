//draw background
draw_sprite(spr_burgerList, 0, 30, 14);
var _width = 8, 
	_lenght = 3,
	_xborder = 32,
	_yborder = 48,
	i, ii,
	
	_minPage = 0,
	_maxPage = 6;
//Draw burger sprites
for(i=0; i < _width; i++)
{
	for(ii=0; ii < _lenght; ii++)
	{
		ini_open("saves.ini");
			var _unlocked = ini_read_real("burgerUnlocks", i+(ii*_width) +(var_page*24), false);
		ini_close();
		
		if(_unlocked = false)
		{
			gpu_set_fog(true, BLACK, 0, 1);
				draw_sprite(spr_burgers, i +(ii*_width) +(var_page*24), _xborder +32*i, _yborder+32*ii);
			gpu_set_fog(false, c_white, 0, 1);
		};
		else
		{
			draw_sprite(spr_burgers, i +(ii*_width) +(var_page*24), _xborder +32*i, _yborder+32*ii);
		};
		if(var_xsel = i) and (var_ysel = ii)
		{
			draw_sprite(spr_marker, 0, _xborder+32*i, _yborder+32*ii); //If selected = current burger, draw a marker
		};
	};
};

//Displace trought the selections (Y)
if(keyboard_check_pressed(global.upKey)) and ((var_xsel >= 0) and(var_xsel < _width))
{
	var_ysel --;
};

if(keyboard_check_pressed(global.downKey)) and ((var_xsel >= 0) and(var_xsel < _width))
{
	var_ysel ++;
};
var_ysel = clamp(var_ysel, 0, _lenght);

//Displace trought the selections (X)
if(keyboard_check_pressed(global.leftKey)) and (var_ysel < _lenght)
{
	var_xsel --;
};

if(keyboard_check_pressed(global.rightKey)) and (var_ysel < _lenght)
{
	var_xsel ++;
};

//Var selected = the position in the grid
var_selected = var_xsel +(var_ysel*_width) +(var_page *24);
var_selected = clamp(var_selected, 0, 168); //Clamp selected between the first and last burgers of all

draw_set_color(WHITE); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if((var_xsel >= 0) and(var_xsel < _width)) and (var_ysel < _lenght) //Draw text
{
	if(_unlocked)
	{
		draw_text_transformed(ROOM_WIDTH/2, 32, string(arr_burgers[var_selected, 0]), 2, 2, image_angle); //Burger Name
		draw_text_ext(ROOM_WIDTH/2, 168, string(arr_burgers[var_selected, 1]), -1, 256); //Burger Description
	};
	else
	{
		draw_text_transformed(ROOM_WIDTH/2, 32, "?", 2, 2, image_angle); //Burger Name
		draw_text_ext(ROOM_WIDTH/2, 168, "?", -1, 256); //Burger Description
	};
};

if(var_page = _minPage) //If 1st Page
{
	if(var_xsel = _width) //Draws arrows in the 1st page
	{
		draw_sprite(spr_burgArrows, 3, 290, 80);
	};
	else
	{
		draw_sprite(spr_burgArrows, 1, 290, 80);
	};
	
	var_xsel = clamp(var_xsel, 0, _width);
}
else if(var_page = _maxPage)//If last Page
{
	if(var_xsel = -1) //Draw arrows in the last page
	{
		draw_sprite(spr_burgArrows, 2, 0, 80);
	};
	else
	{
		draw_sprite(spr_burgArrows, 0, 0, 80);
	};
	
	var_xsel = clamp(var_xsel, -1, _width-1);
}
else //If middle pages
{
	switch(var_xsel) //Draw arrows in the middle pages
	{
		case -1:
				draw_sprite(spr_burgArrows, 2, 0, 80);
				draw_sprite(spr_burgArrows, 1, 290, 80);
		break;
	
		case _width:
			draw_sprite(spr_burgArrows, 0, 0, 80);
			draw_sprite(spr_burgArrows, 3, 290, 80);
		break;
	
		default: 
			draw_sprite(spr_burgArrows, 0, 0, 80);
			draw_sprite(spr_burgArrows, 1, 290, 80);
		break;
	};
	
	var_xsel = clamp(var_xsel, -1, _width);
};

if(keyboard_check_pressed(global.jumpKey))
{
	if(var_xsel = -1)
	{
		var_page --;
	};
	else if(var_xsel = _width)
	{
		var_page ++;
	};
};
var _sprite = asset_get_index("spr_options" +string(global.var_lang)),
	_selected = asset_get_index("spr_optionsSelected" +string(global.var_lang));
		
if(var_ysel = _lenght)
{
	draw_sprite(_selected, 5, ROOM_WIDTH/2, 200);
	if(keyboard_check_pressed(global.jumpKey)) or (keyboard_check_pressed(vk_enter))
	{
		instance_create_depth(0, 0, 0, obj_pauseMenu);
		instance_destroy();
	};
}
else
{
	draw_sprite(_sprite, 5, ROOM_WIDTH/2, 200);
};