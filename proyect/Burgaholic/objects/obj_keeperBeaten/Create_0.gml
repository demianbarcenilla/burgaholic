image_speed = 0;
image_index = 0;
var_spd = 8;
var_vspd = -4;
var_grav = .1;

var_chatbox = 0
var_chat = "ChatDakota"
var_sprite = spr_dakotaStanding;

//0 = SHAKING
//1 = BOUNCING
//2 = STANDING
var_state = 0;

var_shake = false;
global.specialMusic = true;
global.music = mus_silence;

audio_play_sound(sfx_bossBeat, 1, false)