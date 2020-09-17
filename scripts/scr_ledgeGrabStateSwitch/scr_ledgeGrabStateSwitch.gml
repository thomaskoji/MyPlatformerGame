function scr_ledgeGrabStateSwitch() {
	if(onWall == face_direction and onWall == g.inputHorizontalTotal)
	{
		var _sideCheck = NULLVALUE;
		if(onWall == 1){_sideCheck = bbox_right + 1;}
		else if(onWall == -1){_sideCheck = bbox_left - 1;}
		y = round(y);
		if(!position_meeting(_sideCheck, bbox_top - 3, obj_solid)
		and position_meeting(_sideCheck, bbox_top + 2, obj_solid))
		{
			stateSwitch("ledgeGrab");
		}
	}


}
