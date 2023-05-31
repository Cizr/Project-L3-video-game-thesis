//get rid of bullet if we haven't shot it yet
if instance_exists (bulletInst) && bulletInst.state == 0
{
	bulletInst.destroy = true;
}


//ringo bommb explode

instance_create_depth(x,y,depth,oRingoBomb);