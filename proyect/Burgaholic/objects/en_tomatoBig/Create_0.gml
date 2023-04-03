// Inherit the parent event
event_inherited();
var_hitSprite = spr_enTomatoHIT;
var_idleSprite = spr_enTomatoIdle;

action = function(){with(obj_player){var_vspd = -var_jspd; k_dirCap = sign(var_spd)}};

var_spd = 1;
var_grav = .4;
var_vspd = 0;

var_canRespawn = false;
mask_index = var_idleSprite;