// Inherit the parent event
event_inherited();
enum PEPPER_STATE
{
	spawning,
	idle,
	explode,
	hit
};

var_isBoss = true;
var_hitState = PEPPER_STATE.hit;

var_state = PEPPER_STATE.spawning;
var_stateCurrent = var_state;
var_spd = 2;
var_mspd = 2;
var_vspd = 0;

var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .3;
var_canDespawn = false;
var_maxHp = 8;
var_hp = var_maxHp;

var_hitSprite = spr_bossVolHit;
var_idleSprite = spr_bossVolIdle;

var_shake = false;

var_heartPos = 32;

var_hasExploded = false;

action = onHit_backwardsBounceBOSS
mask_index = var_idleSprite;

t = 0;

image_speed = .2;
var_angle = 0;