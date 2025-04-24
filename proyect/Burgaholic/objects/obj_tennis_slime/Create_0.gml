image_speed = 1;
spd = 1;
ball = instance_nearest(x, y, obj_tennis_ball);

var_state = 0; //0 = normal, 1 = dash, 2 = dead
dash_spd = 2;
dash_timer_max = 20;
dash_timer = 0;
dash_cd_max = 20;
dash_cd = 0;