// Inherit the parent event
event_inherited();
var_hitSprite = spr_coreHand;
var_idleSprite = spr_coreHand;
action = function(){with(obj_player){var_vspd = -var_jspd*1.5; var_spd = 0; k_jumpCap = true; k_dirLock = true}};
mask_index = var_idleSprite;
t = 0;