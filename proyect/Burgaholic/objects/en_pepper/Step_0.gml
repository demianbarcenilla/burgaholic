// You can write your code in this editor
y += osc_step(1, .1);

// Inherit the parent event
event_inherited();

if(place_meeting(x, y, obj_player))
{
	if(obj_player.var_canDMG)
	{
		instance_create_depth(x, y, depth, obj_explosion)
	};
};