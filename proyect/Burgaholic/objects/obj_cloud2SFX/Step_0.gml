x += var_spd;
y += var_vspd;
image_xscale -= .05;
image_yscale -= .05;

if(image_xscale <= 0)
{
	instance_destroy();
};