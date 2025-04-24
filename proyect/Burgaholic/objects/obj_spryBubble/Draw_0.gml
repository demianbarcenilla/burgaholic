if(var_flash)
{
	gpu_set_fog(true, c_white, 0, 10)
		draw_self();
	gpu_set_fog(false, c_white, 0, 10)
	
	stepAlarm(0, 5);
}
else
{
	draw_self();
}