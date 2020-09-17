function player_state_wait() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		sprite_index = spr_player;
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

function player_state_run() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		//sprite_index = spr_playerRun;
		image_index = 0;
	}

	if(velocity[XAXIS] != 0)
	{	face_direction = sign(velocity[XAXIS]);}

	scr_applyXMovement(g.inputHorizontalTotal, runAccel, runMaxSpeed, runFriction);

#region state machine

	var _spdForSlide = .01;
	if((velocity[XAXIS] < -_spdForSlide && global.inputDirection == east) || 
		(velocity[XAXIS] > _spdForSlide && global.inputDirection == west))
	{ 	stateSwitch("brake");}

	if(onWall = face_direction)
	{	stateSwitch("push");}

	if(g.slide[pressed])
	{	stateSwitch("slide");}

	if(velocity[XAXIS] == 0 && global.inputHorizontalTotal == 0)
	{	stateSwitch("wait");}

	if(!onGround)
	{	stateSwitch("fall");}

	if(g.jump[pressed])
	{	stateSwitch("jump");}
#endregion


}

function player_state_brake() {
	if(state_new)
	{
		state_var[0] = sign(velocity[XAXIS]); //Starting direction when entering the slide
		//sprite_index = spr_playerBrake;
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

function player_state_jump() {
	if(state_new and !jumped)
	{
		velocity[YAXIS] -= jumpPower;
		//sprite_index = spr_playerJump;
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

function player_state_backflip() {
	if(state_new and !jumped)
	{
		image_speed = defaultImageSpeed;
		//sprite_index = spr_playerBackflip;
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

function player_state_fall() {
	if(state_new)
	{
		if(state_previous != "backflip")
		{
			//sprite_index = spr_playerFall;
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

function player_state_slide() {
	if(state_new)
	{
		//sprite_index = spr_playerSlide;
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

function player_state_wallJump() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		//sprite_index = spr_playerJump;
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

function player_state_wallLatch() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		//sprite_index = spr_playerWallLatch;
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

function player_state_wallRun() {
	if(state_new and !jumped)
	{
		//sprite_index = spr_playerWallRun;
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

function player_state_ledgeGrab() {
	if(state_new and !jumped)
	{
		//sprite_index = spr_playerLedgeGrab;
		image_index = 0;
		image_speed = .5;
	
		state_var[0] = 0; // ANIMATION STAGE
		state_var[1] = 0; // ANIMATION TIMER
		state_var[2] = false; // MOVE TRIGGER
	
		velocity[XAXIS] = 0;
		velocity[YAXIS] = 0;
	
		// Move downwards until we are at the correct wall climb location
		var _sideCheck = NULLVALUE;
		if(onWall == 1){_sideCheck = bbox_right + 1;}
		else if(onWall == -1){_sideCheck = bbox_left - 1;}
	
		y = round(y);
		if(!position_meeting(_sideCheck, bbox_top, obj_solid))
		{
			var _reps = 0; 
			while(!position_meeting(_sideCheck, bbox_top, obj_solid))
			{
				y += 1;
				++_reps; 
				if (_reps >= 999)
				{scr_showErrorMessage("While Loop Fail: Ledge Grab");}
			}
		}
	}

	if(animation_hit_frame(10))
	{
		var _bboxHeight = bbox_bottom - bbox_top;
		var _bboxWidth = bbox_right - bbox_left;
			
		x += (_bboxWidth + 1) * face_direction;
		y -= _bboxHeight;
	
		//sprite_index = spr_playerWait;
		stateSwitch("wait");
	}


}

function player_state_push() {
	if(state_new)
	{
		image_speed = defaultImageSpeed;
		//sprite_index = spr_playerPush;
		image_index = 0;
	}



	if(g.inputHorizontalTotal != face_direction)
	{	stateSwitch("run");}

	if(g.jump[pressed])
	{	stateSwitch("jump");}


}
