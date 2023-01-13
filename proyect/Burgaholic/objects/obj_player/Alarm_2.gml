/// @description Releasing key in WalkingWall
if((keyboard_check(global.k_right) - keyboard_check(global.k_left)) = 0)
{
	var_spd = 0;
	var_vspd = -var_jspd/4;
	var_state = STATE_MACHINE.normal;
};