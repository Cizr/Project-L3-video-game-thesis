//drawing the player's weapon
function draw_my_weapon()
{
	//draw the weapon
//get the weapon off the player's body
var _xOffset = lengthdir_x(weaponOffsetDist, aimDir );
var _yOffset = lengthdir_y(weaponOffsetDist, aimDir );

//flip the weapon upright
	var _weaponYscl = 1;
	if aimDir > 90 && aimDir < 270
	{
		_weaponYscl = -1;
		
	}

	draw_sprite_ext( weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir,c_white,image_alpha);
	
	
}
//damage calculation

//vfx




function screen_pause ()
{
	//pause game for player
if instance_exists(oScreenPause) or global.is_quiz_active
{
	image_speed = 0;
	return true;
}else{
	image_speed = 1;
	return false;
}

}

function create_screen_pause( _time = 3)
{
	 with ( instance_create_depth (0,0,0,oScreenPauseTimed) )
 {
	 timer = _time;
 }
}

function screen_shake ( _amount = 4)
{
with(oCamera)
{
	xShakeAmount = _amount;
	yShakeAmount = _amount;
}
}
function create_animated_vfx (_sprite,_x,_y,_depth, _rot=0)
{
	with (instance_create_depth(_x,_y,_depth,oAnimatedVFX))
	{
	sprite_index=_sprite;	
	image_angle =_rot;
	}
}
	//damage create event
	function get_damaged_create( _hp = 10 ,_iframes = false)
{
	maxHp = _hp;
	hp = _hp;
//get the iframes
if _iframes == true
{
	iframeTimer = 0;
	iframeNumber = 90;
}
	//create the damage list
	if _iframes == false
	{
	damageList = ds_list_create();
	}
}

	//damage clean up event
	function get_damaged_cleanup ()
	{
		//no need for iframaes
		//Delete our damage list data structure to free memory
		ds_list_destroy(damageList);
	}
	
	
//damage step event
function get_damaged(_damageObj, _iframes=false)
	{
		
				//special exit for iframe timer
				if _iframes == true && iframeTimer > 0
				{
				 iframeTimer--;
				 if iframeTimer mod 5== 0
				 {
				if image_alpha ==1
				{
					image_alpha = 0;
				} else {
					image_alpha = 1;
				}
				 }
				 
				 //clamp hp
					hp = clamp ( hp , 0 , maxHp ) ;

				//exist by return as false;
				return false;
				}
				//make sure the iframe blinkin stop
				if _iframes== true
				{
				image_alpha=1;
				}
// recieve damage
//loop through the list
	var _hitconfirm = false;
	
if place_meeting(x,y,_damageObj)  || 
(_damageObj != oDamageParent && place_meeting (x,y,oDamageAll))
{
	
	
	//getting a list of the damage instance
	var _instList = ds_list_create();
	
	instance_place_list(x,y, _damageObj, _instList,false);
	if _damageObj != oDamageParent
	{
	instance_place_list(x,y,oDamageAll,_instList,false);
	}
	//get the size of our list
	var _listSize = ds_list_size(_instList);
	
	
	for (var i = 0; i < _listSize; i++ )
	{
		//get a damage object instance from the list
	var _inst= ds_list_find_value(_instList,i);
	
//check if this instance is already in damage list 
if _iframes== true || ds_list_find_index( damageList, _inst) == -1
{
	//add the new damage instance to the damage list
	if _iframes == false
	{
	ds_list_add(damageList,_inst);
	}
	//take damage from specific instance
	hp -=_inst.damage;
	_hitconfirm = true;
	
	//tell the damage instance to destroy itself
	_inst.hitConfirm=true;
	
	//create impact visual
	if _inst.hitVFX == true
	{
	create_animated_vfx(sShootBurst,_inst.x , _inst.y, _inst.depth -50);
	}
	}
}
	
	//set iframes if we were hit
	if _iframes == true &&  _hitconfirm == true
	{
	iframeTimer = iframeNumber;
	}
	//free memory by destroyin the ds list
	ds_list_destroy(_instList);

	}

//clear the damage list of objects that exist anymore or aren't touchin anymore
if _iframes == false
{
var _damageListSize = ds_list_size(damageList);
for (var i = 0; i < _damageListSize; i++)
{
		//if not touchin the damage instance anymore,remove it from the list and set the loop back
		var _inst = ds_list_find_value (damageList,i);
		if !instance_exists ( _inst) || !place_meeting(x,y,_inst)
		{
			ds_list_delete( damageList,i);
			i--;
			_damageListSize--;
		}
}
}

//clamp hp
hp = clamp ( hp , 0 , maxHp ) ;

	//return hit confirm var value
return _hitconfirm;

//death
if hp  <=0
{
	instance_destroy();
	
}
	}