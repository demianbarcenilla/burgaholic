alarm[1] = irandom_range(60, 120);

var _xspawn = 1, _yspawn = 1, _topSide = irandom_range(0, 3);

switch(_topSide)
{
	case 0: //Top
		_xspawn = irandom_range(80, 240);
		_yspawn = 16;
	break;
	
	case 1: //Bottom
		_xspawn = irandom_range(80, 240);
		_yspawn = 144;
	break;
	
	case 2: //Left
		_xspawn = 80;
		_yspawn = irandom_range(16, 144);
	break;
	
	case 3: //Right
		_xspawn = 240;
		_yspawn = irandom_range(16, 144);
	break;
};

instance_create_depth(_xspawn, _yspawn, depth, obj_bumbEnemy)