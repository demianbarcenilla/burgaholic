//Draw
//draw menu
var i,
	_separation = 24,
	_border = 24,
	_aug = 1.1;
	
for(i=0; i <= 5; i++)
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

var_selected = clamp(var_selected, 0, 5)

if(keyboard_check_pressed(global.jumpKey) or (keyboard_check_pressed(vk_enter)))
{
	switch(var_selected)
	{
		case 0:
			
		break;
		
		case 1: 
		
		break;
		
		case 2: 
		
		break;
		
		case 3: 
			
		break;
		
		case 4: 
			
		break;
		
		case 5: //Back
			
			if(room = rm_menu)
			{
				instance_create_depth(0, 0, 0, obj_menu);
			};
			
			else
			{
				instance_create_depth(0, 0, 0, obj_pauseMenu);
			};
			
			instance_destroy();
		break;
	};
};