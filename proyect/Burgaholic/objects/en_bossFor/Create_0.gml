// Inherit the parent event
event_inherited();

enum SLIME_STATE
{
	spawning,
	ascent,
	floating,
	charging,
	bouncing,
	stuck,
	
	hit
};

var_isBoss = true;
var_hitState = SLIME_STATE.hit;

var_state = SLIME_STATE.spawning;
var_stateCurrent = var_state;
var_spd = 1.5;
var_vspd = 0;

var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .3;
var_canDespawn = false;
var_maxHp = 10;
var_hp = var_maxHp;

var_hitSprite = spr_bossForHit;
var_idleSprite = spr_bossFor;

var_shake = false;

var_heartPos = 32;

action = onHit_backwardsBounceBOSS;
var_angle = 0;
mask_index = spr_bossFor;

t = 0;