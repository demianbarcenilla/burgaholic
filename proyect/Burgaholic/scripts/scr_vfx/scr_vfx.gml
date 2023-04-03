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

function pickleFollow()
{
	if(obj_player.var_picklesFollowing <= 2)
	{
		x = lerp(x, obj_player.x -(17 * obj_player.image_xscale)*pickleNumber, .1);
		y = lerp(y, obj_player.y -(obj_player.sprite_height/2), .1);
	}
	else if(obj_player.var_picklesFollowing > 2)
	{
		angle += angle_rate;
		x = obj_player.x + lengthdir_x(distance, angle)
		y = obj_player.y -(obj_player.sprite_height/2) + lengthdir_y(distance, angle)
	}	
}

function bossBarriers()
{
	instance_create_depth(0, room_height-16, depth, obj_barrierBoss);
	instance_create_depth(room_width-16, room_height-16, depth, obj_barrierBoss);
};