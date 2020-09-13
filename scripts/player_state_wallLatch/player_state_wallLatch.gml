function player_state_wallLatch() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		sprite_index = spr_playerWallLatch;
		image_index = 0;
	
		state_var[1] = 0; // TIMER FOR WALL ATTACHING
	}

	if (state_var[0] >= wallLatchStickTime)
	{
		scr_applyGravity(wallLatchGravity,wallLatchMaxGravity);
	}
 
#region state machine

	if(onWall != g.inputHorizontalTotal or onWall = 0)
	{	stateSwitch("fall");}

	if(g.jump[pressed])
	{	stateSwitch("wallJump");}

	if(onGround)
	{	stateSwitch("wait");}

	scr_ledgeGrabStateSwitch();


#endregion


}
