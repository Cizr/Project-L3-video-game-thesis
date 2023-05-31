//pause self
if screen_pause() {exit;};
//move
xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);

 x+= xspd;
 y+= yspd;
 
 //depth
 depth = -y;
 //cleanup
 
 //hit confirm destroy
 
 if hitConfirm == true && enemyDestroy == true  {destroy = true;};
 
 //destroy 
if destroy == true 
{
	
	//shoot burst
	create_animated_vfx(sShootBurst,x,y,depth-50);
	//vfx
	instance_destroy();
}

  	//collision
	
	if place_meeting( x,y,oSolidWall) 
	{
		destroy = true;
	}

//bullet out of the range
if point_distance( xstart,ystart, x, y ) > maxDist
{
	destroy = true;
}


