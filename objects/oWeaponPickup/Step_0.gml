
floatDir +=floatSpd
y= ystart + dsin(floatDir)*1

//check if we have it
var _size = array_length(global.PlayerWeapons);
for (var i = 0; i <  _size; i++)
{
	if weapon == global.PlayerWeapons[i]
	{
	instance_destroy();
	exit;
	}
}

//weapon pick up add weapon list
if place_meeting(x,y,oPlayer)
{
	//add weapon
	array_push (global.PlayerWeapons, weapon);
	//set as primary
	oPlayer.selectedWeapon = array_length (global.PlayerWeapons) -1;
	//destroy
	instance_destroy();
}


