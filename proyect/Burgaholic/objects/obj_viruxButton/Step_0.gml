if(place_meeting(x, y, obj_virux)) and (!isPressed)
{
	isPressed = true;
	instance_destroy(obj_viruxLock);
	audio_play_sound(sfx_noisePoints, 1, false);
	image_index = 1;
};