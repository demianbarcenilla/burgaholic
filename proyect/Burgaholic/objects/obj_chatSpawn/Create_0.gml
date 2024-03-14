// Inherit the parent event
event_inherited();

var_action = function(){
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = var_chatbox
			_chat.var_chat = var_chat
			_chat.var_event = var_event
	}	
}
image_speed = IMAGE_SPEED;
var_pool = 0;