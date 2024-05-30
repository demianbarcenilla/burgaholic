if (place_meeting(x + xdir * xspd, y, obj_tennis_wall))
{
	while(!place_meeting(x + sign(xdir * xspd), y, obj_tennis_wall))
	{
		x += sign(sign(xdir * xspd));
	}
	xdir *= -1;
}
else
{
	x += xdir * xspd;
}
if (place_meeting(x, y + ydir * yspd, obj_tennis_wall))
{
	while(!place_meeting(x, y + ydir, obj_tennis_wall))
	{
		y += ydir;
	}
	
	if (ydir > 0)
	{
		obj_tennis_BG.current_score --;
	}
	else
	{
		obj_tennis_BG.current_score ++;
	}
	
	ydir *= -1;
}
else
{
	y += ydir * yspd;
}

if (place_meeting(x - obj_burg_tennis.image_xscale * 6, y + 5, obj_burg_tennis))
{
	xspd = random_range(xmin_spd, xmax_spd);
	yspd = min(yspd + .1, ymax_spd)
	ydir = -1;
	xdir = obj_burg_tennis.image_xscale;
}
if (place_meeting(x - obj_tennis_slime.image_xscale * 6, y + 5, obj_tennis_slime))
{
	xspd = random_range(xmin_spd, xmax_spd);
	yspd = min(yspd + .1, ymax_spd)
	ydir = 1;
	xdir = choose(-1, 1);
}

shadow.x = x;
shadow.y = y + sin(current_time * .005) * 6 + 6;