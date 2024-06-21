if(place_meeting(x, y, obj_player))
{
	obj_player.var_checkpoint = room;
	obj_player.var_checkpointX = x;
	obj_player.var_checkpointY = y;
	
	if(sprite_index != spr_checkpointUp)
	{
		with(obj_pickle)
		{
			if(var_state = PICKLE_STATE.following)
			{
				var_state = PICKLE_STATE.destroy
			};
		}
	}
};

if(instance_exists(obj_player))
{
	if(obj_player.var_checkpoint = room)
	{
		sprite_index = spr_checkpointUp
	}
	else
	{
		sprite_index = spr_checkpoint;
	};
};