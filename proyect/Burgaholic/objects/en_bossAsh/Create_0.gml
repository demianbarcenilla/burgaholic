// Inherit the parent event
event_inherited();

var_isBoss = true;
var_hitState = 0;

var_state = 1;
var_stateCurrent = var_state;
var_spd = 0;
var_mspd = -5;
var_vspd = 0;

var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .3;
var_canDespawn = false;
var_maxHp = 1;
var_hp = var_maxHp;

var_hitSprite = spr_bossAsh;
var_idleSprite = spr_bossAsh;

var_shake = false;

var_heartPos = 32;

var_hasExploded = false;

action = onHit_backwardsBounceBOSS

global.specialMusic = false;
image_speed = .1;