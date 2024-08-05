y += osc_step(1, .1);

if(place_meeting(x, y, obj_player))
{
	ini_open("data.ini");
		var _stages = ini_read_real("Stages", "Total", 0)
		var stageNumber = 9;
	
		if(_stages < stageNumber)
		{
			ini_write_real("timer", "global", obj_control.var_timeGlobal);
		}
	
		if(ini_read_real("Stages", "Total", 0) < stageNumber)
		{
			ini_write_real("Stages", "Total", stageNumber)
		};
	
		if(ini_read_real("timer", "100", 0) == 0)
		{
			ini_write_real("timer", "100", obj_control.var_timeGlobal);
		}
		
		//If not previously unlocked, announce to the player that the new burger has been unlocked
		if(!ini_read_real("burgersUnlocked", 159, false))
		{
			obj_control.isUnlockingBurg = true
			obj_control.isUnlockingBurg_type = 159
		};
		
		//WRITE TIME
		if(_stages < 9)
		{
			ini_write_real("timer", "100", obj_control.var_time100);
		}
		
		//WRITE PB
		obj_control.var_runTimeCurStage = false;
		
		var _savedPB = ini_read_real("timer", string(global.stage), 0)
		if(_savedPB != 0)
		{
			if(obj_control.var_runTimeCurStage < _savedPB)
			{
				ini_write_real("timer", string(global.stage), obj_control.var_timeCurStage);
				obj_control.var_timeCurStagePB = ini_read_real("timer", string(global.stage), 0);
			}
		}
		else
		{
			ini_write_real("timer", string(global.stage), obj_control.var_timeCurStage);
			obj_control.var_timeCurStagePB = ini_read_real("timer", string(global.stage), 0);
		}
		
		//Write the burger unlocked
		ini_write_real("burgersUnlocked", 159, true);
	ini_close();
	
	audio_play_sound(snd_kingburger, 0, false)
	instance_destroy();
	screenshake(5, 2, .1)
}
