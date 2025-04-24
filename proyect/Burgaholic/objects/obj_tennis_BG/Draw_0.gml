draw_self();

for(var _i = -max_score; _i < max_score; _i++)
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

if(current_score = -max_score) and (instance_exists(obj_burg_tennis))
{
	with(obj_burg_tennis){var_state = 2};
};

if(current_score = max_score) and (instance_exists(obj_tennis_slime))
{
	with(obj_tennis_slime){var_state = 2};
};