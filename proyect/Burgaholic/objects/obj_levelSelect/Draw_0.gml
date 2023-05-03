var _xdisplace = 0;

for(i = 0; i < 8; i++)
{
	draw_sprite(spr_levelSelect, i, 32+(32*_xdisplace), room_height/2);
	
	if(var_selected = i)
	{
		draw_sprite(spr_levelSelectPointer, i, 32+(32*_xdisplace), room_height/2);
	};
	
	_xdisplace ++;
};

if(keyboard_check_pressed(global.k_left))
{
	var_selected --;
};

if(keyboard_check_pressed(global.k_right))
{
	var_selected ++;
};

var _room = rm_forestTube;
if(keyboard_check_pressed(global.k_jump))
{
	switch(var_selected)
	{
		case 0:
			_room = rm_forestTube;
		break;
		
		case 1:
			_room = rm_volcano;
		break;
		
		case 2:
			_room = rm_beach;
		break;
		
		case 3:
			_room = rm_rust;
		break;
		
		case 4:
			_room = rm_reef;
		break;
		
		case 5:
			_room = rm_ashtray;
		break;
		
		case 6:
			_room = rm_core;
		break;
		
		case 7:
			_room = rm_pond;
		break;
		
		case 8:
			_room = rm_test;
		break;
	};
	
	room_goto(_room);
	alarm[0] = 1;
};

var_selected = clamp(var_selected, 0, 8)