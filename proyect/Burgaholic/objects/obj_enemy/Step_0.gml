// You can write your code in this editor

//Reset Hit Sequence
if(var_hitSeq)
{
	//if(alarm[10] = -1) {alarm[10] = 15};
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
/*
show_debug_message("HITSEQ: " + string(var_hitSeq))
show_debug_message("DESPAWNED: " + string(despawned))