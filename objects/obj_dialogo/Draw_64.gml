if inicializar == true {
	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _xx=0;
	var _yy= _guia - 200;
	var _c = c_black;
	var _sprite = texto_grid[# Infos.Retrato, pagina];
	var _texto =string_copy(texto_grid[# Infos.Texto, pagina],0,caractere);
	draw_set_font(fnt_dialogo);

	//Lado esquerdo
	if texto_grid[# Infos.Lado, pagina] == 0{
		draw_rectangle_color(_xx+200,_yy,_guil,_guia,_c,_c,_c,_c,false);
		draw_text(_xx +216, _yy-32,texto_grid[# Infos.Nome, pagina]);
		draw_text_ext(_xx+232 ,_yy+32 ,_texto, 32, _guil - 264);
		draw_sprite_ext(_sprite,0,100, _guia,3,3,0,c_white,1);
	}else {
		
		draw_rectangle_color(_xx, _yy, _guil-200,_guia,_c,_c,_c,_c,false);
		var _stgw = string_width(texto_grid[# Infos.Nome, pagina]);
		draw_text(_guil-216-_stgw, _yy-32,texto_grid[# Infos.Nome, pagina]);
		draw_text_ext(_xx + 32, _yy + 32, _texto,32,_guil - 264);
		draw_sprite_ext(_sprite,0, _guil-100,_guia ,-3,3,0,c_white,1);
	}
	if op_draw == true {
		var _opx=_xx+32;
		var _opy =_yy-48;
		var _opsep = 48;
		var _opborda = 6;
		op_selecionada += keyboard_check_pressed(ord("E")) -keyboard_check_pressed(ord("T"));
		op_selecionada = clamp(op_selecionada,0,op_num-1);
		
		for (var i=0; i< op_num;i++){
			var _stringw=string_width(op[i]);
			draw_sprite_ext(spr_op_background,0,_opx,_opy-(_opsep*i),(_stringw + _opborda*2)/16,1,0,c_white,1 );
			draw_text(_opx + _opborda,_opy-(_opsep*i),op[i]);
			
						if op_selecionada == i {
							draw_sprite(spr_op_seletor,0,_xx+8,_opy-(_opsep*i)+8);
					}
		}
		
		if global.tecla{
			var _dialogo = instance_create_layer(x,y,"Dialogo",obj_dialogo);
			_dialogo.npc_nome= op_resposta[op_selecionada];
			
			instance_destroy();
		}
	}
}