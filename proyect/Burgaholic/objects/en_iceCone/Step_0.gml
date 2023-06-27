// You can write your code in this editor
if(image_index = 0)
{
	y += osc_step(1, .1);
	
	if(instance_exists(obj_player))
	{
		if(obj_player.x >= x-(sprite_width/2)) and (obj_player.x <= x+(sprite_width/2))
		{
			image_index = 1;
		};
	};
}
else
{
	var_spd = var_mspd;
};

if(y>room_height)
{
	instance_destroy();
}
y += var_spd;

// Inherit the parent event
event_inherited();
