var _right = keyboard_check(kb_right),
	_left = keyboard_check(kb_left);
var_dir -= (_right -_left) *var_fric;
if(var_dir > 360)
{
	var_dir -=360
}
else if(var_dir < 0)
{
	var_dir +=360
};

var_dir = round(var_dir);
//HONK
if(keyboard_check_pressed(kb_honk)) and (var_honkRecharged)
{
	if(!instance_exists(obj_bumbExplosion))
	{
		instance_create_depth(x, y, depth+1, obj_bumbExplosion);
	};
	var_honkRecharged = false;
	alarm[2] = 30;
};

var_speed = lerp(var_speed, var_curSpd, .2);

var_xspd = lengthdir_x(var_speed, var_dir);
var_yspd = lengthdir_y(var_speed, var_dir);

x += var_xspd;
y += var_yspd;

if(place_meeting(x, y, obj_wall)) and (!bounced)
{
	var_dir += 180;
	alarm[3] = 15;
	bounced = true;
	screenshake(4, 1, .1)
};
	
var_curSpd = var_maxSpd;

var _unlock = instance_nearest(x, y, obj_nextRoom)

if(place_meeting(x, y, _unlock))
{
	if(_unlock.var_finalCheck)	
	{
		room_goto(global.currentRoom);
		with(obj_control){alarm[10] = 2};
	}
	else
	{
		room_goto(global.nextRoom);
	};
	
	if(_unlock.var_unlocksBurger)
	{
		with(_unlock)
		{
			ini_open("data.ini");
			//If not previously unlocked, announce to the player that the new burger has been unlocked
			if(!ini_read_real("burgersUnlocked", var_burgerID_arcade, false))
			{
				obj_control.isUnlockingBurg = true
				obj_control.isUnlockingBurg_type = var_burgerID_arcade
			};
	
			//Write the burger unlocked
			ini_write_real("burgersUnlocked", var_burgerID_arcade, true);
			ini_close();
		};
	};
	
	screenshake(5, 1, .1)
};