
image_speed = IMAGE_SPEED;


//STATES
enum STATE_MACHINE
{
	normal,
	wallrun,
	hit,
	pound,
	roll,
	dash
};

var_state = STATE_MACHINE.normal
//SPEED
//Horizontal
var_spd = 0;
var_mspd = 2;

var_fric = .1;

//Vertical
var_vspd = 0;
var_jspd = 6;
var_grav = .4;

//Rooms
roomCooldown = false;

//Keys
global.k_left = vk_left;
global.k_right = vk_right;
global.k_up = vk_up;
global.k_down = vk_down;

global.k_jump = ord("Z");
global.k_special = ord("X")

k_dirCap = 0;
mask_index = spr_playerIdle;

maxHp = 3;
hp = maxHp;

t = 0; //for oscilation in the hearts