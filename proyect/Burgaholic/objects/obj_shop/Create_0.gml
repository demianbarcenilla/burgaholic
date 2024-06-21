var_selectedX = 0;
var_selectedY = 0;

var_burgerSelected = 0;
/*
POOLS START AT
FOREST: 2
VOLCANO: 22
...42
...62
...82
...102
...122
...142
*/
var_poolStart = 2;
cardColor = 2;

for(i = 0; i < 15; i++)
{
	arr_burgerPool[i] = i + var_poolStart
};

alarm[0] = 1; //Delay the pool start by a frame so you can set it up with any character

if(instance_exists(obj_player))
{
	with(obj_player)
	{
		var_state = STATE_MACHINE.still;
	};
}