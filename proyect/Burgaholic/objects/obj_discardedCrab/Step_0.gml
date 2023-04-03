x += var_spd;

var_vspd += var_grav;
y += var_vspd;

if(y > room_height)
{
	instance_destroy();
};

image_angle += 1;