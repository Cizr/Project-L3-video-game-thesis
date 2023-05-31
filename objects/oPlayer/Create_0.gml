
//damage setup
get_damaged_create(20,true);

//movement var
moveDir = 0;
moveSpd =2;
xspd= 0;
yspd= 0;



shieldActive = false;    // Flag to track if the shield is active or not


//Sprite control
		centerYoffset = -5;
		centerY = y + centerYoffset;//set in step event
	weaponOffsetDist = 4;

		aimDir = 0;
		face = 3;
		sprite [0] = sPlayerRight;
		sprite [1] = sPlayerUp;
		sprite [2] = sPlayerLeft;
		sprite [3] = sPlayerDown;


//weapon info

shootTimer= 0;


//add weapons to player weapon inv
array_push (global.PlayerWeapons,global.WeaponList.blueRod);

selectedWeapon = 0;

weapon = global.PlayerWeapons[selectedWeapon];

global.dialogo = false;
global.tecla= -1;


// Declare global variables for the orb's position
global.orb_x = undefined;
global.orb_y = undefined;


