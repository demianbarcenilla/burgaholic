/// @description Animate
// Hit secuence
if(!var_canGetHit)
{
	sprite_index = var_hitSpr;
	draw_self();
}
else
{
	if(image_index >= image_number-1)
	{
		sprite_index = var_idleSpr;
	};
	
	draw_self();
};

if(var_hitSecuence = true)
{
	var_canGetHit = false;
	if(alarm[0] = -1) {alarm[0] = 5; image_index = 0};
	//Flash
	gpu_set_fog(true, WHITE, 0, 0)
		draw_self();
	gpu_set_fog(false, c_white, 0, 0)
};

//Oscilation
//variables
var _increment = 4,
	_amplitude = 32,
	_shift;
//add *_increment* degrees every step, reset at 360
t = (t + _increment) mod 360;

//shift value = the sine of t * the amplitude of the wave
_shift = -dsin(t) * _amplitude;

//shift
y = ystart + _shift;

solid_collide(var_hspd, var_vspd, obj_solid);