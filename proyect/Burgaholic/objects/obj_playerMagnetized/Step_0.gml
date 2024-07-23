if(instance_exists(obj_bossPond))
{
	if(obj_bossPond.var_state != GREG_STATE.separating)
	{
		sprite_index = spr_playerCorpse;
	};
}

collisionBasic();