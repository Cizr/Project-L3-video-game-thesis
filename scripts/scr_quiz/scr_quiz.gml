global.question_array = [];
global.quiz_state = QUIZ_STATE.COMPLETED;
global.is_quiz_active = false;
global.quiz_score = 0;
global.recent_questions = [];

#macro QUIZ_FREEQUENCY 4
randomise();


enum QUIZ_STATE {
MAIN,
WRONG,
CORRECT,
COMPLETED
}


function Question(_str, _correct_ans) constructor {
question = _str;
correct_answer = _correct_ans;

array_push(global.question_array, self);
}


function newQuestion(_str, _correct_ans) {
var _q = new Question(_str, _correct_ans);
}


function trigger_quiz_event() {
if global.is_quiz_active { return } // Guard Clause

global.enemyKillCountQuiz = global.enemyKillCount;
global.current_question = get_random_question();
global.is_quiz_active = true;
global.correct_answer = global.current_question.correct_answer;
global.current_question = global.current_question.question;
global.quiz_state = QUIZ_STATE.MAIN;
// Please implement some way to pause the game maybe pause_game(true);
instance_create_layer(oPlayer.x, oPlayer.y, "Text", oQuiz);

}


function get_random_question() {
var _len = array_length(global.question_array);

// Pick Question
var _question_num = irandom_range(0, _len-1);

// Pick new if it was recent
while array_contains(global.recent_questions, _question_num, 0, array_length(global.recent_questions)) {
_question_num = irandom_range(0, _len-1);
}

// Add to recent array
array_push(global.recent_questions, _question_num);

// Remove old questions from recent array
if array_length(global.recent_questions) > floor(_len / 2) {
array_delete(global.recent_questions, 0, 1);
}
return global.question_array[_question_num];
}


function quiz_submit_answer(_bool) {
if global.correct_answer == _bool {
global.quiz_score += 1;
quiz_go_to_correct_answer();
} else {
quiz_go_to_wrong_answer();
}
with(oQuiz){
continue_button = instance_create_layer(x, y + button_offset_y, "Text", oQuizButton, {
type : 2,
image_index : 2
});
}
}


function quiz_go_to_correct_answer() {
// Maybe play sound effect
// Maybe do some other stuff
global.quiz_state = QUIZ_STATE.CORRECT;
}


function quiz_go_to_wrong_answer() {
// Maybe play sound effect
// Maybe do some other stuff
global.quiz_state = QUIZ_STATE.WRONG;
}


function quiz_close() {
// Maybe play sound effect
// Maybe do some other stuff
global.quiz_state = QUIZ_STATE.COMPLETED;
global.is_quiz_active = false;
}


#region Generate Questions ========================================================
newQuestion("Java is an object-oriented programming language.", true);
newQuestion("In Java,(==) is used to compare two strings. ", false);
newQuestion("In Java, a variable can only hold one value at a time.", true);
newQuestion("Java is primarily used for creating desktop applications", false);
newQuestion("In Java, the (++) operator increments a variable by 2.", false);
newQuestion("A Java array can only hold elements of the same data type", true);
newQuestion("Java was originally called (Oak) before it was renamed to Java. ", true);
#endregion