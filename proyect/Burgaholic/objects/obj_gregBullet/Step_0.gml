if(var_canHit)
{
	var_vspd += var_grav;
}

y += var_vspd;

x += var_spd;

if(y > room_height)
{
	instance_destroy();
};