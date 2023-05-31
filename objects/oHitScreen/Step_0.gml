//screen pause
if screen_pause() {exit;};

//afade out
alpha -= alphaSpd;
if alpha <=0 {instance_destroy();};