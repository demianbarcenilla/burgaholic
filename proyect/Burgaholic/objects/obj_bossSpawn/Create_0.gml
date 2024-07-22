xx = room_width/4-32;
yy = room_height-16;

switch(global.stage)
{
	case stage.forest: 
		var_boss = en_bossFor;
	break;
	
	case stage.volcano: 
		var_boss = en_bossVol;
	break;
	
	case stage.beach: 
		var_boss = en_bossBea;
		yy = 111;
	break;
	
	case stage.rust: 
		var_boss = en_bossFri;
	break;
	
	case stage.reef: 
		var_boss = en_bossRee;
	break;
	
	case stage.ashtray: 
		var_boss = en_bossAsh;
	break;
	
	case stage.core: 
		var_boss = en_bossCor;
	break;
	
	case stage.pond: 
		var_boss = en_bossFri;
	break;
	
	default: 
		var_boss = en_bossFor;
	break;
}