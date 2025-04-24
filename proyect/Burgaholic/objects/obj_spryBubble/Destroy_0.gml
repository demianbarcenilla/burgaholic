var _stain = instance_create_depth(x, y, depth+1, obj_spryStain)
_stain.image_index = var_size;

if(var_size < 2)
{
	var _newSize = var_size +1;
	
	var _newBubble = instance_create_depth(x, y, depth+1, obj_spryBubble);
		_newBubble.var_size = _newSize;
		_newBubble.var_spd = -(var_spd);
		
	var _newBubble2 = instance_create_depth(x, y, depth+1, obj_spryBubble);
	_newBubble2.var_size = _newSize;
	_newBubble2.var_spd = var_spd;
}

obj_spryChar.var_score += bubbleScore
audio_play_sound(sfx_noisePoints, 1, false)