image_speed = .2;

var_xscale = 1;
var_yscale = 1;


changeAnim = function(imageIndex){
	sprite_index = spr_dansMOVE;
	image_speed = 0;
	alarm[0] = 30;
	image_index = imageIndex;
	
	if(imageIndex = 1)
	{
		var_xscale = .6
		var_yscale = 1.4
	}
	else if(imageIndex = 2)
	{
		var_xscale = 1.4
		var_yscale = .6
	}
	else
	{
		var_xscale = 1.2
		var_yscale = .8
	}
	
};
	
//Arrow control
songTimer = 0;
line = 0;

beat = 1.5;
arrowHeight = 64;
canUnlock_perfect = true;

//Create hitboxes
for(i = 0; i < 4; i++)
{	
	var _hitbox = instance_create_depth(160 + (i*20), arrowHeight, depth, obj_dansHitbox)
	_hitbox.arrowType = i;
}

