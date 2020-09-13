function player_state_ledgeGrab() {
	if(state_new and !jumped)
	{
		sprite_index = spr_playerLedgeGrab;
		image_index = 0;
		image_speed = .5;
	
		state_var[0] = 0; // ANIMATION STAGE
		state_var[1] = 0; // ANIMATION TIMER
		state_var[2] = false; // MOVE TRIGGER
	
		velocity[XAXIS] = 0;
		velocity[YAXIS] = 0;
	
		// Move downwards until we are at the correct wall climb location
		var _sideCheck = NULLVALUE;
		if(onWall == 1){_sideCheck = bbox_right + 1;}
		else if(onWall == -1){_sideCheck = bbox_left - 1;}
	
		y = round(y);
		if(!position_meeting(_sideCheck, bbox_top, _solid_parent))
		{
			var _reps = 0; 
			while(!position_meeting(_sideCheck, bbox_top, _solid_parent))
			{
				y += 1;
				++_reps; 
				if (_reps >= 999)
				{scr_showErrorMessage("While Loop Fail: Ledge Grab");}
			}
		}
	}

	if(animation_hit_frame(10))
	{
		var _bboxHeight = bbox_bottom - bbox_top;
		var _bboxWidth = bbox_right - bbox_left;
			
		x += (_bboxWidth + 1) * face_direction;
		y -= _bboxHeight;
	
		sprite_index = spr_playerWait;
		stateSwitch("wait");
	}


}
