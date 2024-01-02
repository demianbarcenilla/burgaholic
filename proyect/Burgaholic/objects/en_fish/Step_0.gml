// You can write your code in this editor

collisionBasic();
if(place_meeting(x+sign(var_spd), y, obj_wall))
{
	var_spd *= -1;
};
var _boat = instance_nearest(x, y, obj_boat)
if(place_meeting(x, y, _boat)) and (_boat.var_spd != 0)
{
	instance_destroy();
	repeat(4){instance_create_depth(depth, x, y, obj_cloudSFX)};
}
image_xscale = sign(var_spd);