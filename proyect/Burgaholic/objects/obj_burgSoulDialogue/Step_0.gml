if(instance_exists(obj_burgSoul))
{
	if(place_meeting(x, y, obj_player) and (dialogue >= obj_burgSoul.dialogueCounter))
	{
		if(!instance_exists(obj_chat))
		{
			var _chat = instance_create_depth(0, 0, 0, obj_chat)
				_chat.var_chatbox = var_chatbox
				_chat.var_chat = arr_chat[dialogue];
				if(dialogue > 5) {_chat.var_event = var_action};
				
			with(obj_burgSoul)
			{
				dialogueCounter++;
			};
			
			instance_destroy();
		}
	};
}
