y -= 2;

if(y < -32)
{
	if(!instance_exists(obj_transitionFlash))
	{
		var _trans = instance_create_depth(x, y, depth, obj_transitionFlash)
		_trans.var_room = rm_end;
	}
	
};