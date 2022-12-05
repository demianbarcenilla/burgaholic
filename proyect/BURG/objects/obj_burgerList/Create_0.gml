ini_open("lang"+string(global.var_lang)+".ini")
	for(i = 0; i < 168; i++)
	{
		arr_burgers[i, 0] = ini_read_string("burgNames", i, "!MISSING")
		arr_burgers[i, 1] = ini_read_string("burgDescriptions", i, "!MISSING")
	};
ini_close();

var_xsel = 0; //the x position u selected on the grid
var_ysel = 0; //the y position -----

var_page = 0;