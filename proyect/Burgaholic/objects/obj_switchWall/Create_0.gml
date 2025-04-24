alarm[0] = 60;

var_sprite = block_isSolid ? spr_switchWall : spr_switchWall2;

if(block_isSolid = false) 
{
	var_wallId = -1;
}
else
{
	//Create the mask
	var_wallId = instance_create_depth(x, y, depth, obj_switchWallMask)
	var_wallId.image_xscale = image_xscale;
	var_wallId.image_yscale = image_yscale;
}