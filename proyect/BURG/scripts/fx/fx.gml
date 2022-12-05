// @func screenshake(time, ammount, fade)

function screenshake(time, ammount, fade){
	with(obj_camera)
	{
		var_shakeEnabled = true;
		var_shakeTime = time;
		var_shakeAmmount = ammount;
		var_shakeFade = fade;
	};
}
function freezeFrame(dur)
{
	var __curTime = current_time;
	while current_time-__curTime < dur {};
}

function set_music(music){
	global.musPrev = global.musCurrent
	global.musCurrent = music
};