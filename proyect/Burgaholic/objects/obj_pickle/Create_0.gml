image_speed = IMAGE_SPEED;

t = 0;

var_touched = false;
var_destroy = false;

delay = 0;
canLerp = false;
pickleNumber = 0;

if(instance_exists(obj_player))
{
	if(depth <= obj_player.depth)
	{
		depth = 30;
	}
};

angle = 90;
angle_rate = 2;
distance = 32;

ini_open("data.ini");
	var_pickleUnlocked = ini_read_real("PicklesUnlocked", id, false)
ini_close();

if(var_pickleUnlocked)
{
	sprite_index = spr_pickleGhost
};