y += var_vspd;
x += var_spd;

if(place_meeting(x, y, obj_wall))
{
	instance_destroy();
};

if(x > room_width) or (x < 0)
{
	instance_destroy();
}

if(y > room_height) or (y < 0)
{
	instance_destroy();
}