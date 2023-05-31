//constructor template for weapons
function create_weapon(  _sprite = sBlueRod, _weaponLength = 0, _bulletObj = oBlueBullet, _cooldown = 1, _bulletNum = 1, _spread = 0, _pickupSprite = sBlueRodPickup) constructor
{

	sprite = _sprite;
	length = _weaponLength;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
}
//the player's weapon inv
global.PlayerWeapons = array_create (0);

//the weapons

global.WeaponList = {
		blueRod : new create_weapon(
		sBlueRod, sprite_get_bbox_right(sBlueRod) - sprite_get_xoffset(sBlueRod),
							oBlueBullet,
							15,
							2,
						    0,
					sBlueRodPickup
							),
		yellowRod : new create_weapon(
							sYellowRod,
							sprite_get_bbox_right (sYellowRod) -sprite_get_xoffset (sYellowRod),
							oYellowBullet,
							6,
							1,
							0,
							sYellowRodPickup
							
							),
		RedRod : new create_weapon(
							sRedRod,
							sprite_get_bbox_right (sRedRod) -sprite_get_xoffset (sRedRod),
							oRedBullet,
						    20,
							7,
							70,
						    sRedRodPickup
							),
	
}
	

