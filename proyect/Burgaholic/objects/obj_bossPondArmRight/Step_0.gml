//var_canMove = (obj_bossPond.var_state! = GREG_STATE.spawning)

if(obj_bossPond.var_state = GREG_STATE.spawning)
{
	y = obj_bossPond.y -(obj_bossPond.sprite_height/2)
	var_yStart = y;
}
else if(!defeated)
{
	var_angle += var_angleRate;
	x = var_xStart + lengthdir_x(var_distance, var_angle)
	y = var_yStart + lengthdir_y(var_distance, var_angle)
}
else
{
	image_angle += 10;
	y += 4;
	x -= 3;
	
	if(y > room_width +sprite_height)
	{
		instance_destroy();
	};
};

