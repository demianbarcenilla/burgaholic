var_state = 0 //0 = GAME, 1 = DEAD
//SPEED
image_speed = .4;
//Horizontal
var_spd = 0;
var_vspd = 0;
var_mspd = 1;

var_cooldown = false;
cooldownTime = 60;

var_score = 0;
var_oldScore = var_score;
alarm[1] = irandom_range(60, 120);

alarm[3] = 60*5;