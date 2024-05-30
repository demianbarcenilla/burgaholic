if(var_state = 0)
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
else
{
	x += image_xscale * dash_spd;
	dash_timer--;
	
	if(dash_timer <= 0)
	{
		var_state = 0;
	}
	
	//collisionBasic();
}