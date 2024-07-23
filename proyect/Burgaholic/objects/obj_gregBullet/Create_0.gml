event_inherited();
var_canDespawn = false;
var_hitSprite = spr_bossAsh;
var_idleSprite = spr_gregBullet;

var_spd = 0;
var_vspd = 3;
var_grav = .2;

action = function()
{
	var_vspd = -5;
	var_spd = sign(obj_player.var_spd) * 3
	var_canHit = true;
	with(obj_player)
	{
		var_spd = sign(var_spd)*var_mspd*2; 
		var_vspd = -var_jspd; k_dirCap = sign(var_spd); 
		image_xscale = sign(var_spd);
	};
};

var_canHit = false;

y -= 64