instance_destroy();

for(var i = 0; i < 3; i++)
{
	var _fx = instance_create_depth(x, y, depth, obj_barrierFX)
	if(i % 2 = 0)
	{
		_fx.var_spd = -2;
		_fx.var_vspd = random_range(-3, -8);
	}
	else
	{
		_fx.var_spd = 2;
		_fx.var_vspd = random_range(-3, -8);
	}
	
	_fx.image_index = i % 2
};

screenshake(5, 2, .1)