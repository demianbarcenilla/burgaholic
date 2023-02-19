image_speed = IMAGE_SPEED;

//STATES
enum STATE_MACHINE
{
	normal,
	wallrun,
	hit,
	pound,
	roll,
	bump,
	dash,
	dead,
};

var_state = STATE_MACHINE.normal
//SPEED
//Horizontal
var_spd = 0;
var_mspd = 2;

var_spdCarry = 0;
var_vspdCarry = 0;

var_fric = .15;

//Vertical
var_vspd = 0;
var_jspd = 6.25;
var_grav = .45;

var_oneWayGrounded = false; //Grounded in a One Way Wall
var_grounded = false;
var_groundCheck = 0;
var_coyoteTime = 6; //Time before you can't jump on air anymore

var_picklesFollowing = 0;

//MISC
roomCooldown = false; //Cooldown for the transitions between rooms
invincibleFrames = false;

//Keys
global.k_left = vk_left;
global.k_right = vk_right;
global.k_up = vk_up;
global.k_down = vk_down;

global.k_jump = ord("Z");
global.k_special = ord("X")

k_dirCap = 0;
k_jumpCap = 0;
mask_index = spr_playerIdle;

maxHp = 3;
hp = maxHp;

var_checkpoint = rm_forest;
var_checkpointX = 136;
var_checkpointY = 208 -64;
t = 0; //for oscilation in the hearts