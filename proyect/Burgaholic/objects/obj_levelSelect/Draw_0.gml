draw_sprite(spr_levelSelectBG, var_selected, 0, 0)
draw_sprite
(
	spr_levelSelect, 
	var_displaceDir = 1 ? var_selected -var_displaceDir : var_selected, 
	(room_width/2 * var_displaceDir) -(var_displace*var_displaceDir), 
	room_height/2
)

if(var_displaceProgress > 0)
{
	draw_sprite
	(
		spr_levelSelect, 
		var_selected, 
		(room_width+room_width/2) +(var_displace*-var_displaceDir), 
		room_height/2
	);
	
	if(var_displaceDir = -1)
	{
		draw_sprite
		(
			spr_levelSelect, 
			var_selected -var_displaceDir,
			(room_width/2) -(var_displace*var_displaceDir), 
			room_height/2
		);
	};
};

draw_sprite(spr_levelSelectName, var_selected, room_width-8, 8+osc_step(1, 5))

if(var_selected != 0)
{
	draw_sprite(spr_levelSelectPointer, 0, 32, room_height/2)
	
	if(keyboard_check_pressed(global.k_left)) and (!var_hasSelected)
	{
		var_selected --;
		var_displaceProgress = 0;
		var_displaceDir = -1;
	};
}

if(var_selected != var_worldNumber)
{
	draw_sprite(spr_levelSelectPointer, 1, room_width-32, room_height/2)
	
	if(keyboard_check_pressed(global.k_right)) and (!var_hasSelected)
	{
		var_selected ++;
		var_displaceProgress = 0;
		var_displaceDir = 1;
	};
}

var_displace = easeInOutBack(var_displaceProgress)*(room_width);
var_displaceProgress += .03;
var_displaceProgress = clamp(var_displaceProgress, 0, 1)

var _room = rm_forestTube;

if(keyboard_check_pressed(global.k_jump)) and (!var_hasSelected)
{
	var_hasSelected = true;
	audio_stop_sync_group(sg);
	audio_destroy_sync_group(sg);
	audio_play_sound(sfx_levelSelect, 1, false)
	
	switch(var_selected)
	{
		case 0:
			_room = rm_forestTube;
			global.music = mus_0;
		break;
		
		case 1:
			_room = rm_volcano;
			global.music = mus_1;
		break;
		
		case 2:
			_room = rm_beach;
			global.music = mus_2;
		break;
		
		case 3:
			_room = rm_rust;
			global.music = mus_3;
		break;
		
		case 4:
			_room = rm_reef;
			global.music = mus_4;
		break;
		
		case 5:
			_room = rm_ashtray;
			global.music = mus_5;
		break;
		
		case 6:
			_room = rm_core;
			global.music = mus_6;
		break;
		
		case 7:
			_room = rm_pond;
			global.music = mus_7;
		break;
		
		case 8:
			_room = rm_test;
			global.music = mus_lobby;
		break;
	};
	
	var _transition = instance_create_depth(0, 0, depth, obj_transition2)
	_transition.var_room = _room;
};

var_selected = clamp(var_selected, 0, var_worldNumber)