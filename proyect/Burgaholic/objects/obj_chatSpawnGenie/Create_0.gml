// Inherit the parent event
event_inherited();
var_jumping = false;

var_chatbox = 10;
var_chat = "ChatGenie";
var_event = function(){
	var _trans = instance_create_depth(x, y, depth, obj_transitionFlash)
	_trans.var_room = rm_forestEnd;
	
};

var_action = function(){
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = var_chatbox
			_chat.var_chat = var_chat
			_chat.var_event = var_event
	}	
}
var_pool = 0;

t = 0;