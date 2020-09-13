function player_state_wallRun() {
	if(state_new and !jumped)
	{
		sprite_index = spr_playerWallRun;
		image_index = 0;
		image_speed = defaultImageSpeed;
	
		velocity[YAXIS] -= wallRunBoost;
	}

	scr_applyGravity(wallRunGravity,fallMaxGravity);

	scr_applyXMovement(g.inputHorizontalTotal, jumpAccel, jumpMaxSpeed, jumpFriction);

#region state machine

	if(onGround)
	{	stateSwitch("wait");}

	if(onWall != g.inputHorizontalTotal or onWall = 0)
	{	stateSwitch("fall");}

	if(g.jump[pressed])
	{	stateSwitch("wallJump");}

	if(velocity[YAXIS] > 0)
	{	stateSwitch("wallLatch");}

	scr_ledgeGrabStateSwitch();

#endregion


}
