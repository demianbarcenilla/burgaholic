var_vspd += var_grav;
x += var_spd;

y += var_vspd;
collisions();

if(place_meeting(x, y+1, obj_wall))
{
	var _keeper = instance_create_depth(x, y, depth, obj_chatSpawn);
	
	_keeper.var_chatbox = var_chatbox;
	_keeper.var_chat = var_chat;
	_keeper.var_event = var_event;
	_keeper.sprite_index = var_sprite;
	instance_destroy();
};