if(instance_exists(obj_onion)) and (instance_exists(obj_player))
{
	obj_player.x = obj_onion.x;
	obj_player.y = obj_onion.y;
	instance_destroy(obj_onion);
};