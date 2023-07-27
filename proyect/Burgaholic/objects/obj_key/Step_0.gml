//OSCILATE

if(place_meeting(x, y, obj_player)) and (!var_touched)
{
	var_touched = true;
	
	obj_player.var_picklesFollowing ++;
	pickleNumber = obj_player.var_picklesFollowing;
	
	delay = 10* (pickleNumber -1);
	
	with(obj_follower)
	{
		angle = pickleNumber/obj_player.var_picklesFollowing *360;
	};
	
	if(pickleNumber > 2)
	{
		screenshake(10, .6, .2)
	};
};

if(var_touched) //If touched by the player follow behind em until you go to the next screen
{
	if(instance_exists(obj_player))
	{
		if(var_destroy)
		{	
			if(instance_exists(obj_barrierKeyhole))
			{
				var _keyHole = instance_nearest(x, y, obj_barrierKeyhole)
				
				if(canLerp = true)
				{
					x = lerp(x, _keyHole.x+8, .1);
					y = lerp(y, _keyHole.y+8, .1);
			
					if(round(x) = _keyHole.x+8) and (round(y) = _keyHole.y+8)
					{
						instance_destroy();
						audio_play_sound(sfx_key, 0, 0)
						with(_keyHole)
						{
							var_breaking = true;
							alarm[0] = 5;
						}
						obj_player.var_picklesFollowing --;
						
						if(instance_exists(obj_follower))
						{
							if(obj_follower.pickleNumber > pickleNumber)
							{
								with(obj_follower)
								{
									obj_follower.pickleNumber --;
								};
							};
						};
					};
				}
				else
				{
					if(alarm[0] = -1)
					{
						if(delay != 0)
						{
							alarm[0] = delay
						}
						else
						{
							alarm[0] = 1
						};
					};
					
					pickleFollow();
				};
			}
			else
			{
				instance_destroy();
				obj_player.var_picklesFollowing --;
			}
		}
		else
		{
			pickleFollow();
		};
	};

	persistent = true;
}

else
{
	y += osc_step(1, .1); //Oscillate in place
}