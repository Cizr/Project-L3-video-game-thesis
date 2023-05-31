var staticRadius = 100;

var text_speed = 2;

if (image_index == 0) {
	if (distance_to_object(oPlayer) <= staticRadius) {
    msg_static("Which keyword is used to define a constant value in Java?.   Hint : I am the alpha, the beginning of all. Set me to the RIGHT, the rest shall fall.");
	}
} else if (image_index == 1) {
    var finished = msg_dynamic("Congrats you passed ! This message will fade away in. .  . .            ",text_speed);
    if (finished) {
        instance_destroy();
    }
} 
