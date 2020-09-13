function player_state_wallJump() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		sprite_index = spr_playerJump;
		image_index = 0;
		velocity[XAXIS] = wallJumpXForce * -onWall;
		velocity[YAXIS] = -wallJumpYForce;
	}

	if(velocity[XAXIS] != 0)
	{	face_direction = sign(velocity[XAXIS]);}

	scr_applyGravity(wallJumpGravity,fallMaxGravity);
	scr_applyXMovement(g.inputHorizontalTotal, wallJumpAccel, wallJumpMaxSpeed, wallJumpFriction);

	if(animation_end())
	{	image_index = image_number - 1;}

#region state machine

	if(velocity[YAXIS] > 0)
	{
		stateSwitch("fall");
	}

	if(g.jump[pressed] and onWall != 0)
	{
		stateSwitch("wallJump");
	}

#endregion


}
