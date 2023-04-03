// You can write your code in this editor
if(!place_meeting(x, y+1, obj_wall))
{
	var_vspd += var_grav;
}
//Horizontal Collissions
if(place_meeting(x+var_spd, y, obj_wall))
{
	while(!place_meeting(x+sign(var_spd), y, obj_wall))
	{
		x += sign(var_spd);
	};
	
	if(place_meeting(x+sign(var_spd), y, obj_wall))
	{
		var_spd = -var_spd;
	};
}

else if(!place_meeting(x+(sprite_width/2), y+1, obj_wall))
{
	var_spd = -var_spd;
}

x += var_spd;

//Vertical Collissions
if(place_meeting(x, y+var_vspd, obj_wall))
{
	while(!place_meeting(x, y+sign(var_vspd), obj_wall))
	{
		y += sign(var_vspd);
	};
	
	if(place_meeting(x, y+sign(var_vspd), obj_wall))
	{
		var_vspd = 0
	};
}
y += var_vspd;

image_xscale = sign(var_spd);

if(place_meeting(x, y, obj_player))
{
	instance_destroy();
	if(obj_player.var_effect = 1)
	{
		instance_create_depth(x, y, depth, obj_discardedCrab)
	};
	obj_player.var_effect = 1;
};