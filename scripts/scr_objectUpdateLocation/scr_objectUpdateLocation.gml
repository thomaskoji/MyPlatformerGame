function scr_objectUpdateLocation() {
	//horizontal
	if(place_meeting(x + velocity[XAXIS], y, _solid_parent))
	{
		var _yplus = 0;
		var _reps = 0;
		while(place_meeting(x + velocity[XAXIS], y - _yplus, _solid_parent) && _yplus <= abs(1 * velocity[XAXIS]) && onGround)
		{
			++_yplus; 
			++_reps; 
			if (_reps >= 999)
			{scr_showErrorMessage("While Loop Fail: Update Location Postion 0");}
		}
		if (place_meeting(x + velocity[XAXIS], y - _yplus, _solid_parent))
		{
			_reps = 0; 
			while(!place_meeting(x + sign(velocity[XAXIS]), y, _solid_parent))
			{
				x += sign(velocity[XAXIS]);
				++_reps; 
				if (_reps >= 999)
				{scr_showErrorMessage("While Loop Fail: Update Location Postion 1");}
			}
			velocity[XAXIS] = 0;
		}
		else
		{
			y -= _yplus;
		}

	}
	x += velocity[XAXIS];

	//vertical
	if(place_meeting(x, y + velocity[YAXIS], _solid_parent))
	{
		if (velocity[YAXIS] < 0) { y = ceil(y);}
		else if (velocity[YAXIS] > 0) { y = floor(y);}
	
		while(!place_meeting(x, y + sign(velocity[YAXIS]), _solid_parent))
		{
			y += sign(velocity[YAXIS]);
		}
		velocity[YAXIS] = 0;
	}

	//Vertical platforms
	if(sign(velocity[YAXIS]) > 0)
	{
		if(place_meeting(x,y + velocity[YAXIS], obj_platform))
		{
			if(velocity[YAXIS] < 0) {	y = ceil(y);}
			else if(velocity[YAXIS] > 0) {	y = floor(y);}
		
			while(!place_meeting(x,y+sign(velocity[YAXIS]), obj_platform))
			{
				y += sign(velocity[YAXIS]);
			}
			velocity[YAXIS] = 0;
		}
	}
	y += velocity[YAXIS];


}
