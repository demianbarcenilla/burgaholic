var i, _fadeTime = 0;
for(i = 0; i < 8; i++)
{
	var _sound = asset_get_index("mus_lvl"+string(i));
	if(_sound = asset_get_index("mus_lvl"+string(var_selected)))
	{
		ini_open("settings.ini")
			audio_sound_gain(_sound, audio_group_get_gain(ag_music), _fadeTime)
		ini_close();
	}
	else
	{
		audio_sound_gain(_sound, 0, _fadeTime)
	};
};

/*global.music = asset_get_index("mus_lvl"+string(var_selected));
if(!audio_is_playing(global.music))

{	
	audio_stop_sound(var_mus);
	
	var_mus = audio_play_sound(global.music, 0, true)
	audio_sound_set_track_position(global.music, var_musTime)
}
