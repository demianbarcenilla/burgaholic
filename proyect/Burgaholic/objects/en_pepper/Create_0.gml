// Inherit the parent event
event_inherited();
var_hitSprite = spr_enPepperHIT;
var_idleSprite = spr_enPepperIdle;

t = 0;

action = function()
{
	instance_create_depth(x, y, depth, obj_explosion)
	
	with(obj_player)
	{
		var_vspd = -var_jspd; 
		
		var_mspd = var_spd;
		k_dirCap = sign(var_spd);
		
		obj_player.var_effect = 2;
	}
};
mask_index = var_idleSprite;