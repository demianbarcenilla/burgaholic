///Player Functions!
function hit_sequence()
{
	//HIT SEQUENCE
	
	var _enemy = instance_nearest(x, y, obj_enemy), _respawnTime = 15; //The enemy we're hitting and the time it'll take for it to allow us to hit it again
	
	//You find the enemy, and they're completely visible and available to hit
	if(place_meeting(x, y, _enemy)) and (!_enemy.untouchable)
	{
		//abs(var_spd) >= var_mspd/2
		if(var_canDMG) //CASE 1: You're Going at Damaging Speed
		{
			if(_enemy.var_canDespawn) //If the enemy CAN be killed
			{
				with(_enemy)
				{
					repeat(4) //Create some clouds when the enemy dissapears
					{
						instance_create_depth(x, y, depth+1, obj_cloudSFX);
					};
					
					sprite_index = spr_blank; //Make it actually dissapear. Maybe change it to a resting sprite later?
					_respawnTime = 120; //Make respawn time longer
				};
			}
			else //If it can't despawn, make it look hit, at least.
			{
				if(_enemy.var_isBoss)
				{
					with(_enemy)
					{
						var_hp --;
						var_state = var_hitState;
					};
				}
			};
			
			_enemy.untouchable = true; //If the enemy was hit, it cannot be hit until this resets trough alarm[11]
			if(_enemy.alarm[11] = -1) and (_enemy.var_canRespawn){_enemy.alarm[11] = _respawnTime}; //Reenables the enemy's hitbox
			playHit();
			
			if(var_state = STATE_MACHINE.punch)
			{
				var_state = STATE_MACHINE.normal
			};
			
			if(var_state = STATE_MACHINE.roll)
			{
				var_state = STATE_MACHINE.dash;
			};
			var_canPunch = true;
			
			_enemy.action(); //All enemies have interactions. Execute it
		}
		else //CASE 2: You don't have enough speed. You're getting hurt.
		{
			if(!invincibleFrames)
			{
				hitSetup(); //And so, the player gets sent to hit state
				audio_play_sound(sfx_hitSelf, 0, 0)
			};
		};
		
		//Visual effects after contact
		if(!invincibleFrames)
		{
			freezeframes(.8);
			screenshake(5, 3, .3);
		};
	};
};

