/// @description Move and Destroy

//Move
var_vspd += var_grav;
y  += var_vspd;
x += var_hspd;

//Destroy
if(y > room_height)
{
	instance_destroy();
};