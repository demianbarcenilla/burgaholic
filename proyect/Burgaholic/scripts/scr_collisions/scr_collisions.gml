// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_collisions(hspd, vspd){
	//Horizontal Collissions
	if(place_meeting(x+hspd, y, obj_wall))
	{
		while(!place_meeting(x+sign(hspd), y, obj_wall))
		{
			x += sign(hspd);
		};
	
		if(place_meeting(x+sign(hspd), y, obj_wall))
		{
			hspd = 0
		};
	}
	x += hspd;
	//Vertical Collissions
	if(place_meeting(x, y+vspd, obj_wall))
	{
		while(!place_meeting(x, y+sign(vspd), obj_wall))
		{
			y += sign(vspd);
		};
	
		if(place_meeting(x, y+sign(vspd), obj_wall))
		{
			vspd = 0
		};
	}
	y += vspd;
};