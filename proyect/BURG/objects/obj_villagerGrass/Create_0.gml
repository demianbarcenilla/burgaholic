image_speed = IMAGE_SPEED;

var_idleSpr = spr_villagerGrass;
var_talkSpr = spr_villagerGrass;
var_chatting = false;
//Load text
var_dialogueAmmount = 0;
var _section = "grassTalk";
	
ini_open("lang"+string(global.var_lang)+".ini")
	for(i=0; i<= var_dialogueAmmount; i++)
	{
		arr_dialogue[i] = ini_read_string(_section, i, "It seems like there's nothing in here, buddy");
		arr_portraitOrder[i] = ini_read_real(_section, i+100, 0);
	};
ini_close();