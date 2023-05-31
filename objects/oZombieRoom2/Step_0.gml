//pause self
if screen_pause() {exit;};

//code commands
var _wallcollisions = true;
var _getDamage = true;
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
	
	
	
	
	
	
	
	
	
	
	
	
//chase state
case 0:
  // Only chase the player if they're within the radius
  var chaseRadius = 200; // change this to the desired radius
  if instance_exists(oPlayer) && distance_to_object(oPlayer) <= chaseRadius {
    // Get player's direction
    dir = point_direction(x, y, oPlayer.x, oPlayer.y);
    
    // Set the correct speed
      // Set the correct speed and animation
  spd = chaseSpd;
  sprite_index = notnormal; // set the walking animation sprite
  image_speed = 1; // set the animation speed
    
    // Increment the shoot timer if the player is on screen
    var _camLeft = camera_get_view_x(view_camera[0]);
    var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
    var _camTop = camera_get_view_y(view_camera[0]);
    var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
    if (bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom) {
      shootTimer++;
    }
    
    // Transition to shooting state if the shoot timer has reached the cooldown time
    var cooldownTime = 60; // change this to the desired cooldown time
    if (shootTimer >= cooldownTime) {
      state = 1;
     shootTimer = 0;
            }
        } else {
            // Set the sprite to a static frame if not chasing
            sprite_index = spr_zombie_static;
            image_speed = 0;
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
	
	//stop animating / manually set the image index
	image_index= 0;
	
	//shoot a bullet
	shootTimer++;
	
	//create the bullet
	if shootTimer == 1
	{
		bulletInst = instance_create_depth (x + bulletXoff*face,y + bulletYoff, depth,oEnemyBullet1);
	}
	
	//keep the bullet in zombies hand
	if shootTimer <= windupTime && instance_exists ( bulletInst)
	{
		bulletInst.x = x + bulletXoff*face;
		bulletInst.y= y + bulletYoff;
	}
	//shoot the bullet afte windup time
	 if shootTimer == windupTime && instance_exists (bulletInst)
	 {
		 //set out bullet's state to movement state
		bulletInst.state = 1;
	}
		// recover and return chasin the player
		
		if shootTimer > windupTime + recoverTime
		{
			
		//go back to chasing player
		state = 0;
		//reset the timer seo we can use it again
		shootTimer = 0;
	    }
	 
	 #endregion
	break;
	
}
	



	//getting the speeds
	
xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);

	//get the correct face
#region

 if dir > 90 && dir < 270 
 {
	 face = -1;
 } else {
	 face = 1;
 }
 
	 #endregion

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