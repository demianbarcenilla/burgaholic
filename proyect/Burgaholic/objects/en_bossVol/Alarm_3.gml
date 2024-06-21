/// @description Bounce!
if(var_state = SLIME_STATE.bouncing)
{
	var_state = SLIME_STATE.stuck
}
else if(var_state = SLIME_STATE.stuck)
{
	var_shake = false;
	var_state = SLIME_STATE.ascent;
}
else
{
	var _dir = 0, _spd = 8;
	
	if(instance_exists(obj_player))
	{
		_dir = point_direction(x, y, obj_player.x, obj_player.y)
		var _vdir = lengthdir_x(_spd, _dir);
		var _hdir = lengthdir_y(_spd, _dir);
	
		var_vspd = _vdir;
		var_spd  = _hdir;
	
		var_state = SLIME_STATE.bouncing;
	}
};