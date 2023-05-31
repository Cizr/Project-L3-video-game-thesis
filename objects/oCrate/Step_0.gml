get_damaged(oDamageParent);


//show damage
var _healthPercentage = 1 - (hp/maxHp);
image_index = _healthPercentage * (image_number)
if hp <=0
{
	//boom vfx
create_animated_vfx(sSmallBoom,x+8,y+16,depth);
	
	//destrohy
	instance_destroy();
}
