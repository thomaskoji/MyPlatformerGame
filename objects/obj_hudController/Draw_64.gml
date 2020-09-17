draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour($e4924f);
draw_set_font(fnt_debug);

#region direction conversion to string thing
var _dir = "no direction";
switch global.inputDirection
{
	case -1:
		_dir = "no direction";
	break;
	
	case 0:
		_dir = "east";
	break;
	
	case 45:
		_dir = "north east";
	break;
	
	case 90:
		_dir = "north";
	break;
	
	case 135:
		_dir = "north west";
	break;
	
	case 180:
		_dir = "west";
	break;
	
	case 225:
		_dir = "south west";
	break;
		
	case 270:
		_dir = "south";
	break;
	
	case 315:
		_dir = "south east";
	break;
}
#endregion

#region top right HUD

if(room = rm_main)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_set_colour($e4924f);
	var _tutorialString = "";
	_tutorialString += "wasd to move" + "\n";
	_tutorialString += "space to jump" + "\n";
	draw_set_alpha(1);
	draw_text(obj_displayController.ideal_width-5,5, _tutorialString);
}

#endregion

#region debug string

if(room = rm_main)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _debugString = "";
	_debugString += "FPS " + string(fps) + "\n";
	if(instance_exists(obj_player))
	{
		_debugString += "State " + string(obj_player.state) + "\n";
		_debugString += "X " + string(obj_player.x) + "\n";
		_debugString += "Y " + string(obj_player.y) + "\n";
		_debugString += "Xvel " + string(obj_player.velocity[XAXIS]) + "\n";
		_debugString += "Yvel " + string(obj_player.velocity[YAXIS]) + "\n";
		_debugString += "onGround " + string(obj_player.onGround) + "\n";
		_debugString += "onWall " + string(obj_player.onWall) + "\n";
		_debugString += "FaceDir " + string(obj_player.face_direction) + "\n";
	}
	draw_set_alpha(1);
	draw_text(5,25, _debugString);
}

#endregion