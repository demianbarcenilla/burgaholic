if(instance_exists(en_bossBea))
{
	if(en_bossBea.var_spd != 0)
	{
		x = en_bossBea.x +(32 * sign(en_bossBea.var_spd))
		image_xscale = sign(en_bossBea.var_spd);
	}
	
	if(en_bossBea.var_state != CAMEL_STATE.rush)
	{
		instance_destroy();
	}
	
	
}
else
{
	instance_destroy();
}