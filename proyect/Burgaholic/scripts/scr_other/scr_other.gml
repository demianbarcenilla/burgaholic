// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function collisionBasic()
{
	var _spd = var_spd;
	//Horizontal Collissions
	if(place_meeting(x+_spd, y, obj_wall))
	{
		while(!place_meeting(x+sign(_spd), y, obj_wall))
		{
			x += sign(_spd);
		};
	
		if(place_meeting(x+sign(_spd), y, obj_wall))
		{
			_spd = 0;
		};
	}
	
	x += _spd;
	
	//Vertical Collissions
	var _vspd = var_vspd;
	if(place_meeting(x, y+_vspd, obj_wall))
	{
		while(!place_meeting(x, y+sign(_vspd), obj_wall))
		{
			y += sign(_vspd);
		};
	
		if(place_meeting(x, y+sign(_vspd), obj_wall))
		{
			_vspd = 0
		};
	};
	
	//one way platform collisions
	if(instance_exists(obj_oneWay))
	{
	    if(y < instance_nearest(x, y+1, obj_oneWay))
	    {
	        if(!place_meeting(x, y, obj_oneWay)) and (_vspd > 0)
	        {
	            if(place_meeting(x, y+_vspd, obj_oneWay))
	            {
	                while(!place_meeting(x, y+sign(_vspd), obj_oneWay))
	                {
	                    y += sign(_vspd);
	                };
	                _vspd = 0;
	            };
	        };
	    };
	};
	
	y += _vspd;
};

function setKeeperChat()
{
	//This is triggered once the chatbox is destroyed
	
	var_event = function(){
		var _shop = instance_create_depth(x, y, depth, obj_shop);
		_shop.var_poolStart = var_pool;
	};

	var_action = function() //This is triggered once you interact with the character
	{
		if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
		{
			var _chat = instance_create_depth(0, 0, 0, obj_chat)
				_chat.var_chatbox = var_chatbox
				_chat.var_chat = var_chat
				_chat.var_event = var_event
		}	
	}
}

function setKeeperChat_emptyShop(emptyShopChat)
{	
	//This is triggered once the chatbox is destroyed
	var_event = function(){};
	var_chat = emptyShopChat;
	var_action = function() //This is triggered once you interact with the character
	{
		if(!instance_exists(obj_chat) and (!instance_exists(obj_shop)))
		{
			var _chat = instance_create_depth(0, 0, 0, obj_chat)
				_chat.var_chatbox = var_chatbox
				_chat.var_chat = var_chat
				_chat.var_event = var_event
		}	
	}
}

function keeperUnlocked(keeperID)
{
	ini_open("data.ini")
		var _isUnlocked = ini_read_real("Stages", "Total", 0) >= keeperID;
	
		if(!_isUnlocked)
		{
			instance_destroy()
		};
	ini_close();
};

function checkAllBought(_pool)
{
	var _allBought = true;
	
	ini_open("data.ini")
	var i,
		iEND = _pool+15;
	for(i = _pool; i < iEND; i++)
	{
		if(ini_read_real("burgersUnlocked", string(i), false) == false)
		{
			_allBought = false;
			break;
		};	
	};
	ini_close();
	return _allBought;
};

function resetAlarms(exceptFor)
{
	for(i = 0; i < 11; i++)
	{
		if(i != exceptFor)
		{
			alarm[i] = -1;
		};
	};
}

function stepAlarm(number, time)
{
	if(alarm[number] = -1)
	{
		alarm[number] = time;
	}
};

function decide_startroom()
{
	ini_open("data.ini")
		var _stagesFinished = ini_read_real("Stages", "Total", 0)
	ini_close()
	var _startRoom = _stagesFinished == 0 ? rm_tutorial : rm_lobby;
	 //_startRoom = rm_test;
	 return _startRoom
}

function save_bossBeaten(stageNumber)
{
	var _keeper = instance_create_depth(x, y-32, depth, obj_keeperBeaten);
	
		repeat(16){instance_create_depth(x, y-32, depth, obj_wasteFX)};
		screenshake(5, 1, .2)
	
		ini_open("data.ini");
			if(ini_read_real("Stages", "Total", 0) < stageNumber)
			{
				ini_write_real("Stages", "Total", stageNumber)
			};
		ini_close();
		instance_destroy();
		
		global.specialMusic = true;
		global.music = mus_silence;
}