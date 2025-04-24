if(place_meeting(x, y, obj_player))
{
	with(obj_player)
	{
		audio_play_sound(sfx_spring, 2, 0);
		var_vspd = var_jspd*3;
	};
	image_speed = IMAGE_SPEED;
};

if(image_index = image_number-1)
{
	image_index = 0;
	image_speed = 0;
};