function player_state_jump() {
	if(state_new and !jumped)
	{
		velocity[YAXIS] -= jumpPower;
		sprite_index = spr_playerJump;
		image_index = 0;
		image_speed = defaultImageSpeed;
		jumped = true; // ADD JUMPED = FALSE TO EVERY NEW SWITCH STATE STATEMENT
	}

	scr_applyGravity(fallGravity,fallMaxGravity);

	scr_applyXMovement(g.inputHorizontalTotal, jumpAccel, runMaxSpeed, jumpFriction);

	if(animation_end())
	{	image_index = image_number - 1;}

	// when player releases jump
	if (g.jump[held] == false)
	{	velocity[YAXIS] *= 0.9;}


#region state machine

	if(velocity[YAXIS] > 0)
	{
		stateSwitch("fall");
		jumped = false;
	}

	if(g.jump[pressed] and onWall != 0)
	{
		stateSwitch("wallJump");
		jumped = false;
	}

	if(onWall != 0 and onWall = g.inputHorizontalTotal)
	{
		stateSwitch("wallRun");
		jumped = false;
	}

#endregion


}
