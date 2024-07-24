if(var_unlocksBurger)
{
	ini_open("data.ini");
		
	//If not previously unlocked, announce to the player that the new burger has been unlocked
	if(!ini_read_real("burgersUnlocked", var_burgerID_arcade, false))
	{
		obj_control.isUnlockingBurg = true
		obj_control.isUnlockingBurg_type = var_burgerID_arcade
	};
	
	//Write the burger unlocked
	ini_write_real("burgersUnlocked", var_burgerID_arcade, true);
	ini_close();
};

if(var_finalCheck)
{
	room_goto(global.currentRoom);	
	instance_destroy(obj_arcadeController);
}
else
{
	screenshake(10, 1, 1);
	room_goto_next();
};