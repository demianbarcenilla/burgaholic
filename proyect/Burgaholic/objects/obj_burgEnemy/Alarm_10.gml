var _fireVspd = 0, _fireHspd = -1;
switch(facing)
{
	case 0: //Right
		image_xscale = 1;
		image_angle = 0;
		_fireVspd = 0;
		_fireHspd = 1;
	break;
	
	case 1: //DOWN
		image_xscale = 1;
		image_angle = 270;
		_fireVspd = 1;
		_fireHspd = 0;
	break;
	
	case 2: //LEFT
		image_xscale = -1;
		image_angle = 0;
		_fireVspd = 0;
		_fireHspd = -1;
	break;
	
	case 3: //UP
		image_xscale = 1;
		image_angle = 90;
		_fireVspd = -1;
		_fireHspd = 0;
	break;
};

var _fire = instance_create_depth(x, y, depth+1, obj_burgFireball);
_fire.var_vspd = _fireVspd*2;
_fire.var_spd = _fireHspd*2;

alarm[10] = 60; //CHECK DIRECTION TO FACE;