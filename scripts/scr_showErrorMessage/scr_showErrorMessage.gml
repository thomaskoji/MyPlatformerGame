/// @description show error message 
/// @param message
function scr_showErrorMessage() {

	var _text = argument[0]; 
	var _obj = object_get_name(object_index); 
	var _inst = id;
	var _time = current_time; 

	show_debug_message(_text + "\n" + 
	"obj: " + string(_obj) + "\n" + 
	"id: " + string(_inst) + "\n" + 
	"time: " + string(_time));


}
