///Player Functions!
function state_normal()
{	
	var_canDMG = false
	var _dir;
	
	var _waterEffect = place_meeting(x, y, obj_water) and (var_effect != 1)
	
	//Locks the direction in one place, for certain interactions with walljumps and such
	if(k_dirLock){_dir = 0; if(alarm[0] = -1){alarm[0] = 10}} //Locks movement completely
	else if(k_dirCap = 0){_dir = keyboard_check(global.k_right) - keyboard_check(global.k_left)}
	else{_dir = k_dirCap; if(alarm[0] = -1){alarm[0] = 10}};
	
	//Locks the jump button, for interactions with the Pound and Roll states
	if(k_jumpCap){if(alarm[0] = -1){alarm[0] = 10}};
	
	//Horizontal Movement
	if(_dir != 0)
	{
		var_spd += var_fric*_dir;
		image_xscale = _dir; //Flip Sprite
	}
	else
	{
		var _ice = place_meeting(x, y+1, obj_ice) //Unused
		var_spd = lerp(var_spd, 0, _ice ? .05 : .2);
	};
	
	//Instead of clamping, use linear interpolation so i can use 
	//higher speeds than the max, for certain game feel fx
	if(var_spd > var_mspd)
	{
		var_spd = lerp(var_spd, var_mspd, .1)
	}
	else if(var_spd < -var_mspd)
	{
		var_spd = lerp(var_spd, -var_mspd, .1) 
	};
	
	//Vertical Movement
	if(var_grounded)
	{
		var_groundCheck = var_coyoteTime;
		
		if(!_waterEffect)
		{
			var_vspd = 0;
		};
		
		if(keyboard_check_pressed(global.k_jump))
		{
			if(keyboard_check(global.k_down)) and (!place_meeting(x, y+1, obj_ice))//ROLL
			{
				var_state = STATE_MACHINE.roll;
				var_spd = var_mspd *image_xscale;
			}
			else //Jump like usual
			{
				if(place_meeting(x, y+1, obj_magma))
				{
					var_vspd = -var_jspd*1.5;
					instance_create_depth(x, y, depth-1, obj_groundExplosion)
					screenshake(5, 2, .1)
				}
				else
				{
					var_vspd = -var_jspd;
					audio_play_sound(sfx_jump, 0, 0)
				};
				var_groundCheck = -1;
			}
		};
		
	}
	else
	{
		if(var_effect != 3)
		{
			var_vspd += var_grav;
			var_groundCheck --;
			var_groundCheck = clamp(var_groundCheck, -1, var_coyoteTime)
		}
		else
		{
			var_vspd += var_grav/1.5;
		};
		
		
		if(keyboard_check_pressed(global.k_jump))
		{
			if(var_effect != 3) //If you're not a FISH
			{
				if(var_groundCheck > -1)
				{
					var_vspd = -var_jspd;
					audio_play_sound(sfx_jump, 0, 0)
				}
				else if (!_waterEffect)
				{
					var_state = STATE_MACHINE.pound;
				};
			}
				
			else //If you DO have infinite jumps + NO GROUNDPOUND
			{
				if(keyboard_check_pressed(global.k_jump))
				{
					var_vspd = -var_jspd;
					audio_play_sound(sfx_jump, 0, 0)
				};
			}
		}
	};
	
	//Variable Jump
	if(var_effect != 3)
	{
		if(keyboard_check_released(global.k_jump) and (var_vspd < 0)) and (!k_jumpCap)
		{
			var_vspd /=4
		};
	}
	else
	{
		var_canPunch = true;
	};
	
	//If you're hitting a walking wall, walk on the wall. Else, collide as normal
	walkingWall();
	
	//HIT SEQUENCE
	hit_sequence();
	
	//DASH IF NOT UNDERWATER
	if(!_waterEffect)
	{
		canPunch();
	}
	
	//Jump on Ceilings
	if(_waterEffect) and (place_meeting(x, y-1, obj_wall))
	{
		if(keyboard_check_pressed(global.k_jump))
		{
			var_vspd = var_jspd;
			audio_play_sound(sfx_jump, 0, 0);
		};
	};
	
	//Animations
	//Grounded
	if(var_grounded)
	{
		if(abs(var_spd) <= .5)
		{
			if(keyboard_check(global.k_down))
			{
				sprite_index = sprite("spr_playerDown")
			}
			
			else if(keyboard_check(global.k_up))
			{
				sprite_index = sprite("spr_playerUp")
			}
			
			else
			{
				sprite_index = sprite("spr_playerIdle")
			};
		}
		//else if(abs(var_spd) >= var_mspd/2){sprite_index = sprite("spr_playerRun")}
		else if(sign(var_spd) = -sign(_dir))
		{
			sprite_index = sprite("spr_playerTurnaround")
		}
		else{sprite_index = sprite("spr_playerWalk")}
	}
	//Aereal
	else
	{
		var _ceiling = (_waterEffect) and (place_meeting(x, y-1, obj_wall));
		
		if(_ceiling)
		{
			if(abs(var_spd) >= .5)
			{
				sprite_index = spr_playerRunRoof;
			}
			else
			{
				sprite_index = spr_playerIdleRoof;
			};
		}
		else
		{
			if(var_vspd <= 0)
			{
				sprite_index = sprite("spr_playerJump");
			}
			else
			{
				sprite_index = sprite("spr_playerFall");
			}
		};
	}
};

