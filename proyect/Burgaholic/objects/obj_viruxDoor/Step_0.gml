if(place_meeting(x, y, obj_virux))
{
	if(unlocksBurger != -1)
	{
		burg_unlockAndDisplay(unlocksBurger);
	};

	if(finalCheck)
	{
		room_goto(global.currentRoom);	
		instance_destroy(obj_arcadeController);
	}
	
	else
	{
		instance_destroy(obj_virux);
		room_goto_next();
	}
};