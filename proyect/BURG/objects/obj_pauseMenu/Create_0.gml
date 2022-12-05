///Setup
var_spr = asset_get_index("spr_pause" +string(global.var_lang))
var_sprSelected = asset_get_index("spr_pauseSelected" +string(global.var_lang))
var_selected = 0;

var_xscale = 1;
var_yscale = 1;

var_xscaleSelected = 1;
var_yscaleSelected = 1;

pos = audio_sound_get_track_position(global.musCurrent);
audio_pause_all();

alarm[0] = 1;

var_input = false;