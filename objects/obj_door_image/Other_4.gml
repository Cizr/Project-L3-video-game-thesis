array_idx = 0;

for(var i=0; i<instance_number(obj_lever); i ++){
	var instance = instance_find(obj_lever, i ) ;
	if(string_lower(instance.door_name) == string_lower(name)){
		lever_array[array_idx]= instance;
		array_idx +=1;
	}
}