function state_walkingWall()
{	
	var_canDMG = false;
	
	sprite_index = sprite("spr_playerWall");
	
	var_vspd = -var_mspd;
	//Vertical Collissions
	if(place_meeting(x, y+var_vspd, obj_walkingWall))
	{
		while(!place_meeting(x, y+sign(var_vspd), obj_walkingWall))
		{
			y += sign(var_vspd);
		};
	
		if(place_meeting(x, y+sign(var_vspd), obj_walkingWall))
		{
			var_spd = 0;
			var_vspd = 0;
			var_state = STATE_MACHINE.normal;
		};
	}
	
	y += var_vspd;
	
	//HIT SEQUENCE
	hit_sequence();
	
	//RETURNING TO NORMAL
	//when there's no more wall
	if(!place_meeting(x+sign(var_spd), y, obj_walkingWall))
	{
		var_spd = sign(var_spd) *var_mspd;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.normal;
	};
	//When you walljump out of it
	if(keyboard_check_pressed(global.k_jump))
	{
		k_dirCap = -sign(var_spd) 
		var_spd = k_dirCap*var_mspd*4;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.normal;
		
		var_canPunch = true;
		
		freezeframes(.5);
		screenshake(5, 2, .3);
		
		audio_play_sound(sfx_jump, 0, 0);
	};
	
	//When you stop pressing the run button
	/*if((keyboard_check(global.k_right) - keyboard_check(global.k_left)) = 0) and (alarm[2] = -1)
	{
		alarm[2] = 15;
	};*/
};

function state_hit()
{
	var_canDMG = false;
	sprite_index = sprite("spr_playerHit");
	
	collisions();
	
	//Gravity
	var_vspd += abs(var_grav);
	
	
	//Back to Normal
	if(var_grounded) or (place_meeting(x, y-1, obj_wall) and (place_meeting(x, y, obj_water)))
	{
		invincibleFrames = true;
		var_state = STATE_MACHINE.normal;
	};
};

function state_bump()
{
	
	if(place_meeting(x, y, obj_water))
	{
		var_state = STATE_MACHINE.normal;
	};
	sprite_index = sprite("spr_playerHit");
	
	if(var_effect = 2)
	{
		var_effect = 0;
		instance_create_depth(x, y, depth, obj_explosion);
		
		var_state = STATE_MACHINE.normal;
		var_vspd = -var_jspd*1.2;
	}
	else
	{
		//Gravity
		var_vspd += var_grav;
	
		//Back to Normal
		if(var_grounded)
		{
			var_state = STATE_MACHINE.normal;
		};
	}
	
	collisions();
};

function state_dead()
{
	var_canDMG = false;
	sprite_index = spr_blank;
	
	if(alarm[6] = -1)
	{
		alarm[6] = 60;
	};
};

