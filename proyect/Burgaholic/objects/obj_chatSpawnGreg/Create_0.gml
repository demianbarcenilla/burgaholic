// Inherit the parent event
event_inherited();
var_jumping = false;

var_chatbox = 7;
var_chat = "ChatGreg";
var_event = function(){
	bossBarriers();
	var_jumping = true;
	audio_play_sound(sfx_gregLaugh, 10, false)
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