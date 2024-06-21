if(var_state != SLIME_STATE.spawning)
{
	var i;
	 //DRAW HEALTH
	 for(i = 0; i < var_maxHp; i++)
	 {
		draw_sprite(spr_heartBoss, var_hp <= i ? 1 : 0, room_width-32 -(16*i), room_height-16 +(var_heartPos));
	 };
	 
	 var_heartPos = lerp(var_heartPos, 0, .1)
};


/*Debug
draw_set_font(fnt_holicSmall)
draw_text(x, y-48, "state" + string(var_state))
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)