// Inherit the parent event
event_inherited();
enum FISH_STATE
{
	spawning,
	idle,
	jump,
	hit
};

var_isBoss = true;
var_hitState = FISH_STATE.hit;

var_state = FISH_STATE.spawning;
var_stateCurrent = var_state;
var_spd = 0;
var_mspd = -5;
var_vspd = 0;

var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .3;
var_canDespawn = false;
var_maxHp = 5;
var_hp = var_maxHp;

var_hitSprite = spr_bossReeHit;
var_idleSprite = spr_bossRee;

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

image_xscale = -1;
mask_index = var_idleSprite;

t = 0;

image_speed = .2;
var_angle = 0;