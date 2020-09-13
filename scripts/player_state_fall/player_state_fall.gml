function player_state_fall() {
	if(state_new)
	{
		if(state_previous != "backflip")
		{
			sprite_index = spr_playerFall;
			image_index = 0;
			image_speed = defaultImageSpeed;
		}
	}

	if(onGroundTimer > 0)
	{
		if(g.jump[pressed])
		{	
			stateSwitch("jump");
			onGroundTimer = 0;
		}		
	}

	if(velocity[XAXIS] != 0)
	{	face_direction = sign(velocity[XAXIS]);}

	switch state_previous
	{
	
		default:
			scr_applyGravity(fallGravity,fallMaxGravity);
			scr_applyXMovement(g.inputHorizontalTotal, jumpAccel, jumpMaxSpeed, jumpFriction);
		break;

		case "backflip":
			scr_applyGravity(backflipGravity,fallMaxGravity);
			scr_applyXMovement(g.inputHorizontalTotal, backflipAccel, backflipMaxSpeed, jumpFriction);
		break;
	
		case "wallJump":
			scr_applyGravity(wallJumpGravity,fallMaxGravity);
			scr_applyXMovement(g.inputHorizontalTotal, wallJumpAccel, wallJumpMaxSpeed, wallJumpFriction);
		break;

	}

#region state machine

	if(onGround)
	{	
		stateSwitch("wait");
		scr_createDebugFlag(x,y,"landed", true); 
	
	}

	if(g.inputHorizontalTotal != 0 && !g.slide[pressed] && velocity[YAXIS] == 0)
	{	stateSwitch("run");}

	if(onWall != 0 and onWall = g.inputHorizontalTotal)
	{ stateSwitch("wallLatch");}

	if(g.jump[pressed] and onWall != 0)
	{	stateSwitch("wallJump");}

	scr_ledgeGrabStateSwitch();

#endregion


}
