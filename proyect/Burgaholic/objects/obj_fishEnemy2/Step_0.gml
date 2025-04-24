y += osc_step(1, .1)

collisionBasic();

if(place_meeting(x+sign(var_spd), y, obj_wall))
{
	instance_destroy();
};