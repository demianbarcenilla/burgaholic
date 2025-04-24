var_vspd += .1;
var_vspd = clamp(var_vspd, -var_vmax, var_vmax);

collisionBasic();

if(place_meeting(x +sign(var_spd), y, obj_wall))
{
	var_spd *= -1;
}

if(place_meeting(x, y +sign(var_vspd), obj_wall))
{
	var_vspd = -var_vmax;
}

if(var_hp <= 0)
{
	instance_destroy();
}