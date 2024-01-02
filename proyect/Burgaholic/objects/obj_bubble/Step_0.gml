if(place_meeting(bbox_left, y, obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.bubble;
		var_spd = var_mspd*2;
		var_vspd = 0;
	};
	obj_player.y = y;
	
	instance_destroy();
};

else if(place_meeting(bbox_right, y, obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.bubble;
		var_spd = -var_mspd*2;
		var_vspd = 0;
	};
	obj_player.y = y;
	
	instance_destroy();
};

else if(place_meeting(x, bbox_bottom, obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.bubble;
		var_spd = 0;
		var_vspd = -var_mspd*2;
	};
	obj_player.y = y;
	
	instance_destroy();
};

else if(place_meeting(x, bbox_top, obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.bubble;
		var_spd = 0;
		var_vspd = var_mspd*2;
	};
	obj_player.y = y;
	
	instance_destroy();
};

if(round(y) > ins_parent.y -3) and (round(y) < ins_parent.y +3)
{
	var_static = true;
}
else if(!var_static)
{
	y = lerp(y, ins_parent.y, .05);
};

if(var_static)
{
	y += osc_step(1, .1);
};