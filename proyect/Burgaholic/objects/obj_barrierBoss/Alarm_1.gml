//Generate Up Barriers
if(instance_number(obj_barrier) < 200) //Don't generate more than 30 barriers
{
	//Generate Barriers Upwards
	if(y -var_generateUp > 0)
	{
		var _barrier = instance_create_depth(x, y +var_generateUp, depth, obj_barrier);
		_barrier.var_number = i+1; //Assign number
		_barrier.lock = id; //Assign the lock that's generating the barrier
		var_generateUp -= var_escalate; //Generate the next barrier higher
		i++;
		alarm[1] = var_alarmTime;
	}

	//Generate Barriers Downwards
	if(y +var_generateDown < room_height)
	{
		var _barrier = instance_create_depth(x, y +var_generateDown, depth, obj_barrier);
		_barrier.var_number = ii+1; //Assign number
		_barrier.lock = id; //Assign the lock that's generating the barrier
		var_generateDown += var_escalate; //Generate the next barrier lower
		i++;
		alarm[1] = var_alarmTime;
	};
}