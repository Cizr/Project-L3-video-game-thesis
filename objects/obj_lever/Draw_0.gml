draw_sprite(sprite_index, image_index, x, y);



if (instance_exists(obj_door)) {
    if (obj_door.image_index == 1) {
        // obj_door is unlocked, do something here
        // for example, destroy the lever instance
        instance_destroy();
    } else {
		if (position_meeting(mouse_x, mouse_y, id)) {

        // obj_door is locked, show message to player
        msg_static("First: Const");
		}
    }
}
