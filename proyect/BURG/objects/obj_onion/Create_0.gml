/// @description T = 0
t = 0;
image_speed = 0;

alarm[0] = irandom_range(30, 130)

if(place_meeting(x, y, obj_player))
{
	freezeFrame(60)
	screenshake(10, 2, .2)
	
	part_emitter_burst(global.p_system, global.p_onion, global.p_ghostWhite, p_ammount*6)
	instance_destroy();
};

//particles
part_emitter_region(global.p_system, global.p_onion, x, x, y, y, ps_shape_rectangle, ps_distr_gaussian)

p_time = 25;
p_ammount = 25;
alarm[2] = p_time;