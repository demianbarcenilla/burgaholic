///Player Functions!
function state_normal()
{	
	var _dir, _jmp;
	
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
	if(place_meeting(x, y+1, obj_wall))
	{
		var_vspd = -var_jspd *keyboard_check_pressed(global.k_jump);
	};
	else
	{
		var_vspd += var_grav;
		
		if(keyboard_check_pressed(global.k_jump))
		{
			var_state = STATE_MACHINE.pound;
		}
	};
	
	//Variable Jump
	if(keyboard_check_released(global.k_jump) and (var_vspd < 0)) and (!k_jumpCap){var_vspd /=4}
	
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
	
	//HIT SEQUENCE
	hit_sequence();
	
	//Animations
	//Grounded
	if(place_meeting(x, y+1, obj_wall))
	{
		if(abs(var_spd) <= .5){sprite_index = spr_playerIdle}
		else if(abs(var_spd) >= var_mspd/2){sprite_index = spr_playerRun}
		else{sprite_index = spr_playerWalk}
	}
	//Aereal
	else
	{
		if(abs(var_spd) >= var_mspd/2)
		{
			sprite_index = spr_playerJumpRoll;
		};
	
		else
		{
			if(var_vspd <= 0)
			{
				sprite_index = spr_playerJump;
			}
			else
			{
				sprite_index = spr_playerFall;
			}
		}
	}
};

 function state_walkingWall()
{	
	sprite_index = spr_playerWall;
	
	var_vspd = -var_mspd;
	
	//Vertical Collissions
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
		
		freezeframes(.5)
		screenshake(5, 2, .3)
	};
	
	//When you stop pressing the run button
	/*if((keyboard_check(global.k_right) - keyboard_check(global.k_left)) = 0) and (alarm[2] = -1)
	{
		alarm[2] = 15;
	};*/
	
	if((keyboard_check(global.k_right) - keyboard_check(global.k_left)) = 0)
	{
	
	}
};

function state_hit()
{
	sprite_index = spr_playerHit;
	
	collisions();
	
	//Gravity
	var_vspd += var_grav;
	
	//Back to Normal
	if(place_meeting(x, y+1, obj_wall))
	{
		invincibleFrames = true;
		var_state = STATE_MACHINE.normal;
	};
};

function state_bump()
{
	sprite_index = spr_playerHit;
	
	collisions();
	
	//Gravity
	var_vspd += var_grav;
	
	//Back to Normal
	if(place_meeting(x, y+1, obj_wall))
	{
		var_state = STATE_MACHINE.normal;
	};
};

function state_dead()
{
	sprite_index = spr_blank;
	
	if(alarm[6] = -1)
	{
		alarm[6] = 60;
	};
};

function state_pound()
{
	sprite_index = spr_playerJumpRoll;
	
	var_spd = 0;
	var_vspd = var_mspd*4;
	
	collisions();
	
	if(place_meeting(x, y, obj_enemy))
	{
		var_state = STATE_MACHINE.normal;
		var_spd = var_mspd *image_xscale;
		k_jumpCap = 1;
		k_dirCap = sign(var_vspd);
	};
	else if(place_meeting(x, y+1, obj_wall))
	{
		var_state = STATE_MACHINE.roll;
		screenshake(3, .5, .1);
	}

	hit_sequence();
};

function state_roll()
{
	var _alarm = 20, _inverse = global.k_left;
	
	
	
	sprite_index = spr_playerRoll;
	var_spd = var_mspd*1.5*image_xscale
	
	if(!place_meeting(x, y+1, obj_wall))
	{
		var_vspd += var_grav;
	};
	
	if(place_meeting(x+sign(var_spd), y, obj_wall))
	{
		var_state = STATE_MACHINE.normal;
	};
	
	else if(!place_meeting(x, y+sign(var_vspd), obj_wall))
	{
		
	};
	
	collisions();
	
	if(alarm[1] = -1){alarm[1] = _alarm}
	
	if(keyboard_check_pressed(global.k_jump))
	{
		var_state = STATE_MACHINE.dash
		var_spd = var_mspd *2 *image_xscale;
		var_vspd = -var_jspd;
		y -= 1;
		screenshake(3, .5, .1);
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
	sprite_index = spr_playerRoll;
	var_spd = var_mspd*2*image_xscale
	var_vspd += var_grav;
	
	if(place_meeting(x, y+1, obj_wall))
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