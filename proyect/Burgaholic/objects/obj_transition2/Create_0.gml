image_speed = IMAGE_SPEED;
var_room = rm_forest;

var_action = function(){
	instance_destroy(obj_player);
	room_goto(var_room)
	global.specialMusic = false;
};

global.specialMusic = true;
global.music = mus_silence;