// Inherit the parent event
event_inherited();

//Only gotta change these 2
var_chatbox = 1
var_chat = "ShopCedric"
var_chatFinished = var_chat + "_Finished";

var_pool = 22; //Pool starts here
setKeeperChat(); //Sets standard shop/interact event

image_speed = IMAGE_SPEED;

keeperUnlocked(2);