//pause self
if screen_pause() {exit;};

if createdDamageObjects == false 
{
	//create an object for damage
	damageInst = instance_create_depth ( x,y,0,oDamageAll);
	with (damageInst)
	{
		damage= other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	
	//set var true 
	createdDamageObjects = true;
}

//animation fix
if floor (image_index) > 1
{
	//damage obj
	if instance_exists (damageInst)
	{
		instance_destroy (damageInst);
	}
}
	