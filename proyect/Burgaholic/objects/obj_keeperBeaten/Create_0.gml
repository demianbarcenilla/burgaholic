image_speed = 0;
image_index = 0;
var_spd = .5;
var_vspd = -1;
var_spdCarry = 0;
var_vspdCarry = 0;
var_grav = .1;

var_chatbox = 0
var_chat = "ChatDakota"
var_event = function(){
	var _trans = instance_create_depth(0, 0, depth, obj_transition2)
	_trans.var_room = rm_lobby;
}
var_sprite = spr_dakotaStanding;