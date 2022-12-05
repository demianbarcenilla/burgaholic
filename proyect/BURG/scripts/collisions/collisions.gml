/// @function		solid_collide(_hspd, _vspd, _solid)
/// @description	collide with walls

function solid_collide(_hspd, _vspd, _solid)
{	
	//horizontal
	round(x);
	
	if(place_meeting(x +_hspd, y, _solid))	
	{
		while(!place_meeting(x +sign(_hspd), y, _solid))
		{
			x += sign(_hspd)
		};
		_hspd = 0;
	};
	
	x += _hspd;
	
	//vertical
	round(y);
	
	if(place_meeting(x, y +_vspd, _solid))	
	{
		while(!place_meeting(x, y +sign(_vspd), _solid))
		{
			y += sign(_vspd)
		};
		_vspd = 0;
	};
	
	y += _vspd;
};	