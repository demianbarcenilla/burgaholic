/// @description Displace
draw_set_color(WHITE);
var	_ammount = .25,

	_border = 16,
	_center = sprite_get_width(spr_pickleGhost)/2,
	
	_margin = 4,
	_width =  display_get_gui_width() -_border -_center +camera_get_view_x(view),
	_height = display_get_gui_height() -_border -_center +camera_get_view_y(view);
	
x = lerp(x, _width, _ammount)
y = lerp(y, _height, _ammount)

//if((floor(x) = floor(_width)) and (floor(y) = floor(_height)))
if((x < _width +_margin) and (x > _width -_margin))
{
	freezeFrame(30);
	screenshake(5, 2, .2);
	
	global.showGUI_pickle = true;
	global.pickleCount++;
	
	audio_play_sound(sfx_pickleGhost, 10, false)
	
	instance_destroy();
};