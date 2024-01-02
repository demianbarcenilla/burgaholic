image_speed = 0;

var_spd = 0;
var_vspd = 0;
var_fric = .2;

var_newDir = 1;
var_dir = 1;

alarmTime = 5;

var_shake = false;
t = 0;

enum ROCK_STATE
{
	rest,
	shake,
	move
};

var_state = ROCK_STATE.rest;