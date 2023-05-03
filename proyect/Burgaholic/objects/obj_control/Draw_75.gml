///Draw Hearts
var sep = sprite_get_width(spr_heart) + 4;

if(instance_exists(obj_player))
{
	//Draw Pickle Count
	if(drawPickle)
	{
		pickleDisplaceValue = 0;
		if(alarm[0] = -1){alarm[0] = 180}
	};
	
	pickleDisplace = lerp(pickleDisplace, pickleDisplaceValue, .1)
	draw_sprite(spr_ribbon, 0, SCREEN_WIDTH, -pickleDisplace)	
	
	draw_set_font(fnt_holicSmall)
	draw_sprite(spr_pickle, 1, SCREEN_WIDTH-9, 12-pickleDisplace)	
	
	draw_set_color(c_white)
	draw_set_halign(fa_right)
	draw_set_halign(fa_center)
		
	draw_text(SCREEN_WIDTH-26, 10-pickleDisplace, "x"+ string(global.pickles))
		
	//DRAW HEARTS
	for(i=0; i < obj_player.maxHp; i++)
	{ 	
		if(obj_player.hp >= i+1)
		{
			draw_sprite(spr_heart, 0, 8 +i*sep, 8)
		}
		else
		{
			draw_sprite(spr_heart, 1, 8 +i*sep, 8)
		};
	}
};
