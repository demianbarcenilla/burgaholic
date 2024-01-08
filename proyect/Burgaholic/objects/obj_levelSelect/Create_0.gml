var_selected = 0;
var_displace = 0
var_displaceProgress = 1;
var_displaceDir = 1;
var_hasSelected = false;

ini_open("data.ini")
	var_worldNumber = ini_read_real("Stages", "Total", 0); //Counting from 0, the ammount of levels u got available. 0 being the tutorial
ini_close();
var_worldMAX = 7;
var_mus = audio_play_sound(asset_get_index("mus_lvl"+string(var_selected)), 100, true);
var_musTime = 0;
image_speed = 0;

audio_stop_all();
sg = audio_create_sync_group(true)
var i;

for(i = 0; i < 8; i++)
{
	var _sound = asset_get_index("mus_lvl"+string(i));
	audio_play_in_sync_group(sg, _sound)
	audio_sound_gain(_sound, 0, 0)
};

audio_start_sync_group(sg);

global.specialMusic = true;

t=0;

if(instance_exists(obj_player))
{
	instance_destroy(obj_player);
};