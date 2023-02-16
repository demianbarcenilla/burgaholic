var _halfSprite = 12;

x = room_width +_halfSprite
y -=2;
roomCooldown = true;
		
if(instance_exists(obj_pickle))
{
	with(obj_pickle)
	{
		if(var_touched)
		{
			x = (room_width +_halfSprite-15) *pickleNumber;
		};
	};
}