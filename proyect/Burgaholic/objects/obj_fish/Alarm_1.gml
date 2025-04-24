alarm[1] = irandom_range(15, 60);

var _xspawn = 1, _yspawn = 1, _whichSide = choose(0, 1), _fishToSpawn = choose(obj_fishEnemy, obj_fishEnemy2)
var _facing = 1;
switch(_whichSide)
{
	case 0: //Left
		_xspawn = 80;
		_yspawn = irandom_range(64, 144-48);
		_facing = 1;
	break;
	
	case 1: //Right
		_xspawn = 240;
		_yspawn = irandom_range(64, 144-48);
		_facing = -1;
	break;
};
;
var _fish = instance_create_depth(_xspawn, _yspawn, depth, _fishToSpawn)
_fish.var_spd = _facing;
_fish.image_xscale = _facing;