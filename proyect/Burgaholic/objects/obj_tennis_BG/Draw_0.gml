draw_self();
for(var _i = -5; _i < 5; _i++)
{
	var _x = room_width * .5 + _i * 12;
	var _y = room_height * .5 - 20;
	
	if (current_score <= _i && _i < 0)
	{
		draw_sprite(spr_tennisScore, 2, _x, _y);
	}
	else if (current_score - 1 >= _i && _i >= 0)
	{
		draw_sprite(spr_tennisScore, 1, _x, _y);
	}
	else
	{
		draw_sprite(spr_tennisScore, 0, _x, _y);
	}
}