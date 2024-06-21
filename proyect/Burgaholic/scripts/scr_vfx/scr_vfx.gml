///Player Functions!
function screenshake(time, ammount, fade)
{
	with(obj_control)
	{
		shaking = true;
	
		shakeTime = time;
		shakeAmmount = ammount;
		shakeFade = fade;
	};
};

function freezeframes(time)
{
	var dur = time *100;
	var t = current_time + dur;
	while(current_time < t){}
};

function osc_step(increment, amplitude)
{
	//oscilation
	var _shift;
	
	t = (t + increment) mod 360; //add *_increment* degrees every step, reset at 360
	_shift = -dsin(t) * amplitude;
	return _shift;
};

function shk_step(ammount)
{
	var _shift;
	
	t = random_range(-ammount, ammount);
	
	return t;
};

function bossBarriers()
{
	instance_create_depth(0, room_height-16, depth, obj_barrierBoss);
	instance_create_depth(room_width-16, room_height-16, depth, obj_barrierBoss);
};

function easeInOutBack(xx){
var c1 = 1.70158,
	c3 = c1 + 1;

return 1 + c3 * power(xx - 1, 3) + c1 * power(xx - 1, 2);
}
	
function vfx_dirt()
{
	repeat(4) //Creates 4 dirt particles
	{
		var _dirt = instance_create_depth(x, y, depth, obj_dirtFX)
		_dirt.var_spd = irandom_range(.5, 2)*sign(image_xscale);
	}
	
	audio_play_sound(sfx_bump, 1, false)
}

function draw_objectShake()
{
	if(var_shake)
	{
		draw_sprite(sprite_index, image_index, x+shk_step(1), y +shk_step(1));
	}
	else
	{
		draw_self();
	};
}

function draw_text_outlined(xx, yy, text)
{
	//Outline
	draw_set_color(c_black)
	draw_text(xx+1, yy, text)
	draw_text(xx-1, yy, text)
	draw_text(xx, yy+1, text)
	draw_text(xx, yy-1, text)
	
	//Fill
	draw_set_color(c_white)
	draw_text(xx, yy, text)
}