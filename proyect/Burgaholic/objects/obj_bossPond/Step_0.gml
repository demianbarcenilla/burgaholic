switch(var_state)
{
	case GREG_STATE.spawning:
		var _lerpVal = room_height-16;
		screenshake(1, .5, .1)
		y = lerp(y, _lerpVal, .05)
		
		if(y < _lerpVal+5)
		{
			var_state = GREG_STATE.separating;
			obj_player.image_xscale = 1;
			obj_player.var_effect = 5;
			instance_create_depth(obj_player.x, obj_player.y, obj_player.depth+1, obj_playerMagnetized)
			audio_play_sound(sfx_explosion, 1, true);
		}
	break;
	
	case GREG_STATE.separating:
		stepAlarm(0, 120)
		
		screenshake(1, .5, .1)
		obj_bossPondArmLeft.image_index = 1;
		obj_bossPondArmRight.image_index = 1;
		
		var _separateSpeed = .5;
		obj_player.var_spd = -_separateSpeed;
		obj_playerMagnetized.x += _separateSpeed;
	break;
	
	case GREG_STATE.idle:
	y += osc_step(1, .1);
	
	stepAlarm(1, 240);
	
	if(alarm[3] == -1) //If finished shooting, reset timer
	{
		stepAlarm(2, 120);
	}
	
	//Change the arm sprite depending on the direction they're pulling
	obj_bossPondArmLeft.image_index = var_armMagnetDir = -1 ? 1 : 0;
	obj_bossPondArmRight.image_index = var_armMagnetDir = -1 ? 0 : 1;
		
	with(obj_player)
	{
		var_spdCarry = (var_mspd)* obj_bossPond.var_armMagnetDir;
	};
	
	if(place_meeting(x, y, obj_gregBullet))
	{
		var _nearBullet = instance_nearest(x, y, obj_gregBullet);
		
		if(_nearBullet.var_canHit)
		{
			instance_create_depth(_nearBullet.x, _nearBullet.y, depth-1, obj_explosion)
			instance_destroy(_nearBullet);
			var_hp --;
		};
	};
	break;
	
	case GREG_STATE.defeated:
			
	sprite_index = spr_gregBodyBroken
	y += 4;
	
	break;
}

if(var_hp <= 0)
{
	if(var_state != GREG_STATE.defeated)
	{
		var_state = GREG_STATE.defeated;
		
		obj_bossPondArmLeft.defeated = true;
		obj_bossPondArmRight.defeated = true;
	
		instance_create_depth(x, y-sprite_height, depth-1, obj_gregBeaten);
	};
};
