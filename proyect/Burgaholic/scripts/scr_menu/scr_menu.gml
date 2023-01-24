// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_menuPause(){
	//Draw Background
	draw_sprite(bg_pause, 0, 0, 0)

	var _options = 3, _sprHeight = 48;

	//Displace Sprites
	var_selectedDisplace = lerp(var_selectedDisplace, 8, .1);
	var_burgDisplace = lerp(var_burgDisplace, 0, .1);

	draw_sprite(spr_pauseMenuBurgers, 0, 240 +var_burgDisplace, room_height/2)
	for(var i = 0; i <= _options; i++)
	{
		if(var_selected = i)
		{
			draw_sprite(asset_get_index("spr_pauseMenuSelected" + string(global.lang)), i, 16 +var_selectedDisplace, 16+(i*_sprHeight))
		}
		else
		{
			draw_sprite(asset_get_index("spr_pauseMenu" + string(global.lang)), i, 16, 16+(i*_sprHeight))
		}
	};

	//TRIGGER THE OPTIONS
	if(keyboard_check_pressed(global.k_jump)) 
	{
		switch(var_selected)
		{
			case 0: //Continue
				instance_activate_all();
				instance_destroy();
			break;
	
			case 1: //Options
				var_state = menu.options
				var_selected = 0;
				screenshake(8, 10, .1)
			break;
	
			case 2: //Burgers
				var_state = menu.burgers
				var_selected = 0;
			break;
		
			case 3: //Exit
				game_end();
			break;
	
			default: //Default to Continue if you choose an option outside of the range
				instance_activate_all();
				instance_destroy();
			break;
		}
	};
	
	//Select Different Options
	if(keyboard_check_pressed(global.k_up))
	{
		var_selected --;
		var_selectedDisplace = 0;
	}

	else if(keyboard_check_pressed(global.k_down))
	{
		var_selected ++;
		var_selectedDisplace = 0;
	};

	var_selected = clamp(var_selected, 0, _options)
}

function scr_menuOptions(){
	//Draw Background
	draw_sprite(bg_pause, 0, 0, 0)

	var _options = 3, _sprHeight = 48, _langAmmount = 1;

	//Displace Sprites
	var_selectedDisplace = lerp(var_selectedDisplace, 8, .1);
	var_burgDisplace = lerp(var_burgDisplace, 0, .1);

	//draw_sprite(spr_pauseMenuBurgers, 0, 240 +var_burgDisplace, room_height/2)
	for(var i = 0; i <= _options; i++)
	{
		if(var_selected = i)
		{
			draw_sprite(asset_get_index("spr_optionsMenuSelected" + string(global.lang)), i, 16 +var_selectedDisplace, 16+(i*_sprHeight))
		}
		else
		{
			draw_sprite(asset_get_index("spr_optionsMenu" + string(global.lang)), i, 16, 16+(i*_sprHeight))
		};
	};

	//Draw Language Flag
	draw_sprite(spr_language, global.lang, 192, 160)
	
	//Draw Current Window Size (SPRITE)
	ini_open("data.ini");
		draw_sprite(spr_window, ini_read_real("options", "window", 0), 192, 64);
	ini_close();
	
	//TRIGGER THE OPTIONS
	if(keyboard_check_pressed(global.k_jump)) 
	{
		switch(var_selected)
		{
			case 0: //Sound
				
			break;
	
			case 1: //Window
				ini_open("data.ini")
					var _window = ini_read_real("options", "window", 0)
					
					//Increase Window Size
					if(_window < 3)
					{
						_window ++;
					}
					else //If currently Fullscreen, go back to smallest
					{
						_window = 0;
					}
					
					ini_write_real("options", "window", _window);
					
					//Apply Changes
					var _width = 320, _height = 224;
					switch(_window)
					{
						case 0:
							window_set_fullscreen(false);
							window_set_size(_width, _height);
						break;
						
						case 1:
							window_set_fullscreen(false);
							window_set_size(_width *2, _height *2);
						break;
						
						case 2:
							window_set_fullscreen(false);
							window_set_size(_width *3, _height *3);
						break;
						
						case 3:
							window_set_fullscreen(true);
						break;
					};
				ini_close();
			break;
	
			case 2: //Controls
			
			break;
		
			case 3: //Language
				global.lang ++;
				if(global.lang > _langAmmount)
				{
					global.lang = 0
				};
			break;
	
			default: //Default to Continue if you choose an option outside of the range
				instance_activate_all();
				instance_destroy();
			break;
		}
	};

	//Select Different Options
	if(keyboard_check_pressed(global.k_up))
	{
		var_selected --;
		var_selectedDisplace = 0;
	}

	else if(keyboard_check_pressed(global.k_down))
	{
		var_selected ++;
		var_selectedDisplace = 0;
	};

	var_selected = clamp(var_selected, 0, _options)
};