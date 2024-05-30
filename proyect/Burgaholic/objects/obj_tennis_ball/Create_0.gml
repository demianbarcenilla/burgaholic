xdir = 1;
ydir = -1;
xmin_spd = 1;
xmax_spd = 1.8;
ymax_spd = 1;
yspd = .6;
xspd = random_range(xmin_spd, xmax_spd);

shadow = instance_create_depth(x,y,depth + 10, obj_tennis_ball_shadow);