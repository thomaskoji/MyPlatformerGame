function player_state_wait() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		sprite_index = spr_playerWait;
		image_index = 0;
	}

	scr_applyXFriction(waitFriction);

#region state machine

	if(g.inputHorizontalTotal != 0)
	{	stateSwitch("run");}

	if(!onGround)
	{	stateSwitch("fall");}

	if(g.jump[pressed])
	{	stateSwitch("jump");}

#endregion


}
