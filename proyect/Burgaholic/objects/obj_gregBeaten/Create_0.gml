image_speed = 0;
sprite_index = spr_gregDie;
depth = -50;

var_spd = 0;
var_vspd = -4;
var_grav = .1;

var_chatbox = global.stage;
var_sprite = spr_gregDie;
var_chat = "DefeatGreg"

var_event = function(){var_state = 3};
//0 = SHAKING
//1 = BOUNCING
//2 = STANDING
var_state = 0;

var_shake = false;

global.specialMusic = true;
global.music = mus_silence;

audio_stop_all();

audio_play_sound(sfx_bossBeat, 1, false);