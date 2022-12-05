/// STEP EVENT
switch(var_state)
{
	case STATE_MACHINE.normal:
		state_normal();
	break;
	
	case STATE_MACHINE.damage:
		state_damage();
	break;
};

if(var_hspd != 0)
{
	var_xscale = sign(var_hspd);
};