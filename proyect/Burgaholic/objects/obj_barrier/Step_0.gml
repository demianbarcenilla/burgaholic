if(instance_exists(lock))
{
	if(lock.var_breaking)
	{
		if(alarm[1] = -1)
		{
			alarm[1] = var_delay;
		}
	};
};