function hit_sequence_old()
{
	//HIT SEQUENCE
	
	var _enemy = instance_nearest(x, y, obj_enemy), _respawnTime = 15; //The enemy we're hitting and the time it'll take for it to allow us to hit it again
	
	//You find the enemy, and they're completely visible and available to hit
	if(place_meeting(x, y, _enemy)) and (!_enemy.untouchable)
	{
		//abs(var_spd) >= var_mspd/2
		if(var_canDMG) //CASE 1: You're Going at Damaging Speed
		{
			if(_enemy.var_canDespawn) //If the enemy CAN be killed
			{
				with(_enemy)
				{
					repeat(4) //Create some clouds when the enemy dissapears
					{
						instance_create_depth(x, y, depth+1, obj_cloudSFX);
					};
					
					sprite_index = spr_blank; //Make it actually dissapear. Maybe change it to a resting sprite later?
					_respawnTime = 120; //Make respawn time longer
				};
			}
			else //If it can't despawn, make it look hit, at least.
			{
				if(_enemy.var_isBoss)
				{
					with(_enemy)
					{
						var_hp --;
						var_state = var_hitState;
					};
				}
			};
			
			_enemy.action(); //All enemies have interactions. Execute it
			
			_enemy.untouchable = true; //If the enemy was hit, it cannot be hit until this resets trough alarm[11]
			if(_enemy.alarm[11] = -1) and (_enemy.var_canRespawn){_enemy.alarm[11] = _respawnTime}; //Reenables the enemy's hitbox
			playHit();
			
			if(var_state = STATE_MACHINE.punch)
			{
				var_state = STATE_MACHINE.normal
			};
			
			if(var_state = STATE_MACHINE.roll)
			{
				var_state = STATE_MACHINE.dash;
			};
			var_canPunch = true;
		}
		else //CASE 2: You don't have enough speed. You're getting hurt.
		{
			if(!invincibleFrames)
			{
				hitSetup(); //And so, the player gets sent to hit state
				audio_play_sound(sfx_hitSelf, 0, 0)
			};
		};
		
		//Visual effects after contact
		if(!invincibleFrames)
		{
			freezeframes(.8);
			screenshake(5, 3, .3);
		};
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
	
	if(place_meeting(x, y, obj_wall))
	{
		if(!place_meeting(x, y-16, obj_wall))
		{
			while(place_meeting(x, y+1, obj_wall))
			{
				y--
			};
		}
		else if(!place_meeting(x, y+16, obj_wall))
		{
			while(place_meeting(x, y-1, obj_wall))
			{
				y++
			};
		};
	};
	y += _vspd;
};

function hitSetup()
{
	//When you get hit, you always need to set up this parameters externally so they only happen once. This function makes it easier
	hp --;
	var_spd = var_mspd * -image_xscale;
	var_vspd = -var_jspd/2;
	var_state = STATE_MACHINE.hit
	
	/*
		When you get hurt by something while standing on the ground, you get on the hit state by only a frame (Which feels absolutely awkward)
		This happens because the hit state resets you back to normal once you touch the ground.
		When you hit something while on the ground your vspd isn't enough to lift you before the game does the ground check. So we lift you by two pixels
		to avoid this behavior.
	*/
	y -= 2;
};

function sprite(name) //Shorthand for asset_get_index
{
	if(sprite_exists(asset_get_index(string(name) + string(var_spriteMod))))
	{
		return asset_get_index(string(name) + string(var_spriteMod));
	};
};

function playHit() //Plays the corresponding hit sound
{
	if(var_combo <= 0)
	{
		audio_play_sound(sfx_hit, 0, 0);
	}
	else if(var_combo = 1)
	{
		audio_play_sound(sfx_hit2, 0, 0);
	}
			
	else if(var_combo = 2)
	{
		audio_play_sound(sfx_hit3, 0, 0);
	}
	else if(var_combo >= 3)
	{
		audio_play_sound(sfx_hit4, 0, 0);
	};
	
	var_combo ++;
	audio_play_sound(sfx_pound, 0, 0);
}

function canPunch()
{
	if(keyboard_check_pressed(global.k_special)) and (!var_grounded) and (var_canPunch)
	{
		var _dir = keyboard_check_pressed(global.k_right) - keyboard_check_pressed(global.k_left)
		
		if(_dir != 0)
		{
			var_spd = var_mspd*sign(_dir);
		}
		else
		{
			var_spd = var_mspd*2*image_xscale;
		}
		var_state = STATE_MACHINE.punch;
		var_canPunch = false;
		var_vspd = -var_jspd/2;
		
		repeat(8) //Cloud Puffs
		{
			instance_create_depth(x, y, depth+1, obj_cloud2SFX)
		};
		
		audio_play_sound(sfx_dash, 1, 0, 1, 0, random_range(.7, 1.3))
	};
};

function walkingWall() //Also includes normal/moss collisions
{
	//If touching a walking wall from the side, climb it
	if(place_meeting(x+var_spd, y, obj_walkingWall)) and (abs(var_spd) >= var_mspd/2) and (!var_grounded)
	{
		while(!place_meeting(x+sign(var_spd), y, obj_walkingWall))
		{
			x += sign(var_spd)
		};
		
		if(place_meeting(x+1, y, obj_walkingWall))
		{
			image_xscale = 1
		}
		else if(place_meeting(x-1, y, obj_walkingWall))
		{
			image_xscale = -1
		};
		
		var_state = STATE_MACHINE.wallrun
	}
	else if(place_meeting(x+var_spd, y, obj_jumpingWall))
	{
		while(!place_meeting(x+sign(var_spd), y, obj_jumpingWall))
		{
			x += sign(var_spd)
		};
		
		if(place_meeting(x+1, y, obj_jumpingWall))
		{
			image_xscale = 1
		}
		else if(place_meeting(x-1, y, obj_jumpingWall))
		{
			image_xscale = -1
		};
		var_state = STATE_MACHINE.moss
		var_canPunch = true;
	}
	else //Collide as normal
	{
		collisions();
	};
}

function newAlarm(time, func)
{
	if(var_time = -1){var_time = time};
	var_time--;
	
	var_time = clamp(var_time, -1, 999999)
	if(var_time = -1)
	{
		func();
	};
};