image_speed = 0;

/*if(global.subStage = substage.bonus)
{
	var_subimage = 0;
}
if(global.stage = stage.pond)
{
	var_subimage = 1;
}
*/

var_subimage = 0;
var_angle = 0;

//ROTATE
if(place_meeting(x, y+1, obj_wall))
{
	var_angle = 0;
}
else if(place_meeting(x, y-1, obj_wall))
{
	var_angle = 180;
}
else if(place_meeting(x+1, y, obj_wall))
{
	var_angle = 90;
}
else if(place_meeting(x-1, y, obj_wall))
{
	var_angle = 270;
}

/*
//ROTATE
if(place_meeting(x+1, y, obj_walkingWall)) or
(place_meeting(x-1, y, obj_walkingWall)) or
(place_meeting(x, y+1, obj_walkingWall)) or
(place_meeting(x, y-1, obj_walkingWall))
{
	var_subimage = 0;
}*/

image_index = var_subimage;
mask_index = spr_spikesHITBOX;