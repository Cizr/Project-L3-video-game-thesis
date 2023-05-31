//float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(2,floatDir);

if place_meeting(x, y, oPlayer)
{
    // Activate shield effect
    oPlayer.shieldActive = true;

    // Start a timer to deactivate the shield after shieldDuration seconds
    oPlayer.alarm[0] = room_speed * shieldDuration;

    // Destroy the potion object
    instance_destroy();
}
