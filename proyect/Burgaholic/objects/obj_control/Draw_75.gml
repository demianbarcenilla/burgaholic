///Draw Hearts
var sep = sprite_get_width(spr_heart);

if(instance_exists(obj_player)) and (!instance_exists(obj_chat))
{	
	//Pickle HUD
	draw_set_font(fnt_holicSmall)
	draw_sprite(spr_pickleHud, 0, 96, 16)	
	
	//Align Text
	draw_set_halign(fa_right)
	draw_set_valign(fa_middle)
	
	//Draw Text Outline
	draw_set_color($502C33)
	
	var _textCenter = 95, _textVertical = 27;
	draw_text(_textCenter-1, _textVertical, "x"+ string(global.pickles))
	draw_text(_textCenter+1, _textVertical, "x"+ string(global.pickles))
	draw_text(_textCenter, _textVertical-1, "x"+ string(global.pickles))
	draw_text(_textCenter, _textVertical+1, "x"+ string(global.pickles))
	
	//Draw Text Filling
	draw_set_color(c_white)
	draw_text(_textCenter, _textVertical, "x"+ string(global.pickles))
	
	//DRAW HEARTS
	for(var i=0; i < obj_player.maxHp; i++)
	{ 	
		if(obj_player.hp >= i+1)
		{
			draw_sprite(spr_heart, 0, 16 +i*sep, 16)
		}
		else
		{
			draw_sprite(spr_heart, 1, 16 +i*sep, 16)
		};
	};
};

//Burger Unlock
if(isUnlockingBurg)
{
	burgerDisplace = 0;		
	if(alarm[0] = -1){alarm[0] = 120}
};

burgerDisplace_current = lerp(burgerDisplace_current, burgerDisplace, .1)
draw_sprite(spr_burgerUnlocked, 0, SCREEN_WIDTH/2, 16 -burgerDisplace_current)
draw_sprite(spr_burgers, isUnlockingBurg_type, SCREEN_WIDTH/2 -32, 16 -burgerDisplace_current)

//Draw Death Count
if(var_drawDeathCount)
{
	if(alarm[1] = -1){alarm[1] = 120};
	
	deathCountDisplace = 0;		
	audio_sound_pitch(global.music, .8)
};
deathCountDisplace_current = lerp(deathCountDisplace_current, deathCountDisplace, .1);

draw_sprite(spr_deaths, 0, SCREEN_WIDTH-8, SCREEN_HEIGHT-8 +deathCountDisplace_current)

draw_set_halign(fa_right)
		
ini_open("data.ini");
	var _deaths = ini_read_real("other", "deaths", 0);
ini_close();
		
draw_text(SCREEN_WIDTH-24, SCREEN_HEIGHT-8-5 +deathCountDisplace_current, "x" + string(_deaths))

//DRAW TIMER

//global
var _globalTimerString = timerToString(var_timeGlobal);
var _globalTimerString100 = timerToString(var_time100);
var _globalTimerStringPB = timerToString(var_timeCurStagePB);
var _globalTimerStringCur = timerToString(var_timeCurStage);

if(room != rm_mainMenu) and (!instance_exists(obj_pause)) and (room != rm_levelSelect)
{
	draw_set_font(fnt_timer);
	switch(global.timer)
	{
		case 0:
			//DON'T DRAW
		break;
	
		case 1: //Per Stage
			if(room = rm_lobby)
			{
				ini_open("data.ini")
					var _worldsFinished = string(ini_read_real("Stages", "Total", 0));
				ini_close();
			
				var _acrossTime = timerToString(getAcrossTime());
				draw_text_outlined_colored(8, room_height -8, "TOTAL " + "(" + _worldsFinished + "/8): "+ _acrossTime, #332C50, #E2F3E4);		
			}
			else
			{
				if(var_timeCurStagePB != 0)
				{
					draw_text_outlined_colored(8, room_height -20, "PB: " + _globalTimerStringPB, #332C50, #8DD243)
				}
				else
				{
					draw_text_outlined_colored(8, room_height -20, "PB: -", #332C50, #8DD243)
				}
				
				draw_text_outlined_colored(8, room_height -8, "STAGE: " + _globalTimerStringCur, #332C50, #E2F3E4)
			}
		break; 
	
		case 2: //ANY% 
		
		ini_open("data.ini")
		var _worldsFinished = ini_read_real("Stages", "Total", 0);
		
		if(_worldsFinished >= 8)
		{
			_globalTimerString = timerToString(ini_read_real("timer", "global", 0));
		}
		ini_close();
		
			//Display current stage time on stage. NOT PB!!
			if(room != rm_lobby)
			{
				draw_text_outlined_colored(8, room_height -20, "STAGE: " + _globalTimerStringCur, #332C50, #E2F3E4)
			}
			
			draw_text_outlined_colored(8, room_height -8, "TOTAL: " + _globalTimerString, #332C50, #E2F3E4);
			
		break;
	
		case 3: //100%
			
			ini_open("data.ini")
			var _worldsFinished = ini_read_real("Stages", "Total", 0);
			if(_worldsFinished = 9)
			{
				_globalTimerString100 = timerToString(ini_read_real("timer", "100", 0));
			}
			ini_close();
			
			//Display current stage time on stage. NOT PB!!
			if(room != rm_lobby)
			{
				draw_text_outlined_colored(8, room_height -20, "STAGE: " + _globalTimerStringCur, #332C50, #E2F3E4)
			}
			
			draw_text_outlined_colored(8, room_height -8, "TOTAL: " + _globalTimerString100, #332C50, #E2F3E4);
		break;
	
		default:
			//DON'T DRAW
		break;
	}
}
