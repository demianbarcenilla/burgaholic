if(block_isSolid = false) 
{
	block_isSolid = true
	
	//Create the mask
	var_wallId = instance_create_depth(x, y, depth-1, obj_switchWallMask)
	var_wallId.image_xscale = image_xscale;
	var_wallId.image_yscale = image_yscale;
}
else
{
	block_isSolid = false
	if(instance_exists(var_wallId))
	{
		instance_destroy(var_wallId);
	}
	
}

alarm[0] = 60;