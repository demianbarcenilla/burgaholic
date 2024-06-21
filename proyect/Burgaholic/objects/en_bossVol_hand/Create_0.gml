//Shake FX
event_inherited();

var_shake = true;

var_canRespawn = false;

var_ = true;
var_state = 0;

var_state = 0;
var_spd = 1;
var_vspd = 1;
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

var_idleSprite = spr_bossVolHandPunch;
mask_index = var_idleSprite;