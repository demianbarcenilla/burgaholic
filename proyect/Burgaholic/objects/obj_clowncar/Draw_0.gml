draw_self();
//DRAW IN THE CORRECT DIRECTION
if(var_dir > 22.5) and (var_dir <= 67.5)
{
	image_index = 1
}
else if(var_dir > 67.5) and (var_dir <= 112.5)
{
	image_index = 2
}
else if(var_dir > 112.5) and (var_dir <= 157.5)
{
	image_index = 3
}
else if(var_dir > 157.5) and (var_dir <= 202.5)
{
	image_index = 4
}
else if(var_dir > 202.5) and (var_dir <= 247.5)
{
	image_index = 5
}
else if(var_dir > 247.5) and (var_dir <= 292.5)
{
	image_index = 6
}
else if(var_dir > 292.5) and (var_dir <= 337.5)
{
	image_index = 7
}
else
{
	image_index = 0
};