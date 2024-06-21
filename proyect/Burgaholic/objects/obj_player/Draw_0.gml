var _alarmTime = 90;

if(global.stage = stage.volcano)
{
	//Draws your sprite, in red
	gpu_set_fog(true, $5310FF, 0, 10)
		draw_self();
	gpu_set_fog(false, c_white, 0, 10)
	
	if(place_meeting(x, y+1, obj_magma))
	{
		if (var_state != STATE_MACHINE.hit) and
		(var_state != STATE_MACHINE.dead) and
		(!invincibleFrames)
		{
		
		
			var_redAlpha -= 1/_alarmTime;
			if(alarm[7] = -1)
			{
				alarm[7] = _alarmTime;
			};
		};
	}
	else
	{
		var_redAlpha = image_alpha;
		alarm[7] = -1;
	}

	/*This is the sprite you ACTUALLY see.
	Whenever you step in magma, the opacity of this visible sprite decreases
	This makes it so you increasingly see the red sprite that's behind you all the time.
	This makes it look as if you're turning red from the fire, even though you're actually becoming invisible*/

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, var_redAlpha)


	//Enableing this lets you see the hitbox
	//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 0)
}

else
{
	draw_self();
}

for(i = 0 ; i < array_length(arr_pickles) ; i++)
{
	show_debug_message(string(arr_pickles[i]))
}
/*
for(i = 0 ; i < array_length(arr_pickles) ; i++)
{
	draw_text_outlined(x, y-(8*i), string(arr_pickles[i]))
}
