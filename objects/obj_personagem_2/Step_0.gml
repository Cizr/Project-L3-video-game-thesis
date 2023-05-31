// Add this code to the Step Event of the NPC object
if distance_to_object(oPlayer) < interaction_radius {
   // Create an instance of the interaction hint object if it doesn't exist
   if !instance_exists(obj_Popup8) {
      instance_create_layer(x, y - 32, "Dialogo", obj_Popup8);
   }
} else {
   // Destroy any existing instances of the interaction hint object
   if instance_exists(obj_Popup8) {
      instance_destroy(obj_Popup8);
   }
}