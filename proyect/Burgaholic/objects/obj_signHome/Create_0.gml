// Inherit the parent event
event_inherited();
var_chatbox = 11;
var_chat = "ChatHouse"
var_event = function(){ //This is triggered once the chatbox is destroyed
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = 9;
			_chat.var_chat = "ChatHouse_Reply"
			_chat.var_event = function(){}
	};
};
var_action = function(){ //This is triggered once the player interacts with the object
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = var_chatbox
			_chat.var_chat = var_chat
			_chat.var_event = var_event
	};
}
image_speed = IMAGE_SPEED;