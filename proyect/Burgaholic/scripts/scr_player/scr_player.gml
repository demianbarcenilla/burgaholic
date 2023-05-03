///Player Functions!
function state_normal()
{	
	var_canDMG = false;
	var _dir;
	
	var _waterEffect = place_meeting(x, y, obj_water) and (var_effect != 1)
	
	//Locks the direction in one place, for certain interactions with walljumps and such
	if(k_dirCap = 0){_dir = keyboard_check(global.k_right) - keyboard_check(global.k_left)}
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
		};
	};
	else
	{
		var_vspd += var_grav;
		var_groundCheck --;
		var_groundCheck = clamp(var_groundCheck, -1, var_coyoteTime)
		
		if(keyboard_check_pressed(global.k_jump))
		{
			if(var_groundCheck > -1)
			{
				var_vspd = -var_jspd;
				audio_play_sound(sfx_jump, 0, 0)
			};
			else
			{
				var_state = STATE_MACHINE.pound;
			};
		}
	};
	
	//Variable Jump
	if(keyboard_check_released(global.k_jump) and (var_vspd < 0)) and (!k_jumpCap){var_vspd /=4}
	
	//If touching a walking wall from the side, climb it
	if(place_meeting(x+var_spd, y, obj_walkingWall)) and (abs(var_spd) >= var_mspd/2) and (!var_grounded)
	{
		while(!place_meeting(x+sign(var_spd), y, obj_walkingWall))
		{
			x += sign(var_spd)
		};
		
		if(place_meeting(x+1, y, obj_walkingWall)){image_xscale = 1}
		else if(place_meeting(x-1, y, obj_walkingWall)){image_xscale = -1}
		
		var_state = STATE_MACHINE.wallrun
		
	};
	else //Collide as normal
	{
		collisions();
	};
	
	//HIT SEQUENCE
	hit_sequence();
	canPunch();
	
	//Animations
	//Grounded
	if(var_grounded)
	{
		if(abs(var_spd) <= .5){sprite_index = sprite("spr_playerIdle")}
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
		if(var_vspd <= 0)
		{
			sprite_index = sprite("spr_playerJump");
		}
		else
		{
			sprite_index = sprite("spr_playerFall");
		}
		/*
		if(abs(var_spd) >= var_mspd/2)
		{
			sprite_index = sprite("spr_playerJumpRoll");
		};
	
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
		}*/
	}
};

 function state_walkingWall()
{	
	var_canDMG = false;
	
	sprite_index = sprite("spr_playerWall");
	
	var_vspd = -var_mspd;
	/*//Vertical Collissions
	if(place_meeting(x, y+var_vspd, obj_wall))
	{
		while(!place_meeting(x, y+sign(var_vspd), obj_wall))
		{
			y += sign(var_vspd);
		};
	
		if(place_meeting(x, y+sign(var_vspd), obj_wall))
		{
			var_spd = 0;
			var_vspd = 0;
			var_state = STATE_MACHINE.normal;
		};
	}
	*/
	y += var_vspd;
	
	//HIT SEQUENCE
	hit_sequence();
	
	//RETURNING TO NORMAL
	//when there's no more wall
	if(!place_meeting(x+sign(var_spd), y, obj_wall))
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
	if(var_grounded) or (place_meeting(x, y+1, obj_wall) and (place_meeting(x, y, obj_water)))
	{
		invincibleFrames = true;
		var_state = STATE_MACHINE.normal;
	};
};

function state_bump()
{
	sprite_index = sprite("spr_playerHit");
	
	collisions();
	
	//Gravity
	var_vspd += var_grav;
	
	//Back to Normal
	if(var_grounded)
	{
		var_state = STATE_MACHINE.normal;
	};
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
	var_canDMG = true;
	
	sprite_index = sprite("spr_playerJumpRoll");
	if(var_effect = 1)
	{
		var_effect = 0;
		instance_create_depth(x, y, depth, obj_discardedCrab);
	};
	
	var _waterEffect = place_meeting(x, y, obj_water) and (var_effect != 1)
	
	if(!_waterEffect)
	{
		var_vspd = var_mspd*4;
		var_spd = 0;
	}
	else
	{
		var_state = STATE_MACHINE.roll;
	};
	
	collisions();
	
	if(place_meeting(x, y, obj_enemy))
	{
		var_state = STATE_MACHINE.normal;
		var_spd = var_mspd *image_xscale;
		k_jumpCap = 1;
		k_dirCap = sign(var_vspd);
	};
	else if(var_grounded)
	{
		var_state = STATE_MACHINE.roll;
		screenshake(3, .5, .1);
		
		audio_play_sound(sfx_pound, 0, 0);
	}

	hit_sequence();
};

