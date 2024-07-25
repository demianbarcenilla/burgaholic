image_speed = 0;
image_index = global.stage;

var_chatbox = 8;
var_sprite = spr_marcusBeaten;
var_chat = "PrevChatBaddie"
var_spd = 0;
var_vspd = 0;
var_grav = .2;

var_encounter = 0;

alarm[0] = 1;
global.specialMusic = true;
global.music = mus_silence;

audio_stop_all();

//This is triggered once the chatbox is destroyed
arr_pose[0] = spr_marcusMove2;
arr_pose[1] = spr_marcusMove3;

var_event = function(){
	var _marcus = instance_create_depth(x, y, depth, obj_marcus);
	_marcus.sprite_index = arr_pose[var_encounter]
	_marcus.var_encounter = var_encounter;
	
	instance_destroy();
};

var_action = function() //This is triggered once you interact with the character
{
	if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
	{
		var _chat = instance_create_depth(0, 0, 0, obj_chat)
			_chat.var_chatbox = var_chatbox
			_chat.var_chat = var_chat
			_chat.var_event = var_event
	}	
}
global.specialMusic = true;
global.music = mus_silence;