function state_pound()
{
	trailMake();
	var_canDMG = true;
	var_spd = var_effect == 4 ? var_mspd * 4 * image_xscale : 0;
	var_vspd = var_jspd;
	sprite_index = sprite("spr_playerPound");
	
	var _waterEffect = place_meeting(x, y, obj_water) and (var_effect != 1)
	
	if(_waterEffect)
	{
		var_vspd = var_mspd*4;
		var_spd = 0;
		var_state = STATE_MACHINE.roll;
	}
	else if(var_effect = 1)
	{
		var_effect = 0;
		instance_create_depth(x, y, depth+1, obj_discardedCrab);
	};
		
	collisions();
	
	_enemy = instance_nearest(x, y, obj_enemy)
	if(place_meeting(x, y, _enemy)) and (!_enemy.untouchable)
	{
		var_state = STATE_MACHINE.bounce;
		var_vspd = -var_jspd*1.2;
	}
	else if(var_grounded)
	{
		var _boat = instance_nearest(x, y, obj_boat)
		if(place_meeting(x, y+1, _boat))
		{
			with(_boat)
			{
				if(place_meeting(x, y-1, obj_player))
				{
					var _dir = obj_player.image_xscale;
					
					var_spd = var_mspd*(_dir)
					image_xscale = _dir;
				};
			};
			screenshake(5, 5, .1);
			
			var_state = STATE_MACHINE.bounce;
			var_vspd = -var_jspd*1.5;
			y -= 2;
		}
		else
		{
			if(place_meeting(x, y+1, obj_noBounceWall))
			{
				repeat(4) //Creates 4 dirt particles
				{
					var _dirt = instance_create_depth(x, y, depth, obj_cloudSFX)
					_dirt.var_spd = irandom_range(.5, 2)*sign(image_xscale);
					_dirt.sprite_index = spr_noBounceFX;
				}
	
				audio_play_sound(sfx_noBounce, 1, false)
	
				var_state = STATE_MACHINE.normal;
			}
			else
			{
				var_state = STATE_MACHINE.windup;
				var_sprite = sprite("spr_playerPrebounce");
				var_windupFunc = function(){
					if(place_meeting(x, y+1, obj_magma))
					{
						var_vspd = -var_jspd*1.8;
						instance_create_depth(x, y, depth-1, obj_groundExplosion)
						screenshake(5, 2, .1)
					}
					else
					{
						var_vspd = -var_jspd*1.5;
			
					}
					y -= 5;
					var_state = STATE_MACHINE.bounce;
				};
				
				image_index = 0;
				screenshake(3, .5, .1);
			}
		}
		
		
		audio_play_sound(sfx_pound, 0, 0);
	}

	hit_sequence();
};

function state_roll()
{
	trailMake();
	
	var_canDMG = true;
	var _ice = place_meeting(x, y+1, obj_ice)

	var _alarm = 20, _inverse = global.k_left;
	
	sprite_index = sprite("spr_playerRoll");
	var_spd = var_mspd*2.5*image_xscale
	
	if(var_effect = 1) //Discard the Jellyfish
	{
		var_effect = 0;
		instance_create_depth(x, y, depth, obj_discardedCrab);
	};
	
	if(!var_grounded)
	{
		var_vspd += var_grav;
	}
	else
	{
		var_vspd = 0;
	}
	
	if(place_meeting(x+sign(var_spd), y, obj_wall)) or (_ice)
	{
		var_state = STATE_MACHINE.normal;
	};
	
	canPunch()
	
	walkingWall();
	
	if(alarm[1] = -1){alarm[1] = _alarm}
	
	if(keyboard_check_pressed(global.k_jump))
	{
		var_state = STATE_MACHINE.dash;
		
		var_mspd = con_mspd *2 *image_xscale;
		if(place_meeting(x, y+1, obj_magma))
		{
			var_vspd = -var_jspd*1.5;
			instance_create_depth(x, y, depth-1, obj_groundExplosion)
			screenshake(5, 2, .1)
		}
		else
		{
			var_vspd = -var_jspd;
		};
		
		y -= 1;
		screenshake(3, .5, .1);
		
		audio_play_sound(sfx_jump, 0, 0);
		
		/*if(keyboard_check(k_down))
		{
			alarm[1] = _alarm;
			screenshake(3, .5, .1);
		}
		else
		{
			var_state = STATE_MACHINE.dash;
			var_spd = var_mspd *2 *image_xscale;
			var_vspd = -var_jspd;
			y -= 1;
			screenshake(3, .5, .1);
		}*/
	};
	
	switch(sign(var_spd))
	{
		case -1:
			_inverse = global.k_right;
		break;
		case 1:
			_inverse = global.k_left;
		break;
	}
	
	if(keyboard_check(_inverse))
	{
		var_state = STATE_MACHINE.normal;
	}
	hit_sequence();
};

