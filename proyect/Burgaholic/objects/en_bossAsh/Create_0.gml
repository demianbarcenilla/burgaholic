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

action = function()
{
	repeat(5){instance_create_depth(x, y-32, depth, obj_wasteFX)};
	with(obj_player)
	{
		var_spd = -sign(var_spd)*var_mspd*2; 
		var_vspd = -var_jspd; k_dirCap = sign(var_spd); 
		image_xscale = sign(var_spd);
		var_effect = 0;
	};
};

global.specialMusic = false;
image_speed = .1;