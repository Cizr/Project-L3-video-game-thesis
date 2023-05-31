//pause self
if screen_pause() {exit;};

//code commands
var _wallcollisions = true;
var _getDamage = true;
var _autoSprites = true;
//state machine
switch( state )
{
	
	//spawn from spawner
	case -1:
	
	//fade in
	if image_alpha < 1
	{
		//dont walk while fadin in
		spd = 0;
		image_alpha += fadeSpd;
		
	}
	//walk out
	_wallcollisions = false;
	_getDamage = false;
	if image_alpha >=1
	{
		//set the right speed 
		spd = emergeSpd;
		dir = 270;
	}
	//switch to chasing state after uut of spawner
	if ! place_meeting(x,y,oWall) 
	{
		state = 0;
	}
	break;
	
	//chase etat
	case 0:
	
	//get player's direction
	if instance_exists(oPlayer)
	{dir = point_direction (x,y, oPlayer.x,oPlayer.y);}
	
	//correct speed
	spd = chaseSpd;
	//transition to shooting state
	var _camLeft = camera_get_view_x(view_camera[0]);
	var _camRight = _camLeft + camera_get_view_width (view_camera[0]);
	var _camTop = camera_get_view_y (view_camera[0]);
	var _camBotoom = _camTop + camera_get_view_height (view_camera[0]);
	
	//only add timer if on screen
	if bbox_right  > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBotoom
	{
	        shootTimer++;
	}
	if shootTimer > cooldownTime
	{
		//go to shoot state
		state = 1;
		//reset timer so the shooting state can use it 
		shootTimer=0;
	}
	break;


	//pause and shoot state
	case 1:
#region


	
	// get player's direction
	if instance_exists(oPlayer)
	{dir = point_direction (x,y, oPlayer.x, oPlayer.y);}
	
	//set the correct speed
	spd = 0;
	
	//start the attack
	_autoSprites = false;
	if sprite_index != sRingoAttack
	{
	sprite_index = sRingoAttack;
	image_index = 0;
	}
if sprite_index == sRingoAttack && floor(image_index) == attackFrame && !attackTriggered
			{

			attackTriggered = true;
				 var _attackDist = 200;
				 var _attackSep = 20;
				 var _attackNum = round (_attackDist/_attackSep);
				 var _attackDirSep = 15;
				 
				  for (var ds = 0; ds <3; ds++) 
				  {
					   var _dir = dir - _attackDirSep + _attackDirSep*ds;
				 for (var i = 1; i < _attackNum; i++)
				 {
					
					 var _xx = x +lengthdir_x(_attackSep*i,_dir);
					 var _yy = y +lengthdir_y(_attackSep*i,_dir);
					 
					 
					 if !position_meeting(_xx, _yy, oWall)
					 {
					var _inst= instance_create_depth(_xx,_yy,depth,oRingoVine);
					_inst.delay = i*3;
					 } else {
						 i +=99;
						 
					 }
				 }
			}
		}
			
			//holdin anim
		if sprite_index == sRingoAttack && floor (image_index)== holdFrame
		{
			holdTimer --;
			if holdTimer > 0
			{
			image_index=holdFrame;
			}
		}

	 
	 #endregion
	break;
	
}
	//reset attack
	if sprite_index != sRingoAttack { attackTriggered = false; holdTimer = holdTime};



	//getting the speeds
	
xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);

	//get the correct face
	
	
	if _autoSprites
	{
		face = round(dir/90);
		 if face == 4 {face=0}
		 sprite_index= sprite[face];
		 mask_index = sprite[3];
	}

	//collisions
	//wall collision
	if _wallcollisions == true
{
	if place_meeting (x+ xspd , y , oWall) 
	{
		xspd = 0;
	}
	if place_meeting (x ,y+ yspd, oWall) 
	{
		yspd=0;	
	}
}
//enemy colision 

if place_meeting (x+ xspd , y , oEnemyParent) 
	{
		xspd = 0;
	}
	if place_meeting (x ,y+ yspd, oEnemyParent) 
	{
		yspd=0;	
	}
	
	//moving
	x += xspd;
	y += yspd;

// set the depth
   depth = -y;

// Inherit the parent event
if _getDamage == true
{
	//getting damaged and dying
	event_inherited();
}