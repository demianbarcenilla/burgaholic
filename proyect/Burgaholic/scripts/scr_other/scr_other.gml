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
			ini_write_real("PicklesUnlocked", string(id), true)
			ini_write_real("PicklesUnlocked", "Held", global.pickles);
		ini_close();
	};
	
	obj_player.var_picklesFollowing --;
};

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