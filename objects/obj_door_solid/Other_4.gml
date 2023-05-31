array_idx = 0;
lever_array = [];

// Add instances of obj_lever, obj_lever2, and obj_lever3 to lever_array
for(var i=0; i<instance_number(obj_lever); i++){
	var instance = instance_find(obj_lever, i);
	if(string_lower(instance.door_name) == string_lower(name)){
		lever_array[array_idx] = instance;
		array_idx += 1;
	}
}

for(var i=0; i<instance_number(obj_lever2); i++){
	var instance = instance_find(obj_lever2, i);
	if(string_lower(instance.door_name) == string_lower(name)){
		lever_array[array_idx] = instance;
		array_idx += 1;
	}
}

for(var i=0; i<instance_number(obj_lever3); i++){
	var instance = instance_find(obj_lever3, i);
	if(string_lower(instance.door_name) == string_lower(name)){
		lever_array[array_idx] = instance;
		array_idx += 1;
	}
}
