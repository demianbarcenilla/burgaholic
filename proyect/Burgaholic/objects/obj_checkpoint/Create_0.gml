image_index = 0;
image_speed = IMAGE_SPEED;

if(instance_exists(obj_player))
{
	depth = obj_player.depth +1;
}

var_sprite = spr_checkpoint;
var_spriteUp = spr_checkpointUp;
	
if(mini)
{
	var_sprite = spr_checkpointMini;
	var_spriteUp = spr_checkpointUpMini;
};