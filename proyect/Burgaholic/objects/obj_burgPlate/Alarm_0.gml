if(var_unlocksBurger)
{
	burg_unlockAndDisplay(var_burgerID_arcade);
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