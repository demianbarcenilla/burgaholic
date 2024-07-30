enum KEY_STATE
{
	still,
	following,
	destroy
}

var_state = KEY_STATE.still;

image_speed = IMAGE_SPEED;

t = 0;

var_touched = false;
var_destroy = false;

delay = 0;
canLerp = false;
pickleNumber = 0;

if(instance_exists(obj_player))
{
	depth = obj_player.depth+1;
};

angle = 90;
angle_rate = 2;
distance = 32;

if(global.stage == stage.special)
{
	sprite_index = spr_keyMini
};

var_sprite = sprite_index