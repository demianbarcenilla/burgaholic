// Inherit the parent event
event_inherited();
var_hitSprite = spr_enVolcano;
var_idleSprite = spr_enVolcano;

var_canDespawn = false;
mask_index = var_idleSprite;
action = function(){with(obj_player){var_spd = -sign(var_spd)*var_mspd}};
var_spitTime = 120;
alarm[0] = 1;