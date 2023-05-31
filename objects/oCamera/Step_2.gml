//get the camera's width and height
var _camW= camera_get_view_width (view_camera [0]);
var _camH = camera_get_view_height(view_camera[0]);



//CENTER ON THE PLAYER
if instance_exists (oPlayer)
{
	x= oPlayer.x - _camW/2;
	y= oPlayer.centerY - _camH/2;
}


//x shake
if xShakeAmount > 0
{
xShakeDir += xShakeDirSpd;
xShakeAmount -= xShakeAmountSpd;
} else {
	xShakeAmount = 0;
	xShakeDir = 0;
}
xShake = dsin(xShakeDir) * xShakeAmount;

//y shake 
if yShakeAmount > 0
{
yShakeDir += yShakeDirSpd;
yShakeAmount -= yShakeAmountSpd;
} else {
	yShakeAmount = 0;
	yShakeDir = 0;
}
yShake = dsin(yShakeDir) * yShakeAmount;


//add in the camera shake
x += xShake;
y += yShake;



// clamp cam position to room border
x = clamp(x,0,room_width - _camW);
y = clamp(y,0,room_height - _camH);


//set camera pos
camera_set_view_pos(view_camera[0],x,y);