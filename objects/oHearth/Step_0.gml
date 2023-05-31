//float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(2,floatDir);

//collected by plaer
if place_meeting(x,y, oPlayer)
{
	//heal player
	oPlayer.hp += heal;
	
	//destroy self
	instance_destroy();
}


