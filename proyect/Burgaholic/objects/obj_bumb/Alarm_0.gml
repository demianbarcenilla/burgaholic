var_cooldown = false;
if(var_score - var_oldScore >= 3)
{
	var _burgerID = 37;
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

var_oldScore = var_score;