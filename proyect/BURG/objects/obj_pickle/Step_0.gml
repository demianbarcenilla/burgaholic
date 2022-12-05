/// @description Destroy
if(place_meeting(x, y, obj_player))
{
	freezeFrame(60)
	screenshake(10, 2, .2)
	
	part_emitter_burst(global.p_system, global.p_pickle, global.p_ghost, p_ammount*3)
	
	instance_create_layer(x, y, layer, obj_pickleGhost)
	instance_destroy();
	
	audio_play_sound(sfx_pickle, 1, false)
};

//variables
var _increment = 4,
	_amplitude = 6,
	_shift;
//add *_increment* degrees every step, reset at 360
t = (t + _increment) mod 360;

//shift value = the sine of t * the amplitude of the wave
_shift = dsin(t) * _amplitude;

//shift
y = ystart + _shift;