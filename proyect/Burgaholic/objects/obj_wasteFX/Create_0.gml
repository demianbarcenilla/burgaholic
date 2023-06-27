/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(instance_exists(obj_player))

var_spd = 4*sign(obj_player.var_spd);
image_angle = choose(0, 90, 180, 270);