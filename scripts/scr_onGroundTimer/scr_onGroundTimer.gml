function scr_onGroundTimer() {
	if (!onGround)
	{
		onGroundTimer -= 1;
		onGroundTimer = max(onGroundTimer - 1, 0);
	}
	else
	{
		onGroundTimer = coyoteTime;
	}


}
