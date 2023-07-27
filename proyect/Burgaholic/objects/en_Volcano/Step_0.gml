if(sprite_index = spr_enVolcanoSpit)
{
	if(image_index = 4)
	{
		instance_create_depth(x, y-8, depth, obj_fireball)
	}
	
	else if(image_index = image_number)
	{
		sprite_index = var_idleSprite;
	};
};