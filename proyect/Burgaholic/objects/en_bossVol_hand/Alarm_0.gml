var_state = 3;
var _dir = point_direction(x, y, obj_player.x, obj_player.y),
	_xdir = lengthdir_x(5, _dir),
	_ydir = lengthdir_y(5, _dir);

var_spd = _xdir;
var_vspd = _ydir;