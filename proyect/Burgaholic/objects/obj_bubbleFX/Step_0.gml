if(var_state = 0) //DISPLACES AT FIRST (OPTIONAL)
{
	x += var_spd;
	y += var_vspd;
	var_spd = lerp(var_spd, 0, .01);
	var_vspd = lerp(var_vspd, 0, .01);
	
	if(abs(var_spd) < 0.1)
	{
		var_state = 1;
	};
}
else if(var_state = 1) //NORMAL WAVE MOVEMENT
{
	x += osc_step(10, .1);
	y += var_grav;
};

//DESTROY
if(y < 0)
{
	instance_destroy();
};