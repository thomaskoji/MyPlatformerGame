function player_state_backflip() {
	if(state_new and !jumped)
	{
		image_speed = defaultImageSpeed;
		sprite_index = spr_playerBackflip;
		image_index = 0;
		velocity[YAXIS] -= backflipJumpPower;
		jumped = true;
	}

	scr_applyGravity(backflipGravity,fallMaxGravity);
	scr_applyXMovement(g.inputHorizontalTotal, backflipAccel, backflipMaxSpeed, jumpFriction);

	if(velocity[YAXIS] > 0)
	{
		stateSwitch("fall");
		jumped = false;
	}


}
