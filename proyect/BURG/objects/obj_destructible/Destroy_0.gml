/// @description Particles and Screenshake

//Screenshake
screenshake(.5, 1, .25);

//Particles
var i
for(i = 0; i < 3; i++)
{
	instance_create_depth(x +sprite_width /2, y +sprite_height/2, 1, obj_destructibleShards);
};