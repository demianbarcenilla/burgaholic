if(var_state = 0) and (instance_exists(obj_burg_tennis))
{
	dash_cd--;
	
	with (obj_tennis_ball)
	{
		if (other.ball.y > y)
		{
			other.ball = id;
		}
	}

	image_xscale = sign(ball.x - x);
	if (image_xscale == 0) image_xscale = 1;

	if (abs(ball.x - x) - abs(ball.y - y) * 2 > 10 && dash_cd < 0)
	{
		dash_cd = dash_cd_max;
		dash_timer = dash_timer_max;
		var_state = 1;
	}

	x += image_xscale * spd;
}
else if(var_state = 1)
{
	x += image_xscale * dash_spd;
	dash_timer--;
	
	if(dash_timer <= 0)
	{
		var_state = 0;
	}
	
	//collisionBasic();
}

else
{
	var _deadInstance = instance_create_depth(x, y, depth, obj_staticFX)
		_deadInstance.sprite_index = spr_tennisSlimeDead;
		_deadInstance.var_func = function(){room_goto(rm_arcadeTennis)};
	
	instance_destroy();
	
	burg_unlockAndDisplay(77);
	
	if(instance_exists(obj_burg_tennis))
	{
		if(obj_burg_tennis.canUnlock_dashless)
		{
			burg_unlockAndDisplay(78);
		};
		
		if(obj_tennis_BG.canUnlock_flawless)
		{
			burg_unlockAndDisplay(79);
		};
	};
}