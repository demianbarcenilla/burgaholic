// Inherit the parent event
event_inherited();
var_hitSprite = spr_enCoreHand2;
var_idleSprite = spr_enCoreHand2;
action = function(){
	obj_player.var_spd = obj_player.var_mspd*4*bounce_dir;
	
	with(obj_player)
	{
		var_vspd = -var_jspd; 
		k_jumpCap = true; 
		k_dirCap = true
	};
};
mask_index = var_idleSprite;

image_xscale = bounce_dir;
t = 0;