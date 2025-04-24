var_state = 0 //0 = GAME, 1 = DEAD

image_speed = .2;

//SPEED
//Horizontal
var_spd = 0;
con_mspd = .25;
var_mspd = con_mspd;

var_fric = con_mspd;

var_vspd = 0
var_grav = .3;

var_score = 0;
var_oldScore = var_score;

var_reloaded = true;
alarm[1] = irandom_range(60, 120);
alarm[3] = 60*10;