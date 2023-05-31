//shows on top
depth = -9000;

//keep track hp
playerHp=0;
playerMaxHp=0;

//enemy management
// initialize the level and enemy kill count arrays

/// initialize the level and enemy kill count arrays
global.levels = [10, 20, 30, 40];
global.currentLevel = 0;
global.enemyKillCounts = [0, 0, 0, 0];
global.enemyKillCount = 0;
global.enemyKillCountQuiz = 0;
// set the enemy kill count for the first level
global.enemyKillCounts[0] = global.levels[0];
global.enemyKillCount = global.enemyKillCounts[0];

// set the enemy limit based on the current level
global.enemyRoomMax = 10 + (global.currentLevel * 10);
global.activeEnemyMax = global.enemyRoomMax - 5;