function state_roll()
{
	var_canDMG = true;
	
	var _alarm = 20, _inverse = global.k_left;
	
	sprite_index = sprite("spr_playerRoll");
	var_spd = var_mspd*2*image_xscale
	
	if(!var_grounded)
	{
		var_vspd += var_grav;
	};
	else
	{
		var_vspd = 0;
	}
	
	if(place_meeting(x+sign(var_spd), y, obj_wall))
	{
		var_state = STATE_MACHINE.normal;
	};
	
	canPunch()
	
	collisions();
	
	if(alarm[1] = -1){alarm[1] = _alarm}
	
	if(keyboard_check_pressed(global.k_jump))
	{
		var_state = STATE_MACHINE.dash
		var_spd = var_mspd *2 *image_xscale;
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
			var_state = STATE_MACHINE.dash
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
	var_canDMG = true;
	
	sprite_index = sprite("spr_playerRoll");
	var_spd = var_mspd*2*image_xscale
	var_vspd += var_grav;
	
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
			
			repeat(4) //DIRT FX
			{
				var _dirt = instance_create_depth(x, y, depth, obj_dirtFX)
				_dirt.var_spd = irandom_range(.5, 2)*sign(image_xscale);
			}
		};
	}
	if(keyboard_check_pressed(global.k_jump))
	{
		var_state = STATE_MACHINE.pound;
	}
	
	canPunch();
	
	hit_sequence();
	
	//If touching a walking wall from the side, climb it
	if(place_meeting(x+var_spd, y, obj_walkingWall)) and (abs(var_spd) >= var_mspd/2) and (!place_meeting(x, y+1, obj_wall))
	{
		while(!place_meeting(x+sign(var_spd), y, obj_walkingWall))
		{
			x += sign(var_spd)
		};
		
		if(place_meeting(x+1, y, obj_walkingWall)){image_xscale = 1}
		else if(place_meeting(x-1, y, obj_walkingWall)){image_xscale = -1}
		
		var_state = STATE_MACHINE.wallrun
		
	};
	else //Collide as normal
	{
		collisions();
	};
};

function state_punch()
{
	var_canDMG = true;
	var_vspd += var_grav;
	if(alarm[8] = -1)
	{
		alarm[8] = 15;
	};
	
	sprite_index = sprite("spr_playerPunch");
	image_speed = IMAGE_SPEED *2;
	collisions();
	
	hit_sequence();
	/*if(place_meeting(x+sign(var_spd), y, obj_wall)) and (!place_meeting(x+sign(var_spd), y, obj_walkingWall))
	{
		var_spd = var_mspd * -image_xscale;
		var_vspd = -var_jspd/2;
		var_state = STATE_MACHINE.bump
		
		repeat(4) //DIRT FX
		{
			var _dirt = instance_create_depth(x, y, depth, obj_dirtFX)
			_dirt.var_spd = irandom_range(.5, 2)*sign(image_xscale);
		}
		
		image_speed = IMAGE_SPEED;
	};*/
	//If touching a walking wall from the side, climb it
	if(place_meeting(x+var_spd, y, obj_wall)) and (abs(var_spd) >= var_mspd/2) and (!var_grounded)
	{
		while(!place_meeting(x+sign(var_spd), y, obj_wall))
		{
			x += sign(var_spd)
		};
		
		if(place_meeting(x+1, y, obj_wall)){image_xscale = 1}
		else if(place_meeting(x-1, y, obj_wall)){image_xscale = -1}
		
		var_state = STATE_MACHINE.wallrun
		
	};
};

function state_tube()
{
	var_effect = 0; //Carrying a crab/exploding baby, etc
	var_spriteMod = "";
	
	sprite_index = spr_playerTube;
	var_vspd -= var_grav;
	
	y += var_vspd;
	
	if(y < 0)
	{
		room_goto(rm_levelSelect);
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