if(size_decrease)
{
	if(image_xscale <= 0)
	{
		instance_destroy();
	};
	
	image_xscale -= .1;
	image_yscale -= .1;
}