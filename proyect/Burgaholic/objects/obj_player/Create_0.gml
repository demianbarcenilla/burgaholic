image_speed = IMAGE_SPEED;
depth = 350;

if(instance_number(obj_player) > 1)
{
	instance_destroy();
};
//STATES
enum STATE_MACHINE
{
	normal,
	wallrun,
	hit,
	pound,
	roll,
	
	preBounce,
	bounce,
	
	bump,
	dash,
	punch,
	dead,
	
	still, 
	tubeIn,
	tubeOut,
	
	moss,
	
	submarine,
	submarineDash
};

var_state = STATE_MACHINE.normal

var_dir = 0;
//SPEED
//Horizontal
var_spd = 0;
con_mspd = 1.7;
var_mspd = con_mspd;


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

//MISC
roomCooldown = false; //Cooldown for the transitions between rooms
invincibleFrames = false;
var_picklesFollowing = 0;
var_canDMG = false;
var_canPunch = true;

k_dirCap = 0;
k_jumpCap = 0;
k_dirLock = 0;
mask_index = spr_playerIdle;

//The sprite that displays when in the middle of an event (chatting, shopping, cutscene)
var_stillSprite = spr_playerStatic;

maxHp = 3;
hp = maxHp;

var_checkpoint = rm_forest;
var_checkpointX = 136;
var_checkpointY = 208 -64;

var_effect = 0; //Carrying a jellyfish/pepperBoy, etc
var_spriteMod = "";

var_combo = 0; //ammount of enemies you've hit
t = 0; //for oscilation in the hearts

var_redAlpha = 0; //The opacity for the red when you step on magma