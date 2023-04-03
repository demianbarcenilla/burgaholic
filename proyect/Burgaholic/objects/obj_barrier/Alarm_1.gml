instance_destroy();

for(i = 0; i < 3; i++)
{
	var _fx = instance_create_depth(x, y, depth, obj_barrierFX)
	if(i % 2 = 0)
	{
		_fx.var_spd = -2;
	}
	else
	{
		_fx.var_spd = 2;
	}
	
	if(i >= 2)
	{
		_fx.var_vspd = 0;
	}
	else
	{
		_fx.var_vspd = -5;
	}
	
	_fx.image_index = i % 2
};