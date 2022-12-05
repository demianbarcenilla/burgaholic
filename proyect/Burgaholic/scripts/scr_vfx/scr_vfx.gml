///Player Functions!
function screenshake(time, ammount, fade)
{
	with(obj_control)
	{
		shaking = true;
	
		shakeTime = time;
		shakeAmmount = ammount;
		shakeFade = fade;
	};
};

function freezeframes(time)
{
	var dur = time *100;
	var t = current_time + dur;
	while(current_time < t){}
};

function osc_step(increment, amplitude)
{
	//oscilation
	var _shift;
	
	t = (t + increment) mod 360; //add *_increment* degrees every step, reset at 360
	_shift = -dsin(t) * amplitude;
	return _shift;
};