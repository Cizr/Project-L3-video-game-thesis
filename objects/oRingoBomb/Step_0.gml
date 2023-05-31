if screen_pause() exit;


z+=zspd;
zspd -= grav;
depth = -y;

if z <=0
{
	
	
	//explosion
	var _boomInst = instance_create_depth (x+8 , y+8 , -3000,oBigBoom);
	with (_boomInst)
	{
		image_xscale = 1.25;
		image_yscale = 1.25;
	}
		
	instance_destroy();
}