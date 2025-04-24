y += var_vspd;
x += var_spd;

if(wave)
{
	y += osc_step(20, 1)
};
if(y < 0){instance_destroy()};
if(x < 0) or (x > room_width){instance_destroy()};

var _nearestBubble = instance_nearest(x, y, obj_spryBubble)
var _nearestFish = instance_nearest(x, y, obj_fishEnemyDADDY)

if(place_meeting(x, y, _nearestBubble))
{
	with(_nearestBubble)
	{
		var_hp --;
		var_flash = true;
	}
	
	instance_destroy();
	
	var _FX = instance_create_depth(x, y, depth, obj_staticFX);
	_FX.sprite_index = spr_spryBulletFX
}

if(place_meeting(x, y, _nearestFish))
{
	with(_nearestFish)
	{
		if(instance_exists(obj_fish))
		{
			obj_fish.var_score += 50;
		};
		
		audio_play_sound(sfx_noisePoints, 1, false);
		instance_destroy();
	}
	
	instance_destroy();
	
	var _FX = instance_create_depth(x, y, depth, obj_staticFX);
	_FX.sprite_index = spr_spryBulletFX
}