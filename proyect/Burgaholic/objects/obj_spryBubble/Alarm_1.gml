switch(var_size)
{
	case 0: //Biggest
		var_hp = 5;
		sprite_index = spr_spryBubble
		
		bubbleScore = 50;
	break;
	
	case 1: //Mid
		var_hp = 3;
		sprite_index = spr_spryBubbleMid
		bubbleScore = 30;
	break;
	
	case 2: //Small
		var_hp = 1;
		sprite_index = spr_spryBubbleSmall
		bubbleScore = 10;
	break;
}