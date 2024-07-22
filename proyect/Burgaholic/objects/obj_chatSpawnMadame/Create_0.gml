// Inherit the parent event
event_inherited();

//Only gotta change these 2
var_chatbox = 4
var_chat = "ShopMadame"
var_chatFinished = "ShopMadame_Finished";

var_pool = 82; //Pool starts here
setKeeperChat(); //Sets standard shop/interact event

image_speed = IMAGE_SPEED;

depth = -200;

keeperUnlocked(5);