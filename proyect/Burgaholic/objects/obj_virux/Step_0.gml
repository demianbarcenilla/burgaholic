//Movement

var _left = keyboard_check_pressed(global.k_left),
	_right = keyboard_check_pressed(global.k_right),
	_moveH = _right - _left;
	
var _up = keyboard_check_pressed(global.k_up),
	_down = keyboard_check_pressed(global.k_down),
	_moveV = _down - _up;

if(!place_meeting(x + _moveH, y, obj_wall))
{
	x += 8 * _moveH;
};

if(!place_meeting(x, y + _moveV, obj_wall))
{
	y += 8 * _moveV;
};

if(abs(_moveH) + abs(_moveV) != 0)
{
	audio_play_sound(sfx_noiseBlip, 1, false)
};

if(place_meeting(x, y, obj_arcadeEnemyTemplate))
{
	room_restart();
};