// Inherit the parent event
event_inherited();

//Only gotta change these 2
var_chatbox = 8;
var_chat = "ShopBaddie"
var_chatFinished = var_chat + "_Finished";
 
var_pool = 142; //Pool starts here
setKeeperChat(); //Sets standard shop/interact event

image_speed = IMAGE_SPEED;

var_altEvent = function(){
	room_goto(rm_lobby2)
	var _trans = instance_create_depth(x, y, depth, obj_transitionFlash)
	_trans.triggerTransition = false;
	
	with(obj_player)
	{
		var_effect = 6;
	};
};
keeperUnlocked(8);