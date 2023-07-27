y += var_vspd;

var_vspd = lerp(var_vspd, 0, .05)

if(var_vspd > -0.5)
{
	instance_destroy();
	for(var i=0; i < 8; i++)
	{
		var _smallBall = instance_create_depth(x, y, depth, obj_fireballSmall),
			_dir = 45*i;
		
		_smallBall.var_spd = lengthdir_x(2, _dir);
		_smallBall.var_vspd = lengthdir_y(2, _dir);
	};
};