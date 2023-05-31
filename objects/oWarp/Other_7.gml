// Check if the animation has not already played
if 	image_speed == 1 
{
	// Reverse the animation
	image_speed = -1;
	
	// Go to the correct room
	room_goto(targetRoom);
}
