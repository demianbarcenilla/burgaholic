var_vspd += .15;

collisionBasic();

if(place_meeting(x+sign(var_spd), y, obj_wall))
{
	instance_destroy();
};

if(place_meeting(x, y+1, obj_wall))
{
	image_speed = IMAGE_SPEED;
	var_vspd = 0;
}
else
{
	image_speed = 0; //JUMPING ANIM
	image_index = 3;
}