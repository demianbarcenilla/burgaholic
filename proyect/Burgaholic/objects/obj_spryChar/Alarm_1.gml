alarm[1] = irandom_range(60, 120);

var _roomHalf = room_width/2
var _xspawn = irandom_range(_roomHalf-32, _roomHalf+32), _yspawn = -32;

instance_create_depth(_xspawn, _yspawn, depth, obj_spryBubble)