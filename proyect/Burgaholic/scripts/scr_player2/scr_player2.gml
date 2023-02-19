///Player Functions!
function hit_sequence()
{
	//HIT SEQUENCE
	var _enemy = instance_nearest(x, y, obj_enemy);
	if(place_meeting(x, y, _enemy)) and (!_enemy.var_hitSeq) and (!_enemy.despawned)
	{
		var _respawnTime = 120;
		
		if(abs(var_spd) >= var_mspd/2)
		{
			_enemy.action();
			with(_enemy)
			{
				sprite_index = spr_blank;
				repeat(4)
				{
					instance_create_depth(x, y, depth+1, obj_cloudSFX);
				};
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
		if(_enemy.alarm[11] = -1){_enemy.alarm[11] = _respawnTime};
		
		freezeframes(.8)
		screenshake(5, 3, .3);
		
	};
};

function collisions()
{
	var _spd = var_spd + var_spdCarry;
	
	if(var_spdCarry != 0)
	{
		var_spdCarry = 0
	};
		
	var _vspd = var_vspd + var_vspdCarry;
	if(var_vspdCarry != 0)
	{
		var_vspdCarry = 0
	};
	
	//Horizontal Collissions
	if(place_meeting(x+_spd, y, obj_wall))
	{
		while(!place_meeting(x+sign(_spd), y, obj_wall))
		{
			x += sign(_spd);
		};
	
		if(place_meeting(x+sign(_spd), y, obj_wall))
		{
			_spd = 0;
		};
	}
	
	x += _spd;
	
	//Vertical Collissions

	if(place_meeting(x, y+_vspd, obj_wall))
	{
		while(!place_meeting(x, y+sign(_vspd), obj_wall))
		{
			y += sign(_vspd);
		};
	
		if(place_meeting(x, y+sign(_vspd), obj_wall))
		{
			_vspd = 0
		};
	};
	
	//one way platform collisions
	if(instance_exists(obj_oneWay))
	{
	    if(y < instance_nearest(x, y+1, obj_oneWay))
	    {
	        if(!place_meeting(x, y, obj_oneWay)) and (_vspd > 0)
	        {
	            if(place_meeting(x, y+_vspd, obj_oneWay))
	            {
	                while(!place_meeting(x, y+sign(_vspd), obj_oneWay))
	                {
	                    y += sign(_vspd);
	                };
	                _vspd = 0;
	            };
	        };
	    };
	};
	
	y += _vspd;
};