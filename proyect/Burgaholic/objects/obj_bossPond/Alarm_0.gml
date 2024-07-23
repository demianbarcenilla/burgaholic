/// @description Soul separation complete
var_state = GREG_STATE.idle;
audio_stop_sound(sfx_explosion);
obj_player.var_state = STATE_MACHINE.normal

obj_bossPondArmLeft.image_index = 0;
obj_bossPondArmRight.image_index = 0;
		
global.specialMusic = false;

screenshake(5, .5, .1)