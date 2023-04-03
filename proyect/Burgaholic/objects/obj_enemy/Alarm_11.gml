untouchable = false;

if(var_canDespawn) //If it previously died, reespawn it with lil clouds
{
	repeat(4)
	{
		instance_create_depth(x, y, depth-1, obj_cloudSFX);
	};
};

//Make it visible again
sprite_index = var_idleSprite;

if(!var_canRespawn)
{
	instance_destroy();
}