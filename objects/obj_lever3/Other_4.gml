/// @description 

for (var i = 0; i< instance_number(obj_door); i++){
	var instance = instance_find(obj_door,i);
	if (instance != noone) {
		if(string_lower(instance.name) == string_lower(door_name)) {
			target= instance;
			break;
		}
	}
}
