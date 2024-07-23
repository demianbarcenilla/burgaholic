

switch(var_state)
{
	case 0:
		var_shake = true;
		
		if(!instance_exists(obj_notebook))
		{
			instance_create_depth(x, y, depth+1, obj_notebook)
		};
		stepAlarm(0, 60);
	break;
	
	case 1:
	//BOUNCE AROUND
		var_vspd += var_grav;
		y += var_vspd;
		
		if(y > room_height+16)
		{
			var_state = 2;
		}
	break;
	
	case 2:
		if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
		{
			var _chat = instance_create_depth(0, 0, 0, obj_chat)
				_chat.var_chatbox = var_chatbox
				_chat.var_chat = var_chat
				_chat.var_event = var_event
		}
	break;
	case 3:
		y +=1
		
		if(y > room_height+64)
		instance_destroy();
	break;
};
