// Inherit the parent event
event_inherited();
var_hitSprite = spr_enPepperHIT;
var_idleSprite = spr_enPepperIdle;

t = 0;

action = function(){with(obj_player){var_vspd = -var_jspd; var_spd = sign(var_spd)*var_mspd*5;k_dirCap = sign(var_spd)}};
mask_index = var_idleSprite;