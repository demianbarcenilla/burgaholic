/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

// Inherit the parent event
event_inherited();

arr_arcadeGame[0] = rm_arcadeBurg; //ARCADE GAME
arr_arcadeGame[1] = rm_arcadeTennis;
arr_arcadeGame[2] = rm_arcadeBurg;
arr_arcadeGame[3] = rm_arcadeBurg;
arr_arcadeGame[4] = rm_arcadeBurg;
arr_arcadeGame[5] = rm_arcadeBurg;
arr_arcadeGame[6] = rm_arcadeVirux;
arr_arcadeGame[7] = rm_arcadeBurg;

var_arcadeGame = 0;

if(game = -1)
{
	var_arcadeGame = 0
}
else
{
	var_arcadeGame = game;
};

image_speed = 0;
image_index = var_arcadeGame;

alarm[10] = 2;

if(arcadeMini)
{
	sprite_index = spr_arcadeMini;
}