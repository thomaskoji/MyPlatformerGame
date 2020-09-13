function player_state_slide() {
	if(state_new)
	{
		sprite_index = spr_playerSlide;
		image_index = 0;
		image_speed = defaultImageSpeed;
		velocity[XAXIS] += slideBoost * face_direction;
	}

	scr_applyXFriction(slideFriction);

#region state machine

	if(velocity[XAXIS] == 0 or !g.slide[held])
	{	stateSwitch("wait");}

	if(velocity[XAXIS] == 0 && g.inputHorizontalTotal != 0)
	{	stateSwitch("run");}

	if(!onGround)
	{	stateSwitch("fall");}

	if(g.jump[pressed])
	{	stateSwitch("jump");}


#endregion


}
