///Draw Hearts
var sep = sprite_get_width(spr_heart) + 4;


//oscilation
var _increment = hp = 1 ? 1 : 5, //variables
	_amplitude = 1,
	_shift, _neg;
	
t = (t + _increment) mod 360; //add *_increment* degrees every step, reset at 360

for(i=0; i < maxHp; i++)
{ 
	_neg = i%2 = 0 ? -1 : 1;
	_shift = -dsin(t) * _amplitude *_neg; //shift value = the sine of t * the amplitude of the wave
	
	if(hp >= i+1)
	{
		draw_sprite(spr_heart, 0, 8 +i*sep, 8+_shift)
	}
	else
	{
		draw_sprite(spr_heart, 1, 8 +i*sep, 8+_shift)
	};
}