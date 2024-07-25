// Inherit the parent event
event_inherited();

//Only gotta change these 2
var_chatbox = 8;
var_chat = "ShopBaddie_Extra2"
setKeeperChat(); //Sets standard shop/interact event

image_speed = IMAGE_SPEED;

var_event = function(){
	room_goto(rm_lobby)
	
	var _trans = instance_create_depth(x, y, depth, obj_transitionFlash)
	_trans.triggerTransition = false;
	
	with(obj_player)
	{
		var_effect = 0;
	};
};

image_speed = .2;