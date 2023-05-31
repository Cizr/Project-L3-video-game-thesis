/// @description Insert description here
// You can write your code in this editor
var _camX = camera_get_view_x (view_camera[0]);
var _camY = camera_get_view_y (view_camera[0]);
hudX = _camX + (camera_get_view_width(view_camera[0]) / 2);
hudY = _camY + (camera_get_view_height(view_camera[0]) / 2);


if global.quiz_state == QUIZ_STATE.COMPLETED {
	instance_destroy();
}


// Desotry True False buttons
if ((global.quiz_state == QUIZ_STATE.CORRECT) or (global.quiz_state == QUIZ_STATE.WRONG)) {
	if instance_exists(true_button) {
		instance_destroy(true_button);
	}
	if instance_exists(false_button) {
		instance_destroy(false_button);
	}
}
