function player_state_push() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		sprite_index = spr_playerPush;
		image_index = 0;
	}



	if(g.inputHorizontalTotal != face_direction)
	{	stateSwitch("run");}

	if(g.jump[pressed])
	{	stateSwitch("jump");}


}
