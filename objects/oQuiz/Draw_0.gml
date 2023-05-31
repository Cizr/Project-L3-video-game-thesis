/// @description Insert description here
// You can write your code in this editor


// Draw nineslice border thing for them here please.
// Maybe add some cool sprite saying like QUIZ TIME!!! or something. 

var _xscale = 5;
var _yscale = 3;
var _width = sprite_get_width(spr_quiz_border) * _xscale;
var _height = sprite_get_height(spr_quiz_border) * _yscale;
var _x = oPlayer.x;
var _y = oPlayer.y;
var _results_offset = -28;

//ger cam coord

var _camX = camera_get_view_x (view_camera[0]);
var _camY = camera_get_view_y (view_camera[0]);

//central HUD coord
hudX = _camX + (camera_get_view_width(view_camera[0]) / 2);
hudY = _camY + (camera_get_view_height(view_camera[0]) / 2);

depth = -10000000000000000001;
draw_sprite_ext(spr_quiz_border, 0 , hudX - (_width/2), hudY - (_height/2), _xscale, _yscale, 0, c_white, 1);

var _temp = draw_get_halign();
draw_set_halign(fa_center);

switch(global.quiz_state) {

	case QUIZ_STATE.MAIN:
		// Place it somewhere good :) x, y is temp
		draw_text_ext(hudX, hudY - 32, global.current_question, 18, _width - 64);
		
		break

	case QUIZ_STATE.WRONG:
		// Draw a sad sprite or some sad text or both?
		draw_sprite(spr_quiz_results, 0, hudX, hudY + _results_offset);
		break
		
	case QUIZ_STATE.CORRECT:
		// Draw a sad sprite or some sad text or both?
		draw_sprite(spr_quiz_results, 1, hudX, hudY + _results_offset);
		break
		
}

if global.quiz_state == QUIZ_STATE.WRONG or global.quiz_state == QUIZ_STATE.CORRECT {
	draw_text(hudX, hudY, "Correct Answers: " + string(global.quiz_score));
}

if instance_exists(false_button){ draw_sprite(false_button.sprite_index, false_button.image_index, false_button.x, false_button.y); }
if instance_exists(true_button){ draw_sprite(true_button.sprite_index, true_button.image_index, true_button.x, true_button.y); }
if instance_exists(continue_button){ draw_sprite(continue_button.sprite_index, continue_button.image_index, continue_button.x, continue_button.y); }

draw_sprite(spr_quiz_logo,0,  hudX, hudY - (_height / 2));

draw_set_halign(_temp);