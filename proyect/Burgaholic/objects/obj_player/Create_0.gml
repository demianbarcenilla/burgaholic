image_speed = IMAGE_SPEED;
depth = 50;

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
	
	windup,
	bounce,
	
	bump,
	dash,
	punch,
	dead,
	
	still, 
	tubeIn,
	tubeOut,
	
	moss,
	bubble,
	shroomed,
	
	respawn
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

var_canDMG = false;
var_canPunch = true;

k_dirCap = 0;
k_jumpCap = 0;
k_dirLock = 0;

var_time = -1; //NEW ALARMS;
mask_index = spr_playerIdle;

//The sprite that displays when in the middle of an event (chatting, shopping, cutscene)
var_stillSprite = spr_playerStatic;

maxHp = 3;
hp = maxHp;

var_checkpoint = rm_forest;
var_checkpointX = 136;
var_checkpointY = 208 -64;

//FX LIST:
//0 = Normal !! 1 = Jellyfish !! 2 = Pepperboy !! 3 = Fishy !! 4 = Core
var_effect = 0;

var_spriteMod = "";

var_combo = 0; //ammount of enemies you've hit
t = 0; //for oscilation in the hearts

var_redAlpha = 0; //The opacity for the red when you step on magma
var_bubbleTimer = 0;

//TRAIL
var_trailTimer = -1;
var_trailTimerRate = 1;
//PICKLES
arr_pickles = array_create(0)
update_pickles = false;