//TIMER
songTimer += delta_time/1000000;
if(songTimer > beat)
{
	beat = 1/4;
	
	ini_open("dansParty.ini")
		var _arrow = ini_read_real("TRACKER", string(line), 0)
		if(_arrow > 0)
		{	
			//we do _arrow -1 bc ingame, their ID starts at 0, but in the file, they start from 1
			var _arrowInstance = instance_create_depth(160 +((_arrow -1)*20), 128, depth, obj_dansArrow)
			_arrowInstance.image_index = _arrow-1; 
		}
		else if(_arrow = -1)
		{
			room_goto(rm_arcadeDans);
			if(canUnlock_perfect)
			{
				var _burgNumber = 117;
				burg_unlockAndDisplay(_burgNumber)
				burg_unlockAndDisplay(_burgNumber+1)
				burg_unlockAndDisplay(_burgNumber+2)
			};
		};
	
		line ++;
	ini_close();
	
	songTimer %= beat
	
};

//Input
if(keyboard_check_pressed(global.k_right))
{
	changeAnim(3);
}
else if(keyboard_check_pressed(global.k_up))
{
	changeAnim(1);
}
else if(keyboard_check_pressed(global.k_down))
{
	changeAnim(2);
}
else if(keyboard_check_pressed(global.k_left))
{
	changeAnim(0);
}

//RESET XSCALE/YSCALE
var_xscale = lerp(var_xscale, 1, .2)
var_yscale = lerp(var_yscale, 1, .1)