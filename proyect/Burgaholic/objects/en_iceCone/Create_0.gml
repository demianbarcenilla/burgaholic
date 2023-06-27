// Inherit the parent event
event_inherited();
var_hitSprite = spr_enIceCone;
var_idleSprite = spr_enIceCone;

mask_index = var_idleSprite;
image_speed = 0;
var_spd = 0;
var_mspd = 5;
t = 0;

action = function(){with(obj_player){var_vspd = -var_jspd*1.3; /*k_dirCap = sign(var_spd)*/}};