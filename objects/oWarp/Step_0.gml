
if (room == targetRoom)
{
 
    oPlayer.x = targetObj.x;
    oPlayer.y = targetObj.y;
    oPlayer.face = targetObj.image_index;

  
}

//destroy self when done reverse
if image_speed == -1 && image_index < 1
{
    instance_destroy();
}