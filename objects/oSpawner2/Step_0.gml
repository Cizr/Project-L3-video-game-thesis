// Pause self
if screen_pause() { exit; }

// Spawn an enemy
timer++;

// Reset the timer when enemy limits are reached
if instance_number(oEnemyParent) >= global.activeEnemyMax 
{
	timer = 0;
}

if timer >= spawnTime && global.enemyKillCount < global.enemyRoomMax
{
	// Count the number of existing oRingo instances
	var numRingoInstances = instance_number(oRingo);
	
	if (numRingoInstances < 2 && !place_meeting(x, y, oRingo))
	{
		// Create an oRingo enemy
		var _inst = instance_create_depth(x, y, depth - 1, oRingo); 
		
		with (_inst)
		{
			// Make oRingo invisible
			image_alpha = 0;
			state = -1;
		}
		
		// Reset the timer
		timer = 0;
		global.totalEnemiesSpawned++;
	}
}
