// You can write your code in this editor

//Reset Hit Sequence
if(var_hitSeq)
{
	if(obj_player.var_state != STATE_MACHINE.hit){despawned = true};
}	
else if (!despawned)
{
	sprite_index = var_idleSprite;
}
else
{
	sprite_index = spr_blank;
}