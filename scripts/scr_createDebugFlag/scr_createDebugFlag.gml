/// @description creates a debug flag
/// @param x,y,text,deleteOldFlags
function scr_createDebugFlag() {

	var _x = argument[0]; 
	var _y = argument[1]; 
	var _text = argument[2]; 
	var _deleteOldFlags = argument[3]; 

	if _deleteOldFlags
	{
		with obj_debugFlag
		{instance_destroy();}
	}

	var _flag = instance_create_depth(_x,_y, -999, obj_debugFlag); 
	_flag.myText = _text; 


}
