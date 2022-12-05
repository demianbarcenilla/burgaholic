/// @description Setup
#macro view view_camera[0]

//Camera
view_width = 320;
view_height = 224;
view_scale = 2;

window_set_size(view_width*view_scale, view_height*view_scale);
alarm[0] = 1;

surface_resize(application_surface, view_width*view_scale, view_height*view_scale);

var_shakeEnabled = false;
var_shakeTime = 0;
var_shakeAmmount = 0;
var_shakeFade = 0;