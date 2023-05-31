//hp info

if instance_exists (oPlayer)
{
        playerHp = oPlayer.hp;
        playerMaxHp= oPlayer.maxHp;
} else {
    playerHp = 0;
}


// check if the player has reached the required number of kills for the current level
if (global.enemyKillCount >= global.enemyKillCounts[global.currentLevel]) {
    // update the enemy kill count for the current level
    global.enemyKillCounts[global.currentLevel] = global.levels[global.currentLevel];
    // increase the level and update the enemy kill count for the next level
    global.currentLevel++;
    if (global.currentLevel < array_length_1d(global.levels)) {
        global.enemyKillCount = 0;
        global.enemyKillCounts[global.currentLevel] = global.levels[global.currentLevel];

    } else {
        // handle case where the player has reached the maximum level
    }
}

// set the enemy limit based on the current level
global.enemyRoomMax = 10 + (global.currentLevel * 10);
global.activeEnemyMax = global.enemyRoomMax ;



// Track kills
if (global.enemyKillCount >= global.enemyKillCountQuiz + QUIZ_FREEQUENCY){
	trigger_quiz_event();
}