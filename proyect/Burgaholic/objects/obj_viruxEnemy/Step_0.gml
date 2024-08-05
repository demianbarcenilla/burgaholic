if(var_move)
{
	if(place_meeting(x + 8*var_dir, y, obj_wall))
	{
		var_dir *= -1;
	};
	
	x += 8*var_dir;
	y += 8;
	var_move = false;
}