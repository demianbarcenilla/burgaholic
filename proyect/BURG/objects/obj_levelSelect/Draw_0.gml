/// @description Insert description here
// You can write your code in this editor

var _spr,
	_xborder = 64,
	_yborder = 64,
	_xlevels = 3, //one less than total
	_ylevels = 1, //one less than total
	_sep = 64,
	_selected,
	i, ii;

//Change Sprite
for(i = 0; i < _xlevels +1; i++) //Draw Horizontal
{
	for(ii = 0; ii < _ylevels+1; ii++)
	{
		if(var_xselect = i) and (var_yselect = ii)
		{
			_spr = spr_levelSelect;
		}
		else
		{
			_spr = spr_levelDeselected;
		};
		
		draw_sprite(_spr, i+(ii*4), _xborder +(_sep *i), _yborder +(_sep*ii));
	};
};
//Selected Square
_selected = var_xselect+(var_yselect*4);

if(keyboard_check_pressed(global.leftKey))
{
	var_xselect --;
};

if(keyboard_check_pressed(global.rightKey))
{
	var_xselect ++;
};
var_xselect = clamp(var_xselect, 0, _xlevels);

if(keyboard_check_pressed(global.upKey))
{
	var_yselect --;
};

if(keyboard_check_pressed(global.downKey))
{
	var_yselect ++;
};
var_yselect = clamp(var_yselect, 0, _ylevels);

//Select option
if(keyboard_check_pressed(global.jumpKey))
{
	switch(_selected)
	{
		case 0:
			global.rm_next = rm_grassLobby;
		break;
		
		case 1:
			global.rm_next = rm_fireLobby;
		break;
		
		case 2:
			global.rm_next = rm_beachLobby;
		break;
		
		case 3:
			global.rm_next = rm_rustLobby;
		break;
		
		case 4:
			global.rm_next = rm_waterLobby;
		break;
		
		case 5:
			global.rm_next = rm_ashtrayLobby;
		break;
		
		case 6:
			global.rm_next = rm_coreLobby;
		break;
		
		case 7:
			global.rm_next = rm_pondLobby;
		break;
	};
	
	room_goto(global.rm_next);
};