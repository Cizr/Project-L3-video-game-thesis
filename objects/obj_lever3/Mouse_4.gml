/// @description 
image_index += 1;
enabled = !enabled;

if(target !=noone){
	with (target) {
		event_user(0);
	}
}