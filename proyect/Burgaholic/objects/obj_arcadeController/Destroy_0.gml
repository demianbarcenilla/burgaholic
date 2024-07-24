global.specialMusic = false;

if(instance_exists(obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.normal;
		x = obj_arcadeController.xx;
		y = obj_arcadeController.yy;
	}
		
	room_goto(global.currentRoom);
}
	
instance_destroy(obj_burgIcon);