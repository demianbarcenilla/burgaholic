var_chatbox = 11
arr_chat[0] = "ChatBurgPixie_Intro"
arr_chat[1] = "ChatBurgPixie_Jump"
arr_chat[2] = "ChatBurgPixie_Bounce"
arr_chat[3] = "ChatBurgPixie_Roll"
arr_chat[4] = "ChatBurgPixie_Dash"
arr_chat[5] = "ChatBurgPixie_Enemies"
arr_chat[6] = "ChatBurgPixie_Finish"

var_action = function(){
	instance_destroy(obj_player);
	if(instance_exists(obj_burgSoul))
	{
		instance_destroy(obj_burgSoul);
	};
	
	var _transition = instance_create_depth(0, 0, depth, obj_transitionFlash);
	_transition.var_room = rm_forestHome;
};