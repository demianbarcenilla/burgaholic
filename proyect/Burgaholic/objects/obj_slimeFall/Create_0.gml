/// @description Insert description here

// Inherit the parent event
event_inherited();

var_spd = 2;
var_vspd = random_range(-3, -8);
var_grav = .4;
image_speed = 0;
image_index = irandom_range(0, 2);

var_canRespawn = false;

action = function(){
	with(obj_player){var_vspd = -var_jspd*1.3};
};