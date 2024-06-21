switch(var_state)
{
	case 0:
		var_shake = true;
		
		stepAlarm(0, 60);
	break;
	
	case 1:
	//BOUNCE AROUND
		var_vspd += var_grav;
		collisionBasic();
		enemy_wallBounce(true);
		
		if(place_meeting(x, y+1, obj_wall))
		{
			var _keeper = instance_create_depth(x, y, depth, obj_keeperBeatenSpawn);
	
			_keeper.var_chatbox = var_chatbox;
			_keeper.var_chat = var_chat;
			_keeper.sprite_index = var_sprite;
			instance_destroy();
		};
	break;
};
