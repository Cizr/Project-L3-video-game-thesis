// Define player radius
var _radius = 64;

// Get the distance between the player and the mouse cursor
var _distance = point_distance(x, y, mouse_x, mouse_y);

// Check if the mouse cursor is within the player radius
if (_distance <= _radius)
{
    msg_dynamic("Congratulations, you've found the Planet Java Orb! Press 'E' to collect it and gain invaluable knowledge for your next adventure.");
}

// Draw the sprite
draw_sprite(sprite_index, image_index, x, y);
