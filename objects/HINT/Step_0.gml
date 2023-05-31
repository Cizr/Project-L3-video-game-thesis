if(place_meeting(x,y,oPlayer)) {

    //if i didnt make text box make one
    if (keyboard_check_pressed(vk_space)) {
    if (myTextbox == noone) {
    myTextbox = instance_create_layer(x,y,"Text",obj_textbox);
    myTextbox.text =myText;
    myTextbox.creator = self;
    myTextbox.name = myName;
    }
    }
} else {
    if(myTextbox !=noone) {
    instance_destroy(myTextbox);
    myTextbox = noone;
    }
}




// Add this code to the Step Event of the NPC object
if distance_to_object(oPlayer) < interaction_radius {
   // Create an instance of the interaction hint object if it doesn't exist
   if !instance_exists(obj_Popup) {
      instance_create_layer(x, y - 32, "instances", obj_Popup);
   }
} else {
   // Destroy any existing instances of the interaction hint object
   if instance_exists(obj_Popup) {
      instance_destroy(obj_Popup);
   }
}