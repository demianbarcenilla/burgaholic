if(place_meeting(x, y, obj_player))
{
	var _transition = instance_create_depth(0, 0, depth, obj_transition)
	_transition.returning = true;
	instance_destroy()
};