var _nearestArrow = instance_nearest(x, y, obj_dansArrow)

if(keyboard_check_pressed(keyToCheck) and (place_meeting(x, y, _nearestArrow)))
{
	instance_destroy(_nearestArrow);
	
	repeat(16)
	{
		var _FX = instance_create_depth(x, y, depth, obj_cloud2SFX)
		_FX.sprite_index = spr_spryBullet;
	}
}