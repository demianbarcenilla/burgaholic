x += var_spd;
y += var_vspd;

var_vspd += var_grav;
if(place_meeting(x, y, obj_wall))
{
	instance_destroy();
};