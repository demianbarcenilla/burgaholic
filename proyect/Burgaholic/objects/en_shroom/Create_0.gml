// Inherit the parent event
event_inherited();
var_hitSprite = spr_enShroom;
var_idleSprite = spr_enShroom;
action = function(){with(obj_player){var_vspd = -var_jspd*1.8; var_spd = 0; k_jumpCap = true}};
mask_index = var_idleSprite;
t = 0;