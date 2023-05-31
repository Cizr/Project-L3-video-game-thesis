
// Inherit the parent event
event_inherited();


//sprite control
sprite[0] = sRingoRight;
sprite[1] = sRingoUp;
sprite[2] = sRingoLeft;
sprite[3] = sRingoDown;
face = 3;

attackFrame = 11;
holdFrame = 12;
holdTime = 60;
holdTimer = holdTime;
attackTriggered = false;


spd= 0;
chaseSpd= .25;
dir = 0;
xspd = 0;
yspd = 0;

face= 1;
 //state machine
state = 0;
// spawn from mausoleum state
fadeSpd = 1/15;
emergeSpd = .25;

 //shooting state
cooldownTime = 4*60;
shootTimer = irandom(cooldownTime);
windupTime = 60;
recoverTime= 45;
bulletInst = noone;

bulletXoff=5;
bulletYoff=-8;