if(var_retract)
{
	var _spd = .1;
	image_xscale -= _spd;
	image_yscale -= _spd;

	image_xscale = clamp(image_xscale, 0, 1);
	image_yscale = clamp(image_xscale, 0, 1);

	image_angle -= 5
	if(image_xscale = 0)
	{
		instance_destroy()
	};
};
x =obj_clowncar.x;
y =obj_clowncar.y;