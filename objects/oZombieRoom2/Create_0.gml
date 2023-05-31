
// Inherit the parent event
event_inherited();
spd= 0;
chaseSpd= .5;
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


 // change this to the desired radius

