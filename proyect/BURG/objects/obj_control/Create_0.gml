/// @description Setup

//Macros
#macro RED $4C2ABF
#macro ORANGE $3A96FF
#macro YELLOW $2BCAFF
#macro GREEN $51B331
#macro LIGHT_BLUE $D3D388
#macro BLUE $75E060
#macro PURPLE $784974
#macro WHITE $E4F3E2
#macro IMAGE_SPEED 0.3

//Next 
if(room = rm_startup)
{
	room_goto_next();
};

//Variables
global.frameSkip = 1;

//Input
ini_open("settings/config.ini"); //Open input config
	global.upKey = ini_read_real("input", "up", ord("W"));
	global.leftKey = ini_read_real("input", "left", ord("A"));
	global.downKey = ini_read_real("input", "down", ord("S"));
	global.rightKey = ini_read_real("input", "right", ord("D"));
	
	global.jumpKey = ini_read_real("input", "jump", vk_space);
	global.actionKey = ini_read_real("input", "action", ord("O"));
ini_close();

//Create Camera
if(!instance_exists(obj_camera))
{
	instance_create_depth(x, y, -128, obj_camera);
};

global.rmNext = rm_test2;
global.rmPrev = -1;