function state_dash()
{
	trailMake();
	
	var_canDMG = true;
	
	sprite_index = sprite("spr_playerRoll");
	var_spd = var_mspd*2.5*image_xscale
	var_vspd += var_grav;
	var_groundCheck = -1;
	
	if(var_grounded)
	{
		var_state = STATE_MACHINE.roll;
		var_spd = var_mspd *image_xscale;
	}
	else //BUMP
	{
		if(place_meeting(x+sign(var_spd), y, obj_wall)) and (!place_meeting(x+sign(var_spd), y, obj_walkingWall))
		{
			var_spd = var_mspd * -image_xscale;
			var_vspd = -var_jspd/2;
			var_state = STATE_MACHINE.bump
			
			vfx_dirt();
		};
	}
	if(keyboard_check_pressed(global.k_jump))
	{
		if(var_effect!= 3)
		{
			var_state = STATE_MACHINE.pound;
		}
		else
		{
			var_vspd = -var_jspd;
			audio_play_sound(sfx_jump, 0, 0)
		}
	};
	
	walkingWall();
	
	canPunch();
	hit_sequence();
};

function state_punch()
{
	trailMake();
	
	var_canDMG = true;
	
	if(var_effect = 2)
	{
		var_spd = var_mspd*3*image_xscale;
		var_vspd = 0;
		if(alarm[9] = -1){alarm[9] = 3}
	}
	else if(var_effect = 1) //Discard the Jellyfish
	{
		var_effect = 0;
		instance_create_depth(x, y, depth, obj_discardedCrab);
		
		if(place_meeting(x, y, obj_water))
		{
			var_vspd = 0;
		};	
		image_speed = IMAGE_SPEED *2;
	}
	else
	{
		var_vspd += var_grav;
		if(alarm[8] = -1)
		{
			alarm[8] = 15;
		};
	};
	
	sprite_index = sprite("spr_playerPunch");
	
	walkingWall();
	hit_sequence();
	
	//Bump against normal walls
	if(place_meeting(x+sign(var_spd), y, obj_wall)) and (!place_meeting(x+sign(var_spd), y, obj_walkingWall))
	{
		var_spd = var_mspd * -image_xscale;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.bump
		
		vfx_dirt();
		
		image_speed = IMAGE_SPEED;
	};
};

function state_tube()
{
	for(i = 0; i < array_length(arr_pickles); i++)
	{
		if(instance_exists(arr_pickles[i]))
		{
			instance_destroy(arr_pickles[i]);
		};
	};
	var_effect = 0; //Carrying a crab/exploding baby, etc
	var_spriteMod = "";
	
	sprite_index = spr_playerTube;
	var_vspd -= var_grav;
	
	y += var_vspd;
	
	if(y < 0)
	{
		var _transition = instance_create_depth(0, 0, depth, obj_transition2);
		if(room = rm_lobby)
		{
			_transition.var_room = rm_levelSelect;
		}
		else
		{
			_transition.var_room = rm_lobby;
		};
		
		instance_destroy();
	};
};

function state_tubeOut()
{
	var_effect = 0; //Carrying a crab/exploding baby, etc
	var_spriteMod = "";
	
	sprite_index = spr_playerTube;
	image_angle = 180;
	var_spd = 0;
	var_vspd += var_grav;
	
	collisions();
	
	if(place_meeting(x, y+1, obj_wall))
	{
		image_angle = 0;
		var_state = STATE_MACHINE.normal;
		
		repeat(10)
		{
			instance_create_depth(x, y, depth+1, obj_cloud2SFX);
		};
		
		screenshake(2, 1, .2)
	};
};

function state_windup()
{
	sprite_index = var_sprite;
	newAlarm(2, var_windupFunc)
};

function state_bounce()
{
	trailMake();
	
	sprite_index = sprite("spr_playerBounce")
	var_canDMG = true;
	
	//Horizontal Movement
	var _dir;
	//Locks the direction in one place, for certain interactions with walljumps and such
	if(k_dirLock){_dir = 0; if(alarm[0] = -1){alarm[0] = 10}} //Locks movement completely
	else if(k_dirCap = 0){_dir = keyboard_check(global.k_right) - keyboard_check(global.k_left)}
	else{_dir = k_dirCap; if(alarm[0] = -1){alarm[0] = 10}};
	
	if(_dir != 0)
	{
		var_spd += var_fric*_dir;
		image_xscale = _dir; //Flip Sprite
	}
	else
	{
		var_spd = lerp(var_spd, 0, .2);
	};
	
	//Instead of clamping, use linear interpolation so i can use 
	//higher speeds than the max, for certain game feel fx
	if(var_spd > var_mspd)
	{
		var_spd = lerp(var_spd, var_mspd, .1)
	}
	else if(var_spd < -var_mspd)
	{
		var_spd = lerp(var_spd, -var_mspd, .1) 
	};
	
	//add gravity
	if(!var_grounded)
	{
		var_vspd += var_grav;
	}
	
	else
	{
		var_vspd = 0;
	}
	
	if(var_grounded)
	{
		var_state = STATE_MACHINE.normal;
	};
	
	if(place_meeting(x, y+1, obj_magma))
	{
		var_vspd = -var_jspd*1.8;
		instance_create_depth(x, y, depth-1, obj_groundExplosion)
		screenshake(5, 2, .1)
	}
	
	hit_sequence();
	
	canPunch();
	walkingWall();
	
	if(keyboard_check_pressed(global.k_jump))
	{
		var_state = STATE_MACHINE.pound
		var_spd = var_mspd *2 *image_xscale;
		y -= 1;
		screenshake(3, .5, .1);
		
		audio_play_sound(sfx_jump, 0, 0);
	};
};

function state_still()
{
	if(var_grounded)
	{
		sprite_index = sprite("spr_playerIdle");
	}
	else
	{
		sprite_index = sprite("spr_playerFall");
	};
	
	var_vspd = 0;
	var_spd = 0;
	
	if(!instance_exists(obj_shop)) and (!instance_exists(obj_chat))
	{
		var_state = STATE_MACHINE.normal;
	};
};

function state_moss()
{
	var_vspd += var_grav/4
	y += var_vspd
	if(place_meeting(x, y+1, obj_wall))
	{
		x -= 3*sign(var_spd)
		var_spd = -sign(var_spd)*var_mspd
		var_vspd = 0;
		var_state = STATE_MACHINE.normal;
	}
	if(!place_meeting(x+sign(var_spd), y, obj_jumpingWall))
	{		
		var_state = STATE_MACHINE.normal;
	};
	
	sprite_index = spr_playerMoss;
	if(keyboard_check_pressed(global.k_jump))
	{
		k_dirCap = -sign(var_spd) 
		var_spd = k_dirCap*var_mspd*4;
		var_vspd = -var_jspd*1.2;
		var_state = STATE_MACHINE.normal
		var_canPunch = true;
	};
};

function state_bubble()
{	
	collisions();
	
	var_spd = lerp(var_spd, 0, .01);
	
	sprite_index = spr_playerBubble;
	
	if(place_meeting(x, y, obj_wall))
	{
		var_spd = -var_spd;
	};
	
	if(keyboard_check_pressed(global.k_jump)) or (keyboard_check_pressed(global.k_special))
	{
		var_state = STATE_MACHINE.normal;
		var_vspd = -var_jspd;
		
		instance_create_depth(x, y, depth-1, obj_popFX);
		
		var_canPunch = true;
	};
};

function state_shroomed()
{
	sprite_index = spr_playerShroomed;
	
	var _vspd = 1
	var_vspd = -_vspd
	
	var _dir = keyboard_check(global.k_right) - keyboard_check(global.k_left);
	
	//Horizontal Movement
	if(_dir != 0)
	{
		var_spd += var_fric*_dir;
		image_xscale = _dir; //Flip Sprite
	}
	else
	{
		var_spd = lerp(var_spd, 0, .2);
	};
	
	//Instead of clamping, use linear interpolation so i can use 
	//higher speeds than the max, for certain game feel fx
	if(var_spd > var_mspd)
	{
		var_spd = lerp(var_spd, var_mspd, .1)
	}
	else if(var_spd < -var_mspd)
	{
		var_spd = lerp(var_spd, -var_mspd, .1) 
	};
	
	if(keyboard_check(global.k_down))
	{
		var_vspd = _vspd;
	};
	
	var_canPunch = true;
	
	canPunch();
	
	collisions();
};

function state_respawn()
{
	sprite_index = spr_playerGhost;
	if(image_index = image_number -1)
	{
		var_state = STATE_MACHINE.normal;
	};
};

function state_dissapear()
{
	sprite_index = spr_blank
};