event_inherited()

var_state = 0;
action = function(){
	var_state = 1
	with(obj_player)
	{
		var_vspd = -var_jspd*1.2;
	};
}

var_hitSprite = spr_slimeGhostFree;
var_idleSprite = spr_slimeGhost;

var_shake = false;

mask_index = var_idleSprite;

var_spd = 3;
var_vspd = 0;
var_grav = .2;

alarmTime = 30;

t = 0;
inc = 1;
ampl = .2;