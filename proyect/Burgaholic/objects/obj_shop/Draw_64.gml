//Move Around the SHOP

draw_set_font(fnt_holic)
draw_set_halign(fa_center)

if(keyboard_check_pressed(global.k_right))
{
	var_selectedX ++;
}

if(keyboard_check_pressed(global.k_left))
{
	var_selectedX --;
}

if(keyboard_check_pressed(global.k_down))
{
	var_selectedY ++;
}

if(keyboard_check_pressed(global.k_up))
{
	var_selectedY --;
}

var_selectedX = clamp(var_selectedX, 0, 4)
var_selectedY = clamp(var_selectedY, 0, 2)

var_burgerSelected = var_selectedX + (var_selectedY*5);

for(i = 0; i < 5; i++) //Draw Burgers
{
	var _xpos = i
	for(var ii = 0; ii < 3; ii++)
	{
		var _ypos = ii;
		var _id = _xpos + (_ypos*5);
		
		ini_open("data.ini");
			var _unlocked = ini_read_real("burgersUnlocked", arr_burgerPool[_id], 0);
		ini_close();
		
		if(_unlocked)
		{
			draw_sprite(spr_burgerCard, 0, 80 + (32*_xpos), 64 + (32*_ypos))
		}
		else
		{
			draw_sprite(spr_burgerCard, cardColor, 80 + (32*_xpos), 64 + (32*_ypos))
			
			//Draws the burger you're buying	
			/*gpu_set_fog(true, $502C33, 0, 10)
				draw_sprite(spr_burgers, arr_burgerPool[_id], 80 + (32*_xpos), 64 + (32*_ypos))
			gpu_set_fog(false, c_white, 0, 10)			*/
		};
	};
};

ini_open("data.ini");
	var _unlocked = ini_read_real("burgersUnlocked", arr_burgerPool[var_burgerSelected], 0);
ini_close();

draw_sprite(spr_pickleShop, _unlocked, 80 + (32*var_selectedX), 64 + (32*var_selectedY))

if(keyboard_check_pressed(global.k_jump))
{
	if(global.pickles > 0) and (!_unlocked)
	{
		global.pickles --;
	
		ini_open("data.ini");
			ini_write_real("burgersUnlocked", arr_burgerPool[var_burgerSelected], true);
			ini_write_real("PicklesUnlocked", "Held", global.pickles);
		ini_close();
				
		var _card = instance_create_depth(80 + (32*var_selectedX), 64 + (32*var_selectedY), depth, obj_cardDiscarded)
		_card.burgSprite = arr_burgerPool[var_burgerSelected];
		
		if(audio_is_playing(sfx_burgerBuy))
		{
			audio_stop_sound(sfx_burgerBuy)
		};
		
		audio_play_sound(sfx_burgerBuy, 10, 0, 1, 0, random_range(.6, 1.4))
		screenshake(5, 2, .1)
	};
};

if(keyboard_check_pressed(global.k_special)) or (checkAllBought(var_poolStart))
{
	instance_destroy();	
};