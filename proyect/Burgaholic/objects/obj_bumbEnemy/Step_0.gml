//Die
if(place_meeting(x, y, obj_bumbExplosion))
{
	instance_destroy();
	
	if(instance_exists(obj_bumb))
	{
		obj_bumb.var_score ++;
	};
};
var _direction = point_direction(x, y, obj_bumb.x, obj_bumb.y);
var_spd  = lengthdir_x(1, _direction)
var_vspd = lengthdir_y(1, _direction)

if(var_spd != 0){
	image_xscale = sign(var_spd);
};

x += var_spd;
y += var_vspd;