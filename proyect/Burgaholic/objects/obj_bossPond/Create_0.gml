enum GREG_STATE
{
	spawning,
	separating,
	idle,
	defeated
};

var_state = GREG_STATE.spawning;
instance_create_depth(x, y, depth-1, obj_bossPondArmLeft);
instance_create_depth(x, y, depth-1, obj_bossPondArmRight);

if(instance_exists(obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.stunned
	}
};

var_armMagnetDir = 0;
var_armMagnetNext = 1;

t = 0;

var_maxHp = 1;
var_hp = var_maxHp;

var_heartPos = 32;

isShooting = false;
var_cannonY = y;