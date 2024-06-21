if(instance_exists(obj_player))
{
	if(obj_player.x > room_width/2)
	{
		instance_create_depth(xx, yy, -100, var_boss);
		bossBarriers();
		instance_destroy();
	};
};