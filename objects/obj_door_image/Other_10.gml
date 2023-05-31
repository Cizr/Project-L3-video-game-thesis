var can_unlock=true;

for(var idx=0; idx < array_length_1d(lever_array); idx++) {
	
	var instance = lever_array[idx];
	
	if(instance.has_to_be_enabled!=instance.enabled){
		can_unlock= false;
		break;
	}
}

if(can_unlock){
	image_index = 1;
} else {
	image_index= 0;
}
