//OSCILATE

if(place_meeting(x, y, obj_player)) and (!var_touched)
{
	var_touched = true;
	
	obj_player.var_picklesFollowing ++;
	pickleNumber = obj_player.var_picklesFollowing;
	
	delay = 10* (pickleNumber -1);
	
	with(obj_pickle)
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
			
			if(instance_exists(obj_checkpoint))
			{
				if(canLerp = true)
				{
					x = lerp(x, obj_checkpoint.x, .1);
					y = lerp(y, obj_checkpoint.y-16, .1);
			
					if(round(x) = obj_checkpoint.x) and (round(y) = obj_checkpoint.y-16)
					{
						instance_destroy();
						obj_control.drawPickle = true;
						global.pickles ++;
						obj_player.var_picklesFollowing --;
					}
				};
				else
				{
					if(alarm[0] = -1)
					{
						if(delay != 0)
						{
							alarm[0] = delay
						};
						else
						{
							alarm[0] = 1
						};
					}
					
					pickleFollow();
				};
			}
			else
			{
				instance_destroy();
				obj_control.drawPickle = true;
				global.pickles ++;
				obj_player.var_picklesFollowing --;
			}
		}
		else
		{
			pickleFollow();
		};
	};

	persistent = true;
};
else
{
	y += osc_step(1, .1); //Oscillate in place
}