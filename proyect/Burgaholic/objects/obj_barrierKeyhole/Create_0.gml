var_generateUp = 0;
var_generateDown = 0;
var_escalate = 16;

var_upAmmount = 0;
var_downAmmount = 0;

var i = 0, ii = 0;

//Count the Ammount of barriers to place
while(!place_meeting(x, y -(var_upAmmount*var_escalate), obj_solid))
{
	var_upAmmount++; //Upwards
};
while(!place_meeting(x, y +(var_downAmmount*var_escalate), obj_solid))
{
	var_downAmmount++; //Downwards
};

//Generate Up Barriers
for(i = 0; i < var_upAmmount; i++) //Generate the barriers
{
	var _barrier = instance_create_depth(x, y +var_generateUp, depth, obj_barrier);
	_barrier.var_number = i+1; //Assign number
	_barrier.lock = id; //Assign the lock that's generating the barrier
	var_generateUp -= var_escalate; //Generate the next barrier higher
};

//Generate Down Barriers
for(ii = 0; ii < var_downAmmount; ii++) //Generate the barriers
{
	var _barrier = instance_create_depth(x, y +var_generateDown, depth, obj_barrier);
	_barrier.var_number = ii+1; //Assign number
	_barrier.lock = id; //Assign the lock that's generating the barrier
	var_generateDown += var_escalate; //Generate the next barrier lower
};

var_canPickKey = true;
var_id = id;
var_breaking = false;
