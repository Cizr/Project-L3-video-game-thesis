//pause self
if screen_pause() {exit;};
// spawn an enemy
timer++;

//reset time when enemy limits reached
if instance_number(oEnemyParent) >= global.activeEnemyMax 
{
	timer = 0;
}

if timer >= spawnTime && !place_meeting (x,y,oZombie) && global.enemyKillCount < global.enemyRoomMax
{
	// create en enemy
	var _inst = instance_create_depth (x,y,depth-1,oZombie) 
	
	 with (_inst)
	 {
		 //make the zombie invisible
		 image_alpha = 0;
		 state= -1;
	 }
	//reset the timer
	timer = 0;
	global.totalEnemiesSpawned++;
}

