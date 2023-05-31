depth = -y;

floatDir = 0;
floatSpd =  6;

weapon = global.WeaponList.yellowRod;
if image_index == 0
{ 
	weapon = global.WeaponList.blueRod;
}
if image_index == -1
{
	weapon = global.WeaponList.yellowRod;
}

if image_index == 1
{
	weapon = global.WeaponList.RedRod;
}

//set correct sprite
sprite_index = weapon.pickupSprite;
image_index = 0;

//check if we have it
var _size = array_length(global.PlayerWeapons);
for (var i = 0; i <  _size; i++)
{
	if weapon == global.PlayerWeapons[i]
	{
	instance_destroy();
	}
}