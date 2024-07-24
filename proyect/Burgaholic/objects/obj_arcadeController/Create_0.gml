xx = 0
yy = 0 //The coordinates to put the player at when you return to main world

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
arr_arcade[3, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[3, 2] = mus_arcadeBurg //MAIN MUSIC


arr_arcade[4, 0] = arr_arcade[3, 0] +20 //ARCADE NUMBER
arr_arcade[4, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[4, 2] = mus_arcadeBurg //MAIN MUSIC


arr_arcade[5, 0] = arr_arcade[4, 0] +20 //ARCADE NUMBER
arr_arcade[5, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[5, 2] = mus_arcadeBurg //MAIN MUSIC

arr_arcade[6, 0] = arr_arcade[5, 0] +20 //ARCADE NUMBER
arr_arcade[6, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[6, 2] = mus_arcadeBurg //MAIN MUSIC

arr_arcade[7, 0] = arr_arcade[6, 0] +20 //ARCADE NUMBER
arr_arcade[7, 1] = mus_arcadeBurgMenu //MENU MUSIC
arr_arcade[7, 2] = mus_arcadeBurg //MAIN MUSIC

global.specialMusic = true;
global.music = arr_arcade[global.stage, 1];

var_arcadeBurgerStart = arr_arcade[global.stage, 0] //The first of the unlockable arcade burgers

var_burgIconX = 4*16;
var_burgIconY = 12*16;

image_speed = .1;

arr_burgIcon[0] = -1; //Object that represents the burg sprite
arr_burgIcon[1] = -1;
arr_burgIcon[2] = -1;

screenshake(10, 2, 2);