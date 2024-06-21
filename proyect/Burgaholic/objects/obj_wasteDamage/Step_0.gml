if(place_meeting(x, y, obj_wall)) or (y > room_height)
{
	sprite_index = spr_wastePileDropDie
};

if(sprite_index = spr_wastePileDropDie)
{
	if(image_index == image_number-1)
	{
		instance_destroy();
	}
}
else
{
	y += var_spd;
}