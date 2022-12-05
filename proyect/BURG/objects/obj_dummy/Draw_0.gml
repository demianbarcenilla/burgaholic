/// @description Animate
// Hit secuence
if(var_hitSecuence = true)
{
	var_canGetHit = false;
	if(alarm[0] = -1) {alarm[0] = 5; image_index = 0};
	//Flash
	sprite_index = var_hitSpr;
	gpu_set_fog(true, WHITE, 0, 0)
		draw_self();
	gpu_set_fog(false, c_white, 0, 0)
};

else
{
	if(image_index >= image_number-1)
	{
		sprite_index = var_idleSpr;
	};
	
	draw_self();
};