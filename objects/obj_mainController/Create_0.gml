// Inherit the parent event
event_inherited();	

// Instantiate controll objects
instance_create_depth(0,0,0, obj_inputController);
instance_create_depth(0,0,0, obj_displayController);

room_goto(rm_main);