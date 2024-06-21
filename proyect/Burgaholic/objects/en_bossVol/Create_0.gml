// Inherit the parent event
event_inherited();
enum PEPPER_STATE
{
	spawning,
	idle,
	
	hit
};

var_isBoss = true;
var_hitState = PEPPER_STATE.hit;

var_state = PEPPER_STATE.spawning;
var_stateCurrent = var_state;
var_spd = 1.5;
var_vspd = 0;

var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .3;
var_canDespawn = false;
var_maxHp = 6;
var_hp = var_maxHp;

var_hitSprite = spr_bossVolHit;
var_idleSprite = spr_bossVolIdle;

var_shake = false;

var_heartPos = 32;

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

mask_index = spr_bossVolIdle;

t = 0;