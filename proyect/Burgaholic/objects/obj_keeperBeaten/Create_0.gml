image_speed = 0;
image_index = global.stage;
var_spd = 8;
var_vspd = -4;
var_grav = .1;

var_chatbox = global.stage;
var _playRiff = true;
switch(global.stage)
{
	case stage.forest:
		var_sprite = spr_dakotaStanding;
		var_chat = "ChatDakota"
	break;
	
	case stage.volcano:
		var_sprite = spr_cedricBeaten;
		var_chat = "ChatCedric"
	break;
	
	case stage.beach:
		var_sprite = spr_camellaBeaten;
		var_chat = "ChatCamella"
	break;
	
	case stage.rust:
		var_sprite = spr_crystalBeaten;
		var_chat = "ChatCrystal"
	break;
	
	case stage.reef:
		var_sprite = spr_madameBeaten;
		var_chat = "ChatMadame"
	break;
	
	case stage.ashtray:
		var_sprite = spr_richardBeaten;
		var_chat = "ChatRichard"
	break;
	
	case stage.core:
		var_sprite = spr_weirdoShop;
		var_chat = "ChatCore"
	break;
	
	case stage.pond:
		var_chatbox = global.stage +1;
		var_sprite = spr_marcusBeaten;
		var_chat = "PrevChatBaddie"
		var_spd = 0;
		
		_playRiff = false;
	break;
	
	default:
		var_sprite = spr_dakotaStanding;
		var_chat = "ChatDakota"
	break;
}

//0 = SHAKING
//1 = BOUNCING
//2 = STANDING
var_state = 0;

var_shake = false;

global.specialMusic = true;
global.music = mus_silence;

audio_stop_all();

if(_playRiff)
{
	audio_play_sound(sfx_bossBeat, 1, false);
	obj_player.var_state = STATE_MACHINE.drink
	obj_player.image_index = 0;
	obj_player.var_spd = 0;
	
	obj_control.var_runTimeCurStage = false;
	
	ini_open("data.ini")
		var _savedPB = ini_read_real("timer", string(global.stage), 0)
		if(_savedPB != 0)
		{
			if(obj_control.var_runTimeCurStage < _savedPB)
			{
				ini_write_real("timer", string(global.stage), obj_control.var_timeCurStage);
				obj_control.var_timeCurStagePB = ini_read_real("timer", string(global.stage), 0);
			}
		}
		else
		{
			ini_write_real("timer", string(global.stage), obj_control.var_timeCurStage);
			obj_control.var_timeCurStagePB = ini_read_real("timer", string(global.stage), 0);
		}
	
	var _stages = ini_read_real("Stages", "Total", 0)
	
	if(_stages < 8)
	{
		ini_write_real("timer", "global", obj_control.var_timeGlobal);
	}
	if(_stages < 9)
	{
		ini_write_real("timer", "100", obj_control.var_time100);
	}
	
	ini_close();
};
