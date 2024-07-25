if(place_meeting(x, y, obj_player))
{
	ini_open("data.ini")
		var _timesEncountered = ini_read_real("Marcus", "Encountered", 0);
		if(encounter >= _timesEncountered)
		{
			var _marcusAppear = instance_create_depth(arr_marcus[encounter], -32, depth, obj_marcusAppear)
			_marcusAppear.var_encounter = encounter;
			
			bossBarriers()
		};
	ini_close();
	
	instance_destroy()
};