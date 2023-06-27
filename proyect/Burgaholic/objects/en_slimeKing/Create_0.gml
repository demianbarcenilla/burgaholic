// Inherit the parent event
event_inherited();

enum SLIME_STATE
{
	spawning,
	running,
	idle,
	jumping,
	hit
};

var_isBoss = true;
var_hitState = SLIME_STATE.hit;

var_state = SLIME_STATE.spawning;
var_stateCurrent = var_state;
var_spd = 1.5;
var_vspd = 0;
var_jspd = 8;

var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .3;
var_canDespawn = false;
var_maxHp = 10
var_hp = 10;

var_hitSprite = spr_enSlimeKingHIT;
var_idleSprite = spr_enSlimeKingRun;

var_heartPos = 32;
action = function()
{
	repeat(5){instance_create_depth(x, y-32, depth, obj_wasteFX)};
	with(obj_player)
	{
		var_spd = -sign(var_spd)*var_mspd*2; 
		var_vspd = -var_jspd; k_dirCap = sign(var_spd); 
		image_xscale = sign(var_spd);
	};
	
	
	ini_open("data.ini")
		if(ini_read_real("Stages","Forest", false))
		{
			ini_write_real("Stages","Forest", true)
			ini_write_real("Stages","Total", 1)
		};
	ini_close();
	
};

mask_index = spr_enSlimeKingIdle;