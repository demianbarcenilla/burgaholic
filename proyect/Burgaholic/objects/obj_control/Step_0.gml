if(instance_exists(obj_player))
{
	x = obj_player.x
	y = obj_player.y
};

if(shaking)
{

	shakeTime--;
	var xx = choose(-shakeAmmount, shakeAmmount);
	var yy = choose(-shakeAmmount, shakeAmmount);
	camera_set_view_pos(
		view_camera[0], 
		camera_get_view_x(view_camera[0]) +xx,
		camera_get_view_y(view_camera[0]) +yy
	);
	
	if(shakeTime <= 0)
	{
		shaking = false;
		shakeTime = 0;
		shakeAmmount = 0;
		shakeFade = 0;
	};
};
else
{
	camera_set_view_pos(
		view_camera[0], 
		clamp(x-(camera_get_view_width(view_camera[0])/2), 0, room_width-camera_get_view_width(view_camera[0])), 
		clamp(y-(camera_get_view_height(view_camera[0])/2), 0, room_height-camera_get_view_height(view_camera[0]))
	);
}

//PARALLAX
var _x = camera_get_view_x(view_camera[0]);
layer_x(layer_get_id("P_DEEPEST"), _x);
layer_x(layer_get_id("P_BACKGROUND"), _x /1.1);
layer_x(layer_get_id("P_MIDDLE"), _x/1.2);
layer_x(layer_get_id("P_FOREGROUND"), _x /1.5);

global.music = arr_music[global.stage]
if(!audio_is_playing(global.music))
{
	audio_stop_all();
	audio_play_sound(global.music, 0, true)
};