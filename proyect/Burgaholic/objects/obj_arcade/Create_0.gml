/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = global.stage;

// Inherit the parent event
event_inherited();

arr_arcadeGame[0] = rm_arcadeBurg; //ARCADE GAME
arr_arcadeGame[1] = rm_arcadeTennis;
arr_arcadeGame[2] = rm_arcadeBurg;
arr_arcadeGame[3] = rm_arcadeBurg;
arr_arcadeGame[4] = rm_arcadeBurg;
arr_arcadeGame[5] = rm_arcadeBurg;
arr_arcadeGame[6] = rm_arcadeBurg;
arr_arcadeGame[7] = rm_arcadeBurg;

var_arcadeGame = arr_arcadeGame[global.stage];

alarm[10] = 2;