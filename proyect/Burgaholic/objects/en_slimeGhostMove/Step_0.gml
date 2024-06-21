var _dir = point_direction(x, y, obj_player.x, obj_player.y),
	_dirX = lengthdir_x(2, _dir),
	_dirY = lengthdir_y(2, _dir);

var_spd = lerp(var_spd, _dirX, .1);
var_vspd = lerp(var_vspd, _dirY, .1);

if(place_meeting(x+sign(var_spd), y, en_slimeGhostMove))
{
	var_spd *= -1;
	var_vspd *= -1;
}

x += var_spd;
y += var_vspd;