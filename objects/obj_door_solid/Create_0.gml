/// @description 
image_speed = 0;

solid_target = instance_create_layer(x,y,"Collision",obj_solid);

//scale up

var height_scale = sprite_height /solid_target.sprite_height;
var width_scale = sprite_width /solid_target.sprite_width;


solid_target.image_xscale = width_scale;
solid_target.image_yscale = height_scale;




