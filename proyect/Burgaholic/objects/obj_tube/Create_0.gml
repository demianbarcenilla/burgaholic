/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(!instance_exists(obj_player))
{
var _player = instance_create_depth(obj_tube.x+16, -16, depth, obj_player)
	_player.depth = 50;
	_player.var_state = STATE_MACHINE.tubeOut;
};

	
var_action = function()
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.tubeIn;
		obj_player.x = x;
	};
};