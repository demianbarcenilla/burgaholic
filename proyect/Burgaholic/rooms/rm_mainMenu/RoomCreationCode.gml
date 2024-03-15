global.specialMusic = true;
audio_stop_all();
global.music = mus_silence;
audio_play_sound(sfx_gameOpen, 0, false)
global.prevRoom = -1;
global.nextRoom = -1;