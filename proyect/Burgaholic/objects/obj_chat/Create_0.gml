var_chat = "ChatGreg"
var_chatbox = 7;

var_event = function(){};
arr_dialogue[0] = "";

dialogue_current = 0;

if(instance_exists(obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.still;
	};
}
alarm[0] = 1