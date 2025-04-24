var_state = 0 //0 = GAME, 1 = DEAD
//SPEED
//Horizontal
var_spd = 0;
con_mspd = .3;
var_mspd = con_mspd;

var_fric = con_mspd;
var_score = 0;

//Vertical
var_vspd = 0;
var_jspd = 4.5;
var_grav = .3;

alarm[1] = irandom_range(15, 60);
alarm[2] = 60*10;