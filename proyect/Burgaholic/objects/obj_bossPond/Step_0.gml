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
		obj_player.x -= _separateSpeed;
		obj_playerMagnetized.x += _separateSpeed;
	break;
	
	case GREG_STATE.idle:
	
	break;
}