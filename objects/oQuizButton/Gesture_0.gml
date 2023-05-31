
if type == 0 or type == 1 {
	quiz_submit_answer(type);
} else {
	quiz_close();
	instance_destroy();
}