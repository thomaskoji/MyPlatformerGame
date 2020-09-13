onGround = place_meeting(x, y + 1, _solid_parent) or place_meeting(x, y + 1, obj_platform)
onWall = place_meeting(x+1,y,_solid_parent) - place_meeting(x-1,y,_solid_parent);

stateExecute();
scr_objectUpdateLocation();
scr_walkDownSlopes();