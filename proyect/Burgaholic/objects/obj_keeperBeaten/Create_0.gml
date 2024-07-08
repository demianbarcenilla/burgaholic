image_speed = 0;
image_index = global.stage;
var_spd = 8;
var_vspd = -4;
var_grav = .1;

var_chatbox = global.stage;

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

audio_play_sound(sfx_bossBeat, 1, false)