image_speed = .2;
var_move = false;
var_dir = 1;
var_vspd = 0
var_spd = 0;

if(!moveVertical)
{
	var_spd = var_dir;
	var_vspd = 0;
}
else
{
	var_vspd = var_dir;
	var_spd = 0;
}