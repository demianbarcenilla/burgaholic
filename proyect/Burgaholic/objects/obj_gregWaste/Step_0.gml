y -= 5;

if(y < -32)
{
	instance_destroy();
	
	repeat(3)
	{
		instance_create_depth(irandom_range(0, room_width), y, depth, obj_gregRain)
	};
	
	if(var_left)
	{
		instance_create_depth(irandom_range(0, room_width/2), y, depth, obj_gregBullet)
	}
	
	else
	{
		instance_create_depth(irandom_range(room_width/2, room_width), y, depth, obj_gregBullet)
	}
};