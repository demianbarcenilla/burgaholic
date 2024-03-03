if(instance_exists(obj_player))
{
	x = lerp(x, obj_player.x-(20*obj_player.image_xscale), .2)
	y = lerp(y, obj_player.y - 16, .2) + osc_step(1, 1);
	
	//Face the player
	image_xscale = 1 *sign(obj_player.x - x);
};