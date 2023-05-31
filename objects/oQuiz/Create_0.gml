/// @description Insert description here
// You can write your code in this editor

// Create True and False buttons.
// You have to figure this one out.
// ON_LMB_CLICK Event call the sumbit_quiz_answer() function.

var _camX = camera_get_view_x (view_camera[0]);
var _camY = camera_get_view_y (view_camera[0]);
hudX = _camX + (camera_get_view_width(view_camera[0]) / 2);
hudY = _camY + (camera_get_view_height(view_camera[0]) / 2);

x = hudX;
y = hudY;

depth = -10000000000000000000;

button_offset_x = 50;
button_offset_y = 64;

true_button = instance_create_layer(x - button_offset_x, y + button_offset_y, "Text", oQuizButton, {
type : 1,
image_index : 0
});


false_button = instance_create_layer(x + button_offset_x, y + button_offset_y, "Text", oQuizButton, {
type : 0,
image_index : 1
});
	
continue_button = noone;