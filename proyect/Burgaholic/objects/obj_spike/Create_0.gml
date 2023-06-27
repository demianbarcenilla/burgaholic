image_speed = 0;

var_subimage = global.stage+2;
image_index = var_subimage;

var_angle = 0;

//ROTATE
if(place_meeting(x+1, y, obj_wall))
{
	var_angle = 90;
}
else if(place_meeting(x-1, y, obj_wall))
{
	var_angle = 270;
}
else if(place_meeting(x, y+1, obj_wall))
{
	var_angle = 0;
}
else if(place_meeting(x, y-1, obj_wall))
{
	var_angle = 180;
}

//ROTATE
if(place_meeting(x+1, y, obj_walkingWall)) or
(place_meeting(x-1, y, obj_walkingWall)) or
(place_meeting(x, y+1, obj_walkingWall)) or
(place_meeting(x, y-1, obj_walkingWall))
{
	var_subimage = 0;
}


if(global.subStage = substage.bonus)
image_index = var_subimage;