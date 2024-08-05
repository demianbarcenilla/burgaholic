var _left = keyboard_check_pressed(global.k_left),
	_right = keyboard_check_pressed(global.k_right),
	_move = _right - _left;

if(!place_meeting(x + _move, y, obj_wall))
{
	x += 8 * _move;
};