//OSCILATE
y += osc_step(1, .1);

if(place_meeting(x, y, obj_player))
{
	var _transition = instance_create_depth(0, 0, depth, obj_transition)
	_transition.specialRoom = specialRoom;
	instance_destroy();
}