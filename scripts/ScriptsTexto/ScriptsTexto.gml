// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_textos(){
	
	
	switch npc_nome {
	
	case "Segundo Texto":
	ds_grid_add_text("What's this? It looks like some kind of advanced technology.",spr_retrato_1,0,"Player");
	ds_grid_add_text("*flashes a message on the screen* ",spr_retrato_3,1,"Robot Screen");
	ds_grid_add_text(" I seem to have lost connection with my main robot unit. I apologize for the inconvenience. How can I assist you with the limited functionality I have? ",spr_retrato_3,1,"Robot Screen");
	add_op("What happened to your main robot unit?",  "Resposta 1");
	
	break;
	case "Resposta 1":
	ds_grid_add_text("During our interstellar mission to retrieve the lost programming languages, a cosmic event disrupted our communication systems. The main robot unit was separated from me, leaving me stranded here. I'm currently unable to establish a connection or locate its precise location. ",spr_retrato_3,1,"Robot Screen");
	ds_grid_add_text("Can you provide any information about the current state of affairs? ",spr_retrato_1,0,"Player");
	ds_grid_add_text("*flashes a message on the screen* Did you know? In Java, the '%' operator is used to calculate the remainder of a division operation. For example, '5 % 2' would result in '1' because the remainder of dividing 5 by 2 is 1.",spr_retrato_3,1,"Robot Screen");
	ds_grid_add_text("*flashes a message on the screen* Did you know? In Java, the '+= ' operator can be used to shorten code by combining addition and assignment. For example, instead of writing 'x = x + 5', you can simply write 'x += 5'.",spr_retrato_3,1,"Robot Screen");
		ds_grid_add_text("Thanks...*notices his name on the back* BMO? ",spr_retrato_1,0,"Player");
		ds_grid_add_text("*Flashes a series of vibrant colors* ",spr_retrato_3,1,"Robot Screen");
		break;
	}

	
	
	
 	switch npc_nome{
		case "Primeiro Texto":
		ds_grid_add_text("I..i-just found a new robot ",spr_retrato_1,0,"Personagem 1");
		ds_grid_add_text("Old Robot test ",spr_retrato_2,1,"Personagem 2");
		ds_grid_add_text("Can i help you in any way? ",spr_retrato_1,0,"Personagem 1");
		ds_grid_add_text("Too late im shut down",spr_retrato_2,1,"Personagem 2");
		
				add_op("Test Answer 1",  "Resposta 1");
				add_op("Test Answer 2",   "Resposta 2");
				add_op("Test Answer 3",  "Resposta 3");
		
				
		break;
		
		
		
				
							
				break;
				
				case "Resposta 2":
				ds_grid_add_text("second reply ",spr_retrato_1,0,"Personagem 1");
				ds_grid_add_text("Test text ",spr_retrato_2,1,"Personagem 2");
				break;
				
				case "Resposta 3":
				ds_grid_add_text("Third reply ",spr_retrato_1,0,"Personagem 1");
				ds_grid_add_text("Test text ",spr_retrato_2,1,"Personagem 2");
				break;
				
				case "Resposta 5":
							ds_grid_add_text("IM NOT STOPPING ",spr_retrato_1,0,"Personagem 1");
							ds_grid_add_text("sorry kid ",spr_retrato_2,1,"Personagem 2");
							break;
				case "Resposta 6":			
							ds_grid_add_text("i'll stop ",spr_retrato_1,0,"Personagem 1");
							ds_grid_add_text("sorry kid ",spr_retrato_2,1,"Personagem 2");
							break;
	}
}




		








  
  
function ds_grid_add_row(){
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
	return (ds_grid_height(_grid)-1);
}



function ds_grid_add_text(){
	var _grid = texto_grid;
	var _y = ds_grid_add_row(_grid);
 
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}


function add_op(_texto,_resposta){
op[op_num] = _texto;
op_resposta[op_num] = _resposta;

op_num++;
}