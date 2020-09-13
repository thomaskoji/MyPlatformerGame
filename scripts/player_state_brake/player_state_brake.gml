function player_state_brake() {
	if(state_new)
	{
		state_var[0] = sign(velocity[XAXIS]); //Starting direction when entering the slide
		sprite_index = spr_playerBrake;
		face_direction = state_var[0];
		image_index = 0;
		image_speed = defaultImageSpeed;
	}

	if(g.inputDirection == no_direction)
			scr_applyXFriction(runFriction);	
		else
			scr_applyXMovement(g.inputHorizontalTotal, runAccel, runMaxSpeed, runFriction);

	var _changed_direction = (velocity[XAXIS] >= 0 && state_var[0] == -1) || (velocity[XAXIS] <= 0 && state_var[0] == 1);
	var _slide_cancelled = (global.inputHorizontalTotal == 1 && state_var[0] == 1) || (global.inputHorizontalTotal == -1 && state_var[0]==-1);
	if(_changed_direction || _slide_cancelled)
	{	stateSwitch("run");}

	if(!onGround)
	{	stateSwitch("fall");}

	if(g.jump[pressed])
	{	stateSwitch("backflip");}


}
