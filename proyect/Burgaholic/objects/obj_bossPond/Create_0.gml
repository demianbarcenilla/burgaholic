enum GREG_STATE
{
	spawning,
	separating,
	idle
};

var_state = GREG_STATE.spawning;
instance_create_depth(x, y, depth-1, obj_bossPondArmLeft);
instance_create_depth(x, y, depth-1, obj_bossPondArmRight);

if(instance_exists(obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.stunned
	}
};