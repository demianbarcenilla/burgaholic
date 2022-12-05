///Player Functions!
function hit_sequence()
{
	//HIT SEQUENCE
	var _enemy = instance_nearest(x, y, obj_enemy);
	if(place_meeting(x, y, _enemy)) and (!_enemy.var_hitSeq)
	{
		if(abs(var_spd) >= var_mspd/2)
		{
			_enemy.action();
			with(_enemy)
			{
				sprite_index = var_hitSprite;
			};
		};
		else
		{
			hp --;
			var_spd = var_mspd * -image_xscale;
			var_vspd = -var_jspd/2;
			var_state = STATE_MACHINE.hit
		};
		_enemy.var_hitSeq = true;
		
		freezeframes(.8)
		screenshake(5, 3, .3);
		
	};
};

function collisions()
{
	//Horizontal Collissions
	if(place_meeting(x+var_spd, y, obj_wall))
	{
		while(!place_meeting(x+sign(var_spd), y, obj_wall))
		{
			x += sign(var_spd);
		};
	
		if(place_meeting(x+sign(var_spd), y, obj_wall))
		{
			var_spd = 0;
		};
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
}