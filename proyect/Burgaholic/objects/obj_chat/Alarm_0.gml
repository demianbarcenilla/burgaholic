var i = 0

ini_open("lang_" + global.langString + ".ini")
	while(ini_key_exists(var_chat, i))
	{
		arr_dialogue[i] = ini_read_string(var_chat, i, "That's It!");
		i++;
	};
ini_close();