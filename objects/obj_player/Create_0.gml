event_inherited();

#region State Machine

stateMachineCreate();

stateAdd("wait", player_state_wait);
stateAdd("run", player_state_run);
stateAdd("brake", player_state_brake);
stateAdd("jump", player_state_jump);
stateAdd("backflip", player_state_backflip);
stateAdd("fall", player_state_fall);
stateAdd("slide", player_state_slide);
stateAdd("wallLatch", player_state_wallLatch);
stateAdd("wallJump", player_state_wallJump);
stateAdd("wallRun", player_state_wallRun);
stateAdd("ledgeGrab", player_state_ledgeGrab);
stateAdd("push", player_state_push);

stateBeginIn("wait");

#endregion

#region Movement Properties

velocity[YAXIS]		= 0;
velocity[XAXIS]		= 0;

waitFriction		= .5;

runMaxSpeed			= 4;
runFriction			= .3;
runAccel			= .3;

slideFriction		= .05;
slideBoost			= 2;

jumpPower			= 3.5;
jumpMaxSpeed		= runMaxSpeed;
jumpFriction		= .1;
jumpAccel			= .2;
jumped				= false;

backflipJumpPower	= 4;
backflipMaxSpeed	= 3;
backflipAccel		= .1;
backflipGravity		= .1;

wallJumpXForce		= 2.5;
wallJumpYForce		= 3;
wallJumpMaxSpeed	= 4;
wallJumpAccel		= .05;
wallJumpFriction	= .03;
wallJumpGravity		= .125;

fallGravity			= .15;
fallMaxGravity		= 5;

wallRunGravity		= .25;
wallRunBoost		= 1;

wallLatchGravity	= .1;
wallLatchMaxGravity	= 3.5;
wallLatchStickTime	= 15; // How long you still to wall


#endregion

#region Image Properties

defaultImageSpeed	= .2;

#endregion

coyoteTime = 5;
onGroundTimer = coyoteTime;