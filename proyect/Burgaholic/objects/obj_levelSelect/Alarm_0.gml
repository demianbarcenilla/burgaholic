if(instance_exists(obj_tube))
{
	var _player = instance_create_depth(obj_tube.x+16, -16, depth, obj_player)
	_player.depth = -1;
	_player.var_state = STATE_MACHINE.tubeOut;
};
instance_destroy();