isShooting = true;
alarm[3] = 30;

var _leftWaste = instance_create_depth(x-64, y-sprite_height, depth+1, obj_gregWaste)
_leftWaste.var_left = true;
instance_create_depth(x+64, y-sprite_height, depth+1, obj_gregWaste)