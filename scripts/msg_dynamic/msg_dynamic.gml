/// @param message_string
/// @param speed_key_optional
/// @param grid_sprite_optional
/// @param arrow_sprite_optional
function msg_dynamic() {

	//Sets drawing offset to the middle top of the sprite
	var xm = (sprite_width/2) - sprite_xoffset;
	var ym = -sprite_yoffset;

	//Default sprites used for the textbox
	var grid_sprite = spr_msg_grid;
	var arrow_sprite = spr_msg_arrow;

	//Set sprites from the arguments, if they have been given
	if (argument_count>2) grid_sprite = argument[2];
	if (argument_count>3) arrow_sprite = argument[3];

	if (!variable_instance_exists(id, "char")) char = 0;
	//This is the speed at which the text is drawn. You may change it:
	var text_speed = 0.25;
	if (argument_count>1){
		if (keyboard_check(argument[1])==true){
			//this is the boosted text speed
			text_speed = 0.6;
		}
	}

	var msg_org = argument[0];
	var msg = string_copy(msg_org, 1, min(floor(char + text_speed), string_length(msg_org)));
	//The 200 there is the maximum width the text box can have before wrapping the text to the next line:
	var max_width = min(string_width(msg_org), 200);
	var max_height = string_height_ext(msg, -1, max_width);

	//get cell size
	var cell_size = sprite_get_width(grid_sprite)/3;

	//draw textbox
	//textbox height (above player sprite)
	var height = sprite_get_height(arrow_sprite) - sprite_get_yoffset(arrow_sprite);
	//get position
	var x_loc = x + xm;
	var y_loc = (y + ym) - height;
	//get arrow offset
	var arrow_xm = sprite_get_width(arrow_sprite)/2 - sprite_get_xoffset(arrow_sprite);
	//top left corner
	draw_sprite_part(grid_sprite, 0, 0, 0, cell_size, cell_size, x_loc - ((max_width/2)+cell_size), y_loc - (max_height + cell_size*2));
	//top right corner
	draw_sprite_part(grid_sprite, 0, cell_size*2, 0, cell_size, cell_size, x_loc + (max_width/2), y_loc - (max_height + cell_size*2));
	//top part
	draw_sprite_part_ext(grid_sprite, 0, cell_size, 0, cell_size, cell_size, x_loc - (max_width/2), y_loc - (max_height + cell_size*2), max_width/cell_size, 1, c_white, 1);
	//bottom left corner
	draw_sprite_part(grid_sprite, 0, 0, cell_size*2, cell_size, cell_size, x_loc - ((max_width/2)+cell_size), y_loc - cell_size);
	//left part
	draw_sprite_part_ext(grid_sprite, 0, 0, cell_size, cell_size, cell_size, x_loc - ((max_width/2)+cell_size), y_loc - (max_height + cell_size), 1, max_height/cell_size, c_white, 1);
	//bottom right corner
	draw_sprite_part(grid_sprite, 0, cell_size*2, cell_size*2, cell_size, cell_size, x_loc + (max_width/2), y_loc - cell_size);
	//right part
	draw_sprite_part_ext(grid_sprite, 0, cell_size*2, cell_size, cell_size, cell_size, x_loc + (max_width/2), y_loc - (max_height + cell_size), 1, max_height/cell_size, c_white, 1);
	//bottom part
	draw_sprite_part_ext(grid_sprite, 0, cell_size, cell_size*2, cell_size, cell_size, x_loc - (max_width/2), y_loc - (cell_size), max_width/cell_size, 1, c_white, 1);
	//center part
	draw_sprite_part_ext(grid_sprite, 0, cell_size, cell_size, cell_size, cell_size, x_loc - (max_width/2), y_loc - (max_height + cell_size), max_width/cell_size, max_height/cell_size, c_white, 1);
	//arrow
	draw_sprite(arrow_sprite, 0, x_loc - arrow_xm, y_loc);
	//text
	draw_text_ext(x_loc - (max_width/2), y_loc - (max_height + cell_size), msg, -1, max_width);
	//other
	char += text_speed;

	//message complete
	return (char >= string_length(msg_org))


}
