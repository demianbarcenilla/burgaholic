/// @description Animate
// Hit secuence
if(!var_canGetHit)
{
	sprite_index = var_hitSpr;
	draw_self();
}
else
{
	if(image_index >= image_number-1)
	{
		sprite_index = var_idleSpr;
	};
	
	draw_self();
};

if(var_hitSecuence = true)
{
	var_canGetHit = false;
	if(alarm[0] = -1) {alarm[0] = 5; image_index = 0};
	//Flash
	gpu_set_fog(true, WHITE, 0, 0)
		draw_self();
	gpu_set_fog(false, c_white, 0, 0)
};

if(place_meeting(x, y, obj_player))
{
	with(obj_player)
	{
		if(var_state = STATE_MACHINE.damage)
		{
			var_justBounced = true;
			var_hspd = -var_hspd;
			alarm[2] = 15;
		};
	};
};