//Fucking dies
if(place_meeting(x, y, obj_player))
{
	if(obj_player.var_canDMG)
	{
		var_defeated = true;
	};
};

if(var_defeated)
{
	sprite_index = spr_keeperBeatenFX
	image_speed = 0;
	image_index = 7;
	
	var_vspd += var_grav;
	x += var_spd;
	y += var_vspd;
};

if(y > room_height+32)
{
	var _burgID = 157;
	
	switch(var_encounter)
	{
		case 0:
			_burgID = 157
		break;
		
		case 1:
			_burgID = 158
		break;
		
		default:
			_burgID = 157
		break;
	}
	
	//Announce to the player that the new burger has been unlocked
	obj_control.isUnlockingBurg = true
	obj_control.isUnlockingBurg_type = _burgID
		
	ini_open("data.ini");
		//Write the burger unlocked
		ini_write_real("burgersUnlocked", string(_burgID), true);
		ini_write_real("Marcus", "Encountered", var_encounter +1)
	ini_close();
		
	
	instance_destroy(obj_barrierBoss);
	instance_destroy(obj_barrier);
	
	global.specialMusic = false;
	instance_destroy();
}

if(instance_exists(obj_player))
{
	image_xscale = -sign(x -obj_player.x)
};
