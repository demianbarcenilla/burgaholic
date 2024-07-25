if(place_meeting(x, y, obj_player)) and (keyboard_check_pressed(global.k_up))
{
	with(obj_player)
	{
		var_spd = 0;
		var_vspd = 0;
	};
	
	if(checkAllBought(var_pool))
	{
		if(checkAllUnlocked(158))
		{
			setKeeperChat_event("ShopBaddie_Extra", var_altEvent);
		}
		else
		{
			setKeeperChat_emptyShop(var_chatFinished);
		}
	};
	
	var_action();
};