image_speed = 0;
sprite_index = spr_gregDie;
depth = -50;

var_spd = 0;
var_vspd = -4;
var_grav = .1;

var_chatbox = global.stage;
var_sprite = spr_gregDie;
var_chat = "DefeatGreg"

var_event = function(){
	var_state = 3; 
	
	if(instance_exists(obj_notebook))
	{
		obj_notebook.alarm[0] = 360
	};
};
//0 = SHAKING
//1 = BOUNCING
//2 = STANDING
var_state = 0;

var_shake = true;

global.specialMusic = true;
global.music = mus_silence;

audio_stop_all();

audio_play_sound(sfx_bossBeat, 1, false);

ini_open("data.ini")
	var _stages = ini_read_real("Stages", "Total", 0)
	var stageNumber = 8;
	
	if(_stages < stageNumber)
	{
		ini_write_real("timer", "global", obj_control.var_timeGlobal);
	}
	
	if(ini_read_real("Stages", "Total", 0) < stageNumber)
	{
		ini_write_real("Stages", "Total", stageNumber)
	};
	
	//WRITE PB
	obj_control.var_runTimeCurStage = false;
	
	var _savedPB = ini_read_real("timer", string(global.stage), 0)
	if(_savedPB != 0)
	{		
		if(obj_control.var_timeCurStage < _savedPB)
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
ini_close();

//BURGERUNLOCK
var_speedrunTime = 180;
//UNLOCK SPEEDY BURGS
if(obj_control.var_timeCurStage < var_speedrunTime)
{
	burg_unlockAndDisplay(167);
}