// Inherit the parent event
event_inherited();
var_chatbox = 8;
var_chat = "ChatBaddie";
var_event = function(){
	var _trans = instance_create_depth(0, 0, depth, obj_transition2)
	var _100 = checkAllUnlocked(0, 167);
	var _room = _100 ? rm_lobbyEnd : rm_lobby;
	
	_trans.var_room = _room;
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
image_speed = .2;

var_spd = 0;
var_vspd = -5;
var_grav = .2;
var_pool = 0;