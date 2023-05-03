// Inherit the parent event
enum STATE
{
	spawning,
	running,
	idle,
	jumping,
};

var_state = STATE.spawning;

event_inherited();
var_hitSprite = spr_enSlimeKingHIT;
var_idleSprite = spr_enSlimeKingRun;
action = function(){with(obj_player){var_spd = -sign(var_spd)*var_mspd*2; var_vspd = -var_jspd; k_dirCap = sign(var_spd); image_xscale = sign(var_spd)}};
mask_index = spr_blank;

var_canDespawn = false;
sprite_index = spr_enSlimeKingShowup;
image_speed = 0;
var_spawned = false;

var_spd = 1.5;
var_vspd = 0;
var_grav = .5;