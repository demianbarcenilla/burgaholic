/// @description INITIALIZE
#macro IMAGE_SPEED .4;
shaking = false;
enum stage
{
	bonus,
	forest,
	volcano,
	beach,
	rust,
	reef,
	ashtray,
	core,
	pond
};

global.stage = stage.forest;
global.prevStage = stage.forest;

shakeTime = 0;
shakeAmmount = 0;
shakeFade = 0;

global.prevRoom = -1;
global.nextRoom = -1;
global.music = mus_forest;

arr_music[0] = mus_bonus;
arr_music[1] = mus_forest;