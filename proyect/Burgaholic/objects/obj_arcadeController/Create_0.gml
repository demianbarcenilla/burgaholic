xx = 0
yy = 0 //The coordinates to put the player at when you return to main world
var_game = 0;

arr_arcade[0, 0] = 17 //ARCADE NUMBER
arr_arcade[0, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[0, 2] = mus_arcadeBurg //MAIN MUSIC

arr_arcade[1, 0] = arr_arcade[0, 0] +20//ARCADE NUMBER
arr_arcade[1, 1] = mus_arcadeBumbMenu //MENU MUSIC
arr_arcade[1, 2] = mus_arcadeBumb //MAIN MUSIC

arr_arcade[2, 0] = arr_arcade[1, 0] +20 //ARCADE NUMBER
arr_arcade[2, 1] = mus_arcadeSpryMenu //MENU MUSIC
arr_arcade[2, 2] = mus_arcadeSpry //MAIN MUSIC

arr_arcade[3, 0] = arr_arcade[2, 0] +20 //ARCADE NUMBER
arr_arcade[3, 1] = mus_arcadeSoftServeMenu //MENU MUSIC
arr_arcade[3, 2] = mus_arcadeSoftServe //MAIN MUSIC


arr_arcade[4, 0] = arr_arcade[3, 0] +20 //ARCADE NUMBER
arr_arcade[4, 1] = mus_arcadeFishMenu //MENU MUSIC
arr_arcade[4, 2] = mus_arcadeFish //MAIN MUSIC


arr_arcade[5, 0] = arr_arcade[4, 0] +20 //ARCADE NUMBER
arr_arcade[5, 1] = mus_arcadeDansMenu //MENU MUSIC
arr_arcade[5, 2] = mus_arcadeDans //MAIN MUSIC

arr_arcade[6, 0] = arr_arcade[5, 0] +20 //ARCADE NUMBER
arr_arcade[6, 1] = mus_arcadeViruxMenu //MENU MUSIC
arr_arcade[6, 2] = mus_arcadeVirux //MAIN MUSIC

arr_arcade[7, 0] = arr_arcade[6, 0] +20 //ARCADE NUMBER
arr_arcade[7, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[7, 2] = mus_arcadeBurg //MAIN MUSIC

global.specialMusic = true;
alarm[0] = 1;
var_arcadeBurgerStart = 0;

var_burgIconX = 4*16;
var_burgIconY = 12*16;

image_speed = .1;

arr_burgIcon[0] = -1; //Object that represents the burg sprite
arr_burgIcon[1] = -1;
arr_burgIcon[2] = -1;

screenshake(10, 2, 2);