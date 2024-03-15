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
				if(room != rm_mainMenu)
				{
					room_goto(rm_mainMenu)
				}
				else
				{
					var_state = MAIN_MENU.main;
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
}

function scr_menuOptions(){
	//Draw Background
	draw_sprite(bg_pause, 0, 0, 0)

	var _options = 6, _sprHeight = 28, _langAmmount = 1;

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
	draw_sprite(spr_language, global.lang, 96, 16+(28*4))
	
	//Draw Current Window Size (SPRITE)
	ini_open("settings.ini");
		draw_sprite(spr_window, ini_read_real("options", "window", 0), 96, 16+(28*2));
	ini_close();
	
	//DRAW SLIDERS
	ini_open("settings.ini")
		var _musGain = ini_read_real("options", "musicVol", 1),
			_sfxGain = ini_read_real("options", "sfxVol", 1);
		slider(96, 16, _musGain) //Music
		slider(96, 16+28, _sfxGain) //SFX
	ini_close()
	
	//TRIGGER THE OPTIONS
	switch(var_selected)
	{
		case 0: //Music
			var _curGain = audio_group_get_gain(ag_music),
			_volumeAdd = .1
			if(keyboard_check_pressed(global.k_left))
			{
				audio_group_set_gain(ag_music, _curGain-_volumeAdd, 0);
			}
				
			else if(keyboard_check_pressed(global.k_right))
			{
				audio_group_set_gain(ag_music, _curGain+_volumeAdd, 0);
			};
				
			ini_open("settings.ini")
				ini_write_real("options", "musicVol", clamp(audio_group_get_gain(ag_music), 0, 1));
			ini_close();
		break;
	
	
		case 1: //SFX
			_curGain = audio_group_get_gain(ag_sfx);
			_volumeAdd = .1;
			if(keyboard_check_pressed(global.k_left))
			{
				audio_group_set_gain(ag_sfx, _curGain-_volumeAdd, 0);
			}
				
			else if(keyboard_check_pressed(global.k_right))
			{
				audio_group_set_gain(ag_sfx, _curGain+_volumeAdd, 0);
			};
			
			ini_open("settings.ini")
				ini_write_real("options", "sfxVol", clamp(audio_group_get_gain(ag_sfx), 0, 1));
			ini_close();
		break;
			
		case 2: //Window
			if(keyboard_check_pressed(global.k_jump))
			{
				ini_open("settings.ini")
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
			};
		break;
		
		case 3: //Controls
			if(keyboard_check_pressed(global.k_jump))
			{
				var_isChangingControls = true;
			};
		break;
			
		case 4: //Language
			ini_open("settings.ini")
				if(keyboard_check_pressed(global.k_jump))
				{
					global.lang ++;
					if(global.lang > _langAmmount)
					{
						global.lang = 0
						ini_write_real("options", "language", global.lang);
					};
				};
			ini_close();
		break;
			
		case 5: //Wipe Save
			if(keyboard_check_pressed(global.k_jump))
			{
				file_delete("data.ini")
			};
		break;
			
		case 6: //Back
			if(keyboard_check_pressed(global.k_jump))
			{
				if(room != rm_mainMenu)
				{
					var_state = menu.pause;
					var_selected = 0;
				}
				else
				{
					var_state = MAIN_MENU.main;	
					var_selected = 0;
				};
			};
		break;
			
		default: //Default to Continue if you choose an option outside of the range
			instance_activate_all();
			instance_destroy();
		break;
	}
	
	if(var_isChangingControls)
	{
		var _string;
		switch(var_keybind)
		{
			case 0:
				_string = "UP"
			break;
			
			case 1:
				_string = "UP"
			break;
			
			case 2:
				_string = "LEFT"
			break;
			
			case 3:
				_string = "DOWN"
			break;
			
			case 4:
				_string = "RIGHT"
			break;
			
			case 5:
				_string = "JUMP/SELECT"
			break;
			
			case 6:
				_string = "DASH/RETURN"
			break;
		};
		
		//Draw text!
		draw_set_font(fnt_holicSmall);
		draw_set_valign(fa_center);
		draw_set_halign(fa_left);
		draw_text(96, 16+(28*3)+8, "Press Your New " + _string + " Key!")
		draw_set_valign(fa_none);
		draw_set_halign(fa_none);
		
		if(keyboard_check_pressed(vk_anykey))
		{
			ini_open("settings.ini")
				switch(var_keybind)
				{
					case 0:
						//Do nothing. This would change the first input to the current jump button
						//(keyboard_check_pressed() automatically takes the last input you did {select button} and replaces UP with it. so just go to the next case instead)
					break;
					case 1:
						global.k_up = keyboard_key;
						ini_write_real("keys", "up", global.k_up)
					break;
			
					case 2:
						global.k_left = keyboard_key;
						ini_write_real("keys", "left", global.k_left)
					break;
			
					case 3:
						global.k_down = keyboard_key;
						ini_write_real("keys", "down", global.k_down)
					break;
			
					case 4:
						global.k_right = keyboard_key;
						ini_write_real("keys", "right", global.k_right)
					break;
			
					case 5:
						global.k_jump = keyboard_key;
						ini_write_real("keys", "jump", global.k_jump)
					break;
			
					case 6:
						global.k_special = keyboard_key;
						ini_write_real("keys", "dash", global.k_special)
					break;
				};
			ini_close();
			
			if(var_keybind < 6)
			{
				var_keybind++;
			}
			else
			{
				var_isChangingControls = false;
				var_keybind = 0;
			};
		};
	};
	else
	{
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
	}
	

	var_selected = clamp(var_selected, 0, _options)
};
	
function scr_menuMain(){
	//Draw Background
	var _options = 3, _sprHeight = 32;
	
	//Displace Sprites
	var_selectedDisplace = lerp(var_selectedDisplace, 8, .1);

	for(var i = 0; i <= _options; i++)
	{
		var _yDisplace = 100, _gap = 14;
		if(var_selected = i)
		{
			draw_sprite(asset_get_index("spr_mainMenuSelected" + string(global.lang)), i, room_width/2 +var_selectedDisplace, _yDisplace +((i*_sprHeight)-_gap))
		}
		else
		{
			draw_sprite(asset_get_index("spr_mainMenu" + string(global.lang)), i, room_width/2, _yDisplace +((i*_sprHeight)-_gap))
		}
	};

	//TRIGGER THE OPTIONS
	if(keyboard_check_pressed(global.k_jump)) 
	{
		switch(var_selected)
		{
			case 0: //Start
				global.specialMusic = false;
				audio_play_sound(sfx_gameStart, 1, false)
				if(!instance_exists(obj_transition2))
				{
					var _transition = instance_create_depth(0, 0, depth, obj_transition2)
					_transition.var_action = function(){ //Go to desired room when transition is over
						ini_open("data.ini")
							var _stagesFinished = ini_read_real("Stages", "Total", 0);
						ini_close();
						
						if(_stagesFinished = 0)
						{
							room_goto(rm_tutorial)
						};
						else
						{
							room_goto(rm_lobby)
						};	
					};
				}
			break;
	
			case 1: //Options
				var_state = menu.options
				var_selected = 0;
				screenshake(8, 10, .1)
			break;
	
			case 2: //Achievements
			break;
		
			case 3: //Exit
				game_end();
			break;
	
			default: //Default to Continue if you choose an option outside of the range
				room_goto(rm_forest)
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

function scr_menuHolic(){
	draw_sprite(spr_title, 0, room_width/2, room_height/2 + osc_step(1, 3))
		
	global.music = mus_silence;
	
	if(keyboard_check_pressed(vk_anykey))
	{
		var_state = MAIN_MENU.main;
		global.music = mus_mainMenu;
		
		screenshake(10, .5, .2)
	};
};

function slider(xx, yy, gain){
	var _margin = 2,
		_height = 5,
		_baseWidth = sprite_get_width(spr_soundBar),
		_baseHeight = sprite_get_height(spr_soundBar),
		_width = gain*(_baseWidth-(_margin*2));
		
	draw_sprite(spr_soundBar, 0, xx, yy +(_baseHeight/2))
	draw_set_color(#FF7259)
		draw_rectangle(xx+_margin, yy+(_baseHeight/2)+_margin, (xx+_margin)+_width, yy+(_baseHeight/2)+_margin+_height, false);
	draw_set_color(c_white);
	draw_sprite(spr_soundBarBURG, 0, xx+_margin+_width, yy+_margin-1+(_baseHeight/2))
}; 