if(instance_exists(obj_player)) and (var_canPickKey)
{
	if(place_meeting(x -(8*sign(obj_player.var_spd)), y, obj_player))
	{
		
		var _pickleAmmount = array_length(obj_player.arr_pickles)
		
		for(i = 0; i < _pickleAmmount; i++)
		{
			var _toCheck = obj_player.arr_pickles[i]
			
			if(_toCheck.object_index == obj_key)
			{
				with(obj_player.arr_pickles[i])
				{
					if(var_state = KEY_STATE.following)
					{
						var_state = KEY_STATE.destroy;
					}
				}
				
				var_canPickKey = false;
				break;
			}
		}
	}
};