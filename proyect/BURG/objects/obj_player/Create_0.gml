/// @description Set Variables

//STATE MACHINE
enum STATE_MACHINE
{
	normal,
	damage
};
// speed 
var_maxHspd = 4.5;
var_jspd = 6.5;
var_fric = 0.1;
var_descel = 0.9;

var_hspd = 0;
var_justBounced = false;

var_vspd = 0;
var_grav = 0.4;
var_canVary = true//Can use the variable jump

image_speed = 0.3;

var_xscale = 1;
var_yscale = 1;

var_state = STATE_MACHINE.normal;