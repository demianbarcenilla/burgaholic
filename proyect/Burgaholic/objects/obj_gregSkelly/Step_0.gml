if(instance_exists(obj_player) and (instance_exists(obj_tube)))
{
	if(place_meeting(obj_player.x, obj_player.y +1, obj_wall))
	{
		if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
		{
			var _chat = instance_create_depth(0, 0, 0, obj_chat)
				_chat.var_chatbox = var_chatbox
				_chat.var_chat = var_chat
				_chat.var_event = var_event
				
			instance_destroy(obj_tube);
		}	
	}
};