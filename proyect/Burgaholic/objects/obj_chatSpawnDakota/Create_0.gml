// Inherit the parent event
event_inherited();
var_chatbox = 0;
var_chat = "PrevShopDakota"
ini_open("data.ini")
	var worldsFinished = ini_read_real("Stages", "Total", 0)
ini_close()

//Worlds Finished
switch(worldsFinished)
{
	case 1: var_chatFinished = "ShopDakota_W1finished"
	break;
	case 2: var_chatFinished = "ShopDakota_W2finished"
	break;
	case 3: var_chatFinished = "ShopDakota_W3finished"
	break;
	case 4: var_chatFinished = "ShopDakota_W4finished"
	break;
	case 5: var_chatFinished = "ShopDakota_W5finished"
	break;
	case 6: var_chatFinished = "ShopDakota_W6finished"
	break;
	case 7: var_chatFinished = "ShopDakota_W7finished"
	break;
	case 8: var_chatFinished = "ShopDakota_W8finished"
	break;
	default: var_chatFinished = "ShopDakota_finished"
	break;
}

var_event = function(){ //This is triggered once the chatbox is destroyed
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = var_chatbox
			_chat.var_chat = "ShopDakota"
			_chat.var_event = function(){instance_create_depth(x, y, depth, obj_shop)}
			obj_chatSpawnDakota.var_talkingAgain = true;
	};
};
var_talkingAgain = false;

var_action = function(){ //This is triggered once the player interacts with the object
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = var_chatbox
			_chat.var_chat = var_chat
			_chat.var_event = var_event
	};
}
var_pool = 2;
image_speed = IMAGE_SPEED;