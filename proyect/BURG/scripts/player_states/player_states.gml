//@func state_normal()
function state_normal()
{
	// Movement
	//Speed Mode
	if(abs(var_hspd) > var_maxHspd -0.5)
	{
		var_state = STATE_MACHINE.damage;
	};

	//Horizontal Movement
	var hmove = keyboard_check(global.rightKey) - keyboard_check(global.leftKey); //check for direction
	
	if(!var_justBounced)
	{
		if(hmove != 0)//if moving, add friction
		{
			var_hspd += hmove * var_fric;
		}

		if(sign(var_hspd) != hmove)
		{
			var_hspd *= var_descel;
		};
	};
	
	var_hspd = clamp(var_hspd, -var_maxHspd, var_maxHspd); //set max speed

	//Vertical Movement
	if(place_meeting(x, y+1, obj_solid))
	{
		var_vspd = -var_jspd *(keyboard_check_pressed(global.jumpKey));
	};
	else
	{
		var_vspd += var_grav;
	};

	//Bump head on ceilings
	if(place_meeting(x, y-1, obj_solid))
	{
		var_vspd = var_grav
	};
	
	//Variable Jump
	if(keyboard_check_released(global.jumpKey))
	{
		var_vspd = max(var_vspd, -var_jspd /4);
	};

	solid_collide(var_hspd, var_vspd, obj_solid)

	//Animate
	if(!place_meeting(x, y+1, obj_solid)) //Air
	{
		sprite_index = spr_playerJump;
	}
	else //Grounded
	{
		if(hmove != 0)
		{
			sprite_index = spr_playerWalk;
		}
		else
		{
			sprite_index = spr_player;
		};
	};
	
	roomChange();
};

function state_damage()
{
	//Normal Mode
	if(abs(var_hspd) < var_maxHspd -0.5)
	{
		var_state = STATE_MACHINE.normal;
	};
	
	//Horizontal Movement
	var hmove = keyboard_check(global.rightKey) - keyboard_check(global.leftKey) -var_justBounced; //check for direction
	
	if(!var_justBounced)
	{
		if(hmove != 0)//if moving, add friction
		{
			var_hspd += hmove * var_fric;
		}

		if(sign(var_hspd) != hmove)
		{
			var_hspd *= var_descel;
		};
	};
	
	var_hspd = clamp(var_hspd, -var_maxHspd, var_maxHspd); //set max speed

	//Vertical Movement
	if(place_meeting(x, y+1, obj_solid))
	{
		var_vspd = -var_jspd *(keyboard_check_pressed(global.jumpKey));
	};
	else
	{
		var_vspd += var_grav;
	};

	//Bump head on ceilings
	if(place_meeting(x, y-1, obj_solid))
	{
		var_vspd = var_grav
	};
	
	//Variable Jump
	if(keyboard_check_released(global.jumpKey)) and (var_canVary)
	{
		var_vspd = max(var_vspd, -var_jspd /4);
	};

	solid_collide(var_hspd, var_vspd, obj_solid)
	
	//Enemy Collisions
	var enemy = instance_nearest(x, y, obj_enemy);

	if(place_meeting(x, y, enemy) and enemy.var_canGetHit)
	{
		with(enemy)
		{
			var_hitSecuence = true;
		};
		
		if(!place_meeting(x, y+1, obj_solid))
		{
			var_vspd = -var_jspd;
		};
		
		var_canVary = false;
		alarm[1] = 10;
		
		//Freeze Frames
		var __time = current_time;
		while current_time-__time < 75 {};
		
		//Screenshake
		screenshake(5, 4, 0.25)
		
	};
	
	if(alarm[0] = -1) {alarm[0] = 1}; //spawns a trail
	sprite_index = spr_playerRun;
	
	roomChange();
}

function roomChange()
{
	//CHANGE ROOM
	//Go To Prev
	if(x < 0)
	{
		if(global.rmPrev != -1)
		{
			room_goto(global.rmPrev);
			x = room_width;
		};
		
		else
		{
			x = clamp(x, 0, room_width)
		};
	};
	
	//Go To Next
	if(x > room_width)
	{
		if(global.rmNext != -1)
		{
			room_goto(global.rmNext);
			x = 0;
		};
		
		else
		{
			x = clamp(x, 0, room_width)
		};
	};
};