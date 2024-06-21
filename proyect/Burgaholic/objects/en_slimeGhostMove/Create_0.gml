event_inherited()

image_speed = IMAGE_SPEED
var_spd = 3;
var_vspd = 0;
var_grav = 0;

action = function(){
	var_state = 1
	with(obj_player)
	{
		var_vspd = -var_jspd*1.2;
	};
}

var_hitSprite = spr_slimeGhostFree;
var_idleSprite = spr_slimeGhostFree;


var_canRespawn = false;
mask_index = spr_slimeGhostFree