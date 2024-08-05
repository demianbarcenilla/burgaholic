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
		camera_get_view_y(view_camera[0]) //+yy
	);
	
	if(shakeTime <= 0)
	{
		shaking = false;
		shakeTime = 0;
		shakeAmmount = 0;
		shakeFade = 0;
	};
}
else{
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

//MUSIC CONTROL
if(!global.specialMusic)
{
	var _trackSubstage = "", _track = "";
	switch(global.subStage) //Check if you're in the main zones or shops/bonus/boss/lobby
	{
		case substage.normal:
			_trackSubstage = "";
		break;
	
		case substage.boss:
			_trackSubstage = "b";
		break;
	
		case substage.bonus:
			_trackSubstage = "s";
		break;
	}
	_track = "mus_" + string(global.stage) + _trackSubstage
	
	//Play the track
	global.music = asset_get_index(_track)
};

//If the music isn't playing, play it
if(!instance_exists(obj_levelSelect))
{
	if(!audio_is_playing(global.music))// and (!instance_exists(obj_pause))
	{
		audio_group_stop_all(ag_music);
		audio_play_sound(global.music, 0, true);
	};
};

//TIMER
ini_open("data.ini");
	var _globalFinished = (ini_read_real("stages", "total", 0) >= 8),
		_100Finished = (ini_read_real("stages", "total", 0) = 9);
ini_close();
	
if(var_runTimeGlobal) and (!_globalFinished)
{
	var_timeGlobal += delta_time / 1000000;	
};

if(var_runTimeGlobal) and (!_100Finished)
{
	var_time100 += delta_time / 1000000;	
}; 

if(var_runTimeCurStage)
{
	var_timeCurStage += delta_time / 1000000;	
};