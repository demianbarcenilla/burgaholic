// You can write your code in this editor

collisionBasic();
if(place_meeting(x+sign(var_spd), y, obj_wall))
{
	var_spd *= -1;
};

image_xscale = sign(var_spd);
// Inherit the parent event
event_inherited();