//float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(2,floatDir);

if place_meeting(x, y, oPlayer)
{
    // Slow down the player
    oPlayer.moveSpd *= slowAmount;

    // Start a timer to restore the player's speed after slowDuration seconds
   oPlayer.alarm[0] = room_speed * slowDuration;

    // Destroy the potion object
    instance_destroy();
}
