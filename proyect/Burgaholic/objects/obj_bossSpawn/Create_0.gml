xx = room_width/4;
yy = room_height-16;

switch(global.stage)
{
	case stage.forest: 
		var_boss = en_bossFor;
	break;
	
	case stage.volcano: 
		var_boss = en_bossVol;
		xx = room_width-32;
		yy = sprite_height+78;
	break;
	
	default: var_boss = en_bossFor;
	break;
}