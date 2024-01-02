if(var_state = 0)
{
	var _dir = keyboard_check(global.k_right) - keyboard_check(global.k_left);
	var _dirV = keyboard_check(global.k_down) - keyboard_check(global.k_up);
	
	if(instance_exists(obj_bumbExplosion))
	{
		_dir = 0;
		_dirV = 0;
	};
	//Horizontal Movement
	var_spd = var_mspd*_dir;
	var_vspd = var_mspd*_dirV;
	
	if(_dir != 0) or (_dirV != 0)
	{
		alarm[3] = 60*5;
		
		if(_dir != 0)
		{
			image_xscale = _dir; //Flip Sprite
		};
		sprite_index = spr_bumbRun;
	}
	else
	{
		sprite_index = spr_bumb;
	};
	//Instead of clamping, use linear interpolation so i can use 
	//higher speeds than the max, for certain game feel fx

	if(place_meeting(x, y, obj_arcadeEnemyTemplate))
	{
		var_state = 1;
		instance_create_depth(x, y, depth-1, obj_bumbExplosion);
		alarm[0] = 60;
	};
	
	if(keyboard_check_pressed(global.k_jump)) and (!var_cooldown)
	{
		var_cooldown = true;
		alarm[0] = cooldownTime;
		instance_create_depth(x, y-(sprite_height/2), depth-1, obj_bumbExplosion)
	};

	collisionBasic();
}
else
{
	image_alpha = 0;
	
	if(alarm[2] = -1)
	{
		alarm[2] = 60;
	};
};

if(var_score >= 15)
{
	var _burgerID = 39;
	ini_open("data.ini");
		//If not previously unlocked, announce to the player that the new burger has been unlocked
		if(!ini_read_real("burgersUnlocked", _burgerID, false))
		{
			obj_control.isUnlockingBurg = true
			obj_control.isUnlockingBurg_type = _burgerID;
		};
	
		//Write the burger unlocked
		ini_write_real("burgersUnlocked", _burgerID, true);
	ini_close();
}