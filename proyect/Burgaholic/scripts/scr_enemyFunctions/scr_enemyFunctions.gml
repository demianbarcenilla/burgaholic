function enemy_wallBounce(dirt)
{
	if(place_meeting(x+sign(var_spd), y, obj_wall))
	{
		var_spd = -var_spd;
		if(dirt) vfx_dirt();
		screenshake(5, 2, .1);
	};

	if(place_meeting(x, y+sign(var_vspd), obj_wall))
	{
		var_vspd = -var_vspd;
		if(dirt) vfx_dirt();
		screenshake(5, 2, .1);
	};
}

function enemy_proyCreate(object, assignHspd, assignVspd)
{
	var _proy = instance_create_depth(x, y, depth+1, obj_slimeFall);
		_proy.var_spd = assignHspd;
		_proy.var_vspd = assignVspd;
}

function boss_draw()
{
	if(var_shake)
	{
		draw_sprite(sprite_index, image_index, x+shk_step(1), y +shk_step(1));
	}
	else
	{
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, var_angle, image_blend, 1);
	};
};

function bossFridge_spawnSpikes()
{
	var _closestSpike = 32,
		_furthestSpike = 64;
	instance_create_depth(x -_closestSpike, y, depth, obj_bossFriSpike)
	instance_create_depth(x -_furthestSpike, y, depth, obj_bossFriSpikeLarge)
			
	var _rightSpike = instance_create_depth(x +_closestSpike, y, depth, obj_bossFriSpike),
		_rightSpikeLarge =instance_create_depth(x +_furthestSpike, y, depth, obj_bossFriSpikeLarge);
			
	_rightSpike.image_xscale = -1;
	_rightSpikeLarge.image_xscale = -1;
};

function bossReef_createBullets(vspd, grav)
{
	var _leftBullet = instance_create_depth(x, y-32, depth+1, obj_bossReeBullet),
		_righBullet = instance_create_depth(x, y-32, depth+1, obj_bossReeBullet);

	_leftBullet.var_spd = -5;
	_righBullet.var_spd = 5;
	
	_leftBullet.var_grav = grav;
	_righBullet.var_grav = grav;
	
	_leftBullet.var_vspd = vspd;
	_righBullet.var_vspd = vspd;
}

function onHit_backwardsBounce()
{	
	with(obj_player)
	{
		var_spd = -image_xscale*var_mspd*4; 
		var_vspd = -var_jspd*1.3; 
		k_dirCap = sign(var_spd); 
		image_xscale = sign(var_spd)}
};

function onHit_backwardsBounceBOSS()
{
	repeat(5){instance_create_depth(x, y-32, depth, obj_wasteFX)};
	
	with(obj_player)
	{
		var_spd = -image_xscale*var_mspd*4; 
		var_vspd = -var_jspd*1.3; 
		k_dirCap = sign(var_spd); 
		image_xscale = sign(var_spd)}
};