// Inherit the parent event
event_inherited();
var_hitSprite = spr_enCoreStop;
var_idleSprite = spr_enCoreStop;
action = function(){
	with(obj_player)
	{
		var_spd = 0 
		var_vspd = 0; 
		k_jumpCap = true; 
		k_dirCap = true
	};
};
mask_index = var_idleSprite;

image_xscale = bounce_dir;
t = 0;