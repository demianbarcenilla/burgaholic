x += var_spd;
y += var_vspd;

if(place_meeting(x, y, obj_wall)) or (y > room_height)
{
	instance_destroy();
};