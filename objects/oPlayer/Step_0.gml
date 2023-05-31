// inputs
rightKey = global.rightKey;
leftKey = global.leftKey;
downKey = global.downKey;
upKey = global.upKey;
shootkey =global.shootkey;
swapKeyPressed = global.swapKeyPressed;
startKeyPressed = global.startKeyPressed

//pause menu
if startKeyPressed
{
	if !instance_exists(oPauseMenu)
	{
		instance_create_depth(0,0,0,oPauseMenu);
	} else {
		instance_destroy(oPauseMenu);
	}
}

if instance_exists(oWarp)
	{
		image_index = 0;
		sprite_index = sprite[face];
		aimDir = face*90;
		centerY = y + centerYoffset;
	}

//pause game for player

if screen_pause() {exit;};


//player movements
#region
// the direction
var _horizKey = rightKey - leftKey;
var _vertKey = downKey - upKey;
moveDir = point_direction(0,0,_horizKey,_vertKey );
//x y speed
var _spd = 0;
var _inputlevel =point_distance(0,0,_horizKey,_vertKey );
_inputlevel = clamp(_inputlevel, 0 , 1);
_spd = moveSpd * _inputlevel;

xspd = lengthdir_x(_spd, moveDir);
yspd = lengthdir_y(_spd, moveDir);



// Check for collision with the wall object (oWall) in the horizontal direction
if place_meeting(x + xspd, y , oWall)
{
xspd = 0; 
}

// Check for collision with the wall object (oWall) in the vertical direction
if place_meeting(x, y + yspd, oWall)
{
yspd = 0; 
}



if distance_to_object(obj_par_npcs) <=10 {

    if keyboard_check_pressed(ord("F")) and global.dialogo ==  false 
    {
        var _npc=instance_nearest(x,y,obj_par_npcs);
        var _dialogo = instance_create_layer(x,y,"Dialogo",obj_dialogo);
        _dialogo.npc_nome= _npc.nome;
    }

}
if instance_exists(obj_dialogo){
    global.dialogo = true;
}
global.tecla=keyboard_check_pressed(ord("F"));






// collision with obj_solid
if place_meeting(x + xspd, y, obj_solid) {
    while (!place_meeting(x + sign(xspd), y, obj_solid)) {
        x += sign(xspd);
    }
    xspd = 0;
}
if place_meeting(x, y + yspd, obj_solid) {
    while (!place_meeting(x, y + sign(yspd), obj_solid)){
        y += sign(yspd);
    }
    yspd = 0;
}




// move the player
x += xspd;
y += yspd;

//depth 
depth = -bbox_bottom;
#endregion

//get damaged
if !shieldActive && get_damaged(oDamagePlayer, true)
{
//hit screen
instance_create_depth (	0,0,0,oHitScreen);
	//screen pause
	create_screen_pause(15);
	//shake the screen
	//cam shaking 
screen_shake(6);
	
}



//sprite control
#region
//player aiming
centerY = y + centerYoffset;
//aim
aimDir = point_direction(x, centerY, mouse_x, mouse_y);
//make sure the player facin direction
face = round (aimDir/90);
if face == 4 {face = 0; };

// animate
if xspd == 0 && yspd == 0
{
	image_index = 0;
}
//set the player sprite
mask_index = sPlayerDown;
sprite_index = sprite [face];

#endregion

//weapon swap
#region

	var _playerWeapons = global.PlayerWeapons;
	
//cycle through weapon
if swapKeyPressed
{
	
	//change the selection and wrap around
	selectedWeapon++; 
	if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0;};
	
	
}
//set the new weapon
	weapon = _playerWeapons[selectedWeapon];


#endregion


//shoot the weapon
if shootTimer > 0 {shootTimer --; };
if shootkey && shootTimer <=0
{
	//reset timer
	shootTimer = weapon.cooldown;
	
	
	
	
	//create the bullet
	var _xOffset = lengthdir_x (weapon.length + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y (weapon.length + weaponOffsetDist, aimDir);
	
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max( weapon.bulletNum -1,1);
	
	var _weaponTipX = x +_xOffset;
	var _weaponTipY = centerY + _yOffset;
	
	//create weapon flash
	create_animated_vfx (sShootFlash,_weaponTipX,_weaponTipY,depth-10,aimDir);
	
	//create numb of bullets
	for (var i = 0 ; i< weapon.bulletNum; i++)
	{
    var _bulletInst = instance_create_depth (x + _xOffset, centerY + _yOffset, depth-100, weapon.bulletObj);
	
 
 //CHANGE the bullet's direction
			with ( _bulletInst ) 
			 {
				 dir = other.aimDir - _spread/2 + _spreadDiv*i;
			 }
	}
}

// death / GAME OVER

 if hp <= 0
 
 {
	 //create the game over
	 instance_create_depth(0,0,-10000,oGameOverScreen);
	 //boom
	create_animated_vfx(sSmallBoom,x,y,depth);
	 //destroy ourself 
	 instance_destroy();
 }
	
	


//collision with solid objects
if place_meeting(x + xspd, y , obj_door_solid)
{
    xspd = 0;
}
if place_meeting(x,y + yspd, obj_door_solid)
{
    yspd=0;
}


















if keyboard_check_pressed(ord("E"))
{
    var obj = instance_place(x, y, obj_orb); // Change obj_orb to the object you want to pick up
    if obj != noone && !obj.picked_up
    {
        obj.picked_up = true;
        obj.x = -99999; // Move the object off-screen
        obj.y = -99999;
        
        // Store the object's position in global variables
        global.orb_x = obj.x;
        global.orb_y = obj.y;
    }
}




