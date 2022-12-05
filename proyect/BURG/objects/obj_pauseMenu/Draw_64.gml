//Draw

//draw menu
var i,
	_separation = 32,
	_border = 24,
	_aug = 1.1;
	
for(i=0; i < 4; i++)
{
	if(var_selected = i)
	{
		var_xscaleSelected = lerp(var_xscaleSelected, _aug, .1);
		var_yscaleSelected = lerp(var_yscaleSelected, _aug, .1);
		draw_sprite_ext(var_sprSelected, i, ROOM_WIDTH/2, room_height/4 +_border +(_separation*i), var_xscaleSelected, var_yscaleSelected, image_angle, image_blend, image_alpha);
	}
	else
	{
		var_xscale = 1;
		var_yscale = 1;
		draw_sprite_ext(var_spr, i, ROOM_WIDTH/2, room_height/4 +_border +(_separation*i), var_xscale, var_yscale, image_angle, image_blend, image_alpha);
	};
};

//Scroll Trough Menu
if(keyboard_check_pressed(global.upKey))
{
	var_selected--;
	
	var_xscaleSelected = 1;
	var_yscaleSelected = 1;
};

if(keyboard_check_pressed(global.downKey))
{
	var_selected++;
	
	var_xscaleSelected = 1;
	var_yscaleSelected = 1;
};

var_selected = clamp(var_selected, 0, 3)

if(keyboard_check_pressed(global.jumpKey) or (keyboard_check_pressed(vk_enter))) and (var_input)
{
	switch(var_selected)
	{
		case 0: //Continue
			instance_activate_all();
			instance_destroy();
			if(instance_exists(obj_black))
			{
				instance_destroy(obj_black);
			};
			audio_resume_all();
			
		break;
		
		case 1: //Options
			instance_create_depth(0, 0, 0, obj_optionsMenu);
			instance_destroy();
		break;
		
		case 2: //Burgers
			instance_create_depth(0, 0, 0, obj_burgerList);
			instance_destroy();
		break;
		
		case 3: //Menu
			instance_activate_all();
			if(instance_exists(obj_player)) instance_destroy(obj_player);
			room_goto(rm_menu);
		break;
	};
};