draw_set_color(#8DD243)
draw_rectangle(0, y+14, room_width, room_height, false)

for(i=0; i < 20; i++)
{
	draw_sprite(spr_wastePool, -.4, x+(i*16), y)
};