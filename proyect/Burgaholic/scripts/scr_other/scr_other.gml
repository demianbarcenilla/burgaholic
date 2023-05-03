// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pickleSave()
{
	instance_destroy();
	
	if(!var_pickleUnlocked)
	{
		obj_control.drawPickle = true;
		global.pickles ++;
		
		ini_open("data.ini");
			ini_write_real("PicklesUnlocked", id, true)
			ini_write_real("PicklesUnlocked", "Held", global.pickles);
		ini_close();
	};
	
	obj_player.var_picklesFollowing --;
};