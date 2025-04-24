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
		audio_play_sound(sfx_menuS, 2, 0);
		switch(var_selected)
		{
			case 0: //Continue
				instance_activate_all();
				instance_destroy();
			break;
	
			case 1: //Options
				var_wipeProgress = 0;
				
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
		audio_play_sound(sfx_menuU, 2, 0);
	}

	else if(keyboard_check_pressed(global.k_down))
	{
		var_selected ++;
		var_selectedDisplace = 0;
		audio_play_sound(sfx_menuD, 2, 0);
	};

	var_selected = clamp(var_selected, 0, _options)
}

function scr_menuOptions(){
	//Draw Background
	draw_sprite(bg_pause, 0, 0, 0)

	var _options = 7, _sprHeight = 24, _langAmmount = 1;

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
	draw_sprite(spr_language, global.lang, 96, 16+(_sprHeight*4))
	
	//Draw Wipe Progress
	draw_sprite(spr_wipeProgress, var_wipeProgress, 96, 16+(_sprHeight*5))
	

	ini_open("settings.ini");
		//Draw Current Window Size (SPRITE)
		draw_sprite(spr_window, ini_read_real("options", "window", 0), 96, 16+(_sprHeight*2));
		
		//Draw Timer Mode (SPRITE) 
		draw_sprite(spr_timer, ini_read_real("options", "timer", 0), 96, 16+(_sprHeight*6));
	ini_close();
	
	//DRAW SLIDERS
	ini_open("settings.ini")
		var _musGain = ini_read_real("options", "musicVol", 1),
			_sfxGain = ini_read_real("options", "sfxVol", 1);
		slider(96, 16, _musGain) //Music
		slider(96, 16+_sprHeight, _sfxGain) //SFX
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
				audio_play_sound(sfx_menuD, 2, 0);
			}
				
			else if(keyboard_check_pressed(global.k_right))
			{
				audio_group_set_gain(ag_sfx, _curGain+_volumeAdd, 0);
				audio_play_sound(sfx_menuU, 2, 0);
			};
			
			ini_open("settings.ini")
				ini_write_real("options", "sfxVol", clamp(audio_group_get_gain(ag_sfx), 0, 1));
			ini_close();
		break;
			
		case 2: //Window
			if(keyboard_check_pressed(global.k_jump))
			{
				audio_play_sound(sfx_menuS, 2, 0);
				
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
				audio_play_sound(sfx_menuS, 2, 0);
				var_isChangingControls = true;
			};
		break;
			
		case 4: //Language
			ini_open("settings.ini")
				if(keyboard_check_pressed(global.k_jump))
				{
					audio_play_sound(sfx_menuS, 2, 0);
					
					global.lang ++;
					
					if(global.lang > _langAmmount)
					{
						global.lang = 0
					};
					
					ini_write_real("options", "language", global.lang);
					
					with(obj_control)
					{
						global.langString = arr_lang[global.lang]
					};
				};
			ini_close();
		break;
			
		case 5: //Wipe Save
			if(keyboard_check_pressed(global.k_jump))
			{
				if(var_wipeProgress < 3)
				{
					var_wipeProgress++;
					audio_play_sound(sfx_hitSelf, 1, false)
				}
				else
				{
					file_delete("data.ini")
					game_restart();
				};
			};
		break;
			
		case 6: //Timer
			ini_open("settings.ini")
				if(keyboard_check_pressed(global.k_jump))
				{
					audio_play_sound(sfx_menuS, 2, 0);
					global.timer ++;
					
					if(global.timer > 3)
					{
						global.timer = 0
					};
					
					ini_write_real("options", "timer", global.timer);
				};
			ini_close();
		break;
		
		case 7: //Back
			if(keyboard_check_pressed(global.k_jump))
			{
				audio_play_sound(sfx_menuS, 2, 0);
				
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
			var_selected = 7;
		break;
	}
	
	if(var_isChangingControls)
	{
		var _string;
		switch(global.lang)
		{
			case 0:
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
			break;
			
			case 1:
			switch(var_keybind)
				{
					case 0:
						_string = "ARRIBA"
					break;
			
					case 1:
						_string = "ARRIBA"
					break;
			
					case 2:
						_string = "IZQUIERDA"
					break;
			
					case 3:
						_string = "ABAJO"
					break;
			
					case 4:
						_string = "DERECHA"
					break;
			
					case 5:
						_string = "SALTO/SELEC."
					break;
			
					case 6:
						_string = "DASH/VOLVER"
					break;
				};
			break;
		};
		
		//Draw text!
		draw_set_font(fnt_holicSmall);
		draw_set_valign(fa_center);
		draw_set_halign(fa_left);
		
		switch(global.lang)
		{
			case 0: 
				draw_text(96, 16+(_sprHeight*3)+8, "Press Your New " + _string + " Key!")
			break;
			
			case 1: 
				draw_text(96, 16+(_sprHeight*3)+8, "Presiona Tu Nueva Tecla " + _string + "!")
			break;
		}
		
		draw_set_valign(fa_none);
		draw_set_halign(fa_none);
		
		if(keyboard_check_pressed(vk_anykey))
		{
			audio_play_sound(sfx_chat, 2, 0);
			
			ini_open("settings.ini")
				switch(var_keybind)
				{
					case 0:
						ini_section_delete("keys")
						//Automatically changes once you select the controls option
						//So we use that keypress to erase all previous control data
						//This allows the player to input a key that was saved previously without counting it as a repeat
					break;
					case 1:
						var _repeated = scr_repeatedKey();
						
						if(_repeated)
						{
							var_keybind --;
							audio_play_sound(sfx_pop, 1, 0)
						}
						else
						{
							global.k_up = keyboard_key;
							ini_write_real("keys", "up", global.k_up)
						}
						
					break;
			
					case 2:
						var _repeated = scr_repeatedKey();
						
						if(_repeated)
						{
							var_keybind --;
							audio_play_sound(sfx_pop, 1, 0)
						}
						else
						{
							global.k_left = keyboard_key;
							ini_write_real("keys", "left", global.k_left)
						}
					break;
			
					case 3:
						var _repeated = scr_repeatedKey();
						
						if(_repeated)
						{
							var_keybind --;
							audio_play_sound(sfx_pop, 1, 0)
						}
						else
						{
							global.k_down = keyboard_key;
							ini_write_real("keys", "down", global.k_down)
						};
					break;
			
					case 4:
						var _repeated = scr_repeatedKey();
						
						if(_repeated)
						{
							var_keybind --;
							audio_play_sound(sfx_pop, 1, 0)
						}
						else
						{
							global.k_right = keyboard_key;
							ini_write_real("keys", "right", global.k_right)
						};
					break;
			
					case 5:
						var _repeated = scr_repeatedKey();
						
						if(_repeated)
						{
							var_keybind --;
							audio_play_sound(sfx_pop, 1, 0)
						}
						else
						{
							global.k_jump = keyboard_key;
							ini_write_real("keys", "jump", global.k_jump)
						};
					break;
			
					case 6:
						var _repeated = scr_repeatedKey();
						
						if(_repeated)
						{
							var_keybind --;
							audio_play_sound(sfx_pop, 1, 0)
						}
						else
						{
							global.k_special = keyboard_key;
							ini_write_real("keys", "dash", global.k_special)
						};
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
	}
	else
	{
		//Select Different Options
		if(keyboard_check_pressed(global.k_up))
		{
			var_selected --;
			var_selectedDisplace = 0;
			audio_play_sound(sfx_menuU, 2, 0);
		}

		else if(keyboard_check_pressed(global.k_down))
		{
			var_selected ++;
			var_selectedDisplace = 0;
			audio_play_sound(sfx_menuD, 2, 0);
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
		if(var_selected != 0)
		{
			audio_play_sound(sfx_menuS, 2, 0);
		};
		
		switch(var_selected)
		{
			case 0: //Start
				global.specialMusic = false;
				audio_play_sound(sfx_gameStart, 1, false)
				if(!instance_exists(obj_transition2))
				{
					var _transition = instance_create_depth(0, 0, depth, obj_transition2)
					_transition.var_action = function() //Go to desired room when transition is over
					{ 
						room_goto(decide_startroom());
					};
				}
				
				obj_control.var_runTimeGlobal = true;
				obj_control.var_runTime100 = true;
			break;
	
			case 1: //Options
				var_wipeProgress = 0;
				
				var_state = menu.options
				var_selected = 0;
				screenshake(8, 10, .1)
			break;
	
			case 2: //Achievements
				audio_play_sound(sfx_no, 2, 0);
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
		audio_play_sound(sfx_menuU, 2, 0);
	}

	else if(keyboard_check_pressed(global.k_down))
	{
		var_selected ++;
		var_selectedDisplace = 0;
		audio_play_sound(sfx_menuD, 2, 0);
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