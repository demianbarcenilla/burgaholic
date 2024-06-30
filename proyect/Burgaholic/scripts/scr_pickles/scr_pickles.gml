function pickle_angleUpdate()
{
	with(obj_follower)
	{
		var _pickleAmmount = array_length(obj_player.arr_pickles)
		angle = pickleNumber/_pickleAmmount *360;
	};
}

function pickle_lerp_checkpoint(){
	if(instance_exists(obj_checkpoint))
	{
		x = lerp(x, obj_checkpoint.x, .1);
		y = lerp(y, obj_checkpoint.y-16, .1);
			
		if(round(x) = obj_checkpoint.x) and (round(y) = obj_checkpoint.y-16)
		{
			pickleSave();
		}
	}
}

function key_lerp_checkpoint(){
	var _keyHole = instance_nearest(x, y, obj_barrierKeyhole)
	depth = _keyHole.depth -1;
	x = lerp(x, _keyHole.x+8, .1);
	y = lerp(y, _keyHole.y+8, .1);
	
	if(round(x) = _keyHole.x+8) and (round(y) = _keyHole.y+8)
	{
		keyDestroy();
	};
}

function update_pickle_list(){
	for(i=0; i < array_length(arr_pickles); i++)
	{
		if(!instance_exists(arr_pickles[i]))
		{
			array_delete(arr_pickles, i, 1)
		};
	};
}

function pickle_follow()
{
	var _pickleAmmount = array_length(obj_player.arr_pickles)
	if(_pickleAmmount <= 2)
	{
		x = lerp(x, obj_player.x -(17 * obj_player.image_xscale)*(pickleNumber+1), .1);
		y = lerp(y, obj_player.y -(obj_player.sprite_height/2), .1);
	}
	else 
	{
		angle += angle_rate;
		x = obj_player.x + lengthdir_x(distance, angle)
		y = obj_player.y -(obj_player.sprite_height/2) + lengthdir_y(distance, angle)
	}	
}

function pickleSave()
{
	var _pickleNumber = array_length(obj_player.arr_pickles)
	
	//If not unlocked, save unlock
	if(!var_pickleUnlocked)
	{
		obj_control.drawPickle = true;
		global.pickles ++;
		
		ini_open("data.ini");
			ini_write_real("PicklesUnlocked", string(id), true)
			ini_write_real("PicklesUnlocked", "Held", global.pickles);
		ini_close();
	};
	
	for(i=0; i < _pickleNumber-1; i++) //If pickle finds itself in the array, delete entry
	{
		if(obj_player.arr_pickles[i] == id)
		{
			array_delete(obj_player.arr_pickles, i, 1);
		}
	}
	
	//Destroy the pickle
	instance_destroy();
	
	with(obj_follower)
	{
		//Update the angle every pickle is using
		pickle_angleUpdate();
	}
	
	//Finally, make the player check the array entries
	player_pickleCheck()
};

function keyDestroy()
{		
	var _keyHole = instance_nearest(x, y, obj_barrierKeyhole)
	var _pickleNumber = array_length(obj_player.arr_pickles)
	
	with(_keyHole)
	{
		var_breaking = true;
		alarm[0] = 5;
	}
	
	for(i=0; i < _pickleNumber-1; i++) //If pickle finds itself in the array, delete entry
	{
		if(obj_player.arr_pickles[i] == id)
		{
			array_delete(obj_player.arr_pickles, i, 1);
		}
	}
	
	//Play key sound :)
	audio_play_sound(sfx_key, 0, 0)
	
	//Destroy the pickle
	instance_destroy();
	
	with(obj_follower)
	{
		//Update the angle every pickle is using
		pickle_angleUpdate();
	}
	
	//Finally, make the player check the array entries
	player_pickleCheck()
}

function player_pickleCheck()
{
	obj_player.update_pickles = true;
}

function pickle_set_number()
{
	//Check how long the array is
	var _pickleAmmount = array_length(obj_player.arr_pickles)
			
	//PickleNumber = ID on the list
	for(i=0; i < _pickleAmmount; i++)
	{
		if(obj_player.arr_pickles[i] == id)
		{
			pickleNumber = i
		}
	}
}