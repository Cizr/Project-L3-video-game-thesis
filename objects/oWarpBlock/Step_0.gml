//create the warp obj when the player touches this 
if !instance_exists (oWarp) && place_meeting(x,y,oPlayer)
{
	//create the warp obj
	with (instance_create_depth(0,0,0,oWarp) )
	{
		targetRoom = other.targetRoom;
		targetObj = other.targetObj;
	}
}