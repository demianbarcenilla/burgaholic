// Inherit the parent event
event_inherited();
var_hitSprite = spr_enJumpHIT;
var_idleSprite = spr_enWalkIdle;

action = function(){with(obj_player){var_vspd = -var_jspd; k_dirCap = sign(var_spd)}};

var_spd = .5;
var_grav = .4;
var_vspd = 0;

mask_index = var_idleSprite;