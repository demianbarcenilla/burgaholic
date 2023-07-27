///Draw Hearts
var sep = sprite_get_width(spr_heart);

if(instance_exists(obj_player)) and (!instance_exists(obj_chat))
{	
	//Pickle HUD
	draw_set_font(fnt_holicSmall)
	draw_sprite(spr_pickleHud, 0, 96, 16)	
	
	//Align Text
	draw_set_halign(fa_right)
	draw_set_valign(fa_middle)
	
	//Draw Text Outline
	draw_set_color($502C33)
	
	var _textCenter = 95, _textVertical = 27;
	draw_text(_textCenter-1, _textVertical, "x"+ string(global.pickles))
	draw_text(_textCenter+1, _textVertical, "x"+ string(global.pickles))
	draw_text(_textCenter, _textVertical-1, "x"+ string(global.pickles))
	draw_text(_textCenter, _textVertical+1, "x"+ string(global.pickles))
	
	//Draw Text Filling
	draw_set_color(c_white)
	draw_text(_textCenter, _textVertical, "x"+ string(global.pickles))
	
	//DRAW HEARTS
	for(var i=0; i < obj_player.maxHp; i++)
	{ 	
		if(obj_player.hp >= i+1)
		{
			draw_sprite(spr_heart, 0, 16 +i*sep, 16)
		}
		else
		{
			draw_sprite(spr_heart, 1, 16 +i*sep, 16)
		};
	}
};

//Burger Unlock
if(isUnlockingBurg)
{
	burgerDisplace = 0;		
	if(alarm[0] = -1){alarm[0] = 120}
};

burgerDisplace_current = lerp(burgerDisplace_current, burgerDisplace, .1)
draw_sprite(spr_burgerUnlocked, 0, SCREEN_WIDTH/2, 16 -burgerDisplace_current)
draw_sprite(spr_burgers, isUnlockingBurg_type, SCREEN_WIDTH/2 -32, 16 -burgerDisplace_current)