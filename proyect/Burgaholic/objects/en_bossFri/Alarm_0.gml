var_state = FRIDGE_STATE.jump;
if(instance_exists(obj_player))
{
	//If player's on the left side, speed = -1, else, speed = 1
	var _playerLocation = obj_player.x > x ? -1 : 1;
}

var_spd = var_mspd*_playerLocation;
var_vspd = -8;