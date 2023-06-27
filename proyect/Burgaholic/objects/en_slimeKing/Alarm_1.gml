if(var_state != SLIME_STATE.hit)
{
	var_state = SLIME_STATE.jumping;
	var_vspd = -var_jspd;
	y -= 2;
}
