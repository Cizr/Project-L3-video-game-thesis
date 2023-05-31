// recieve damage
get_damaged(oDamageEnemy);

//death
if hp  <=0
{
	//add total ammount of zombies
	global.enemyKillCount++;
	
	//should we drop an item?
	if global.enemyKillCount mod 8 == 0
	{
		instance_create_depth(x,y,depth, oHearth);
	}
	
	
	//should we drop an item?
	if global.enemyKillCount mod 5 == 0
	{
		instance_create_depth(x,y,depth, oHearth2);
	}
	
	//should we drop an item?
	if global.enemyKillCount mod 7 == 0
	{
		instance_create_depth(x,y,depth, oHearth3);
	}
	//boom vfx
create_animated_vfx(sSmallBoom,x,y,depth);
	
	//destroy self
	instance_destroy();
	
}