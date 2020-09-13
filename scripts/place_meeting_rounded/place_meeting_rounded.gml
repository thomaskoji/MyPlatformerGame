/// @func place_meeting_rounded(x,y,object)
/// @desc same as place meeting, but rounds x and y instead of flooring them
/// @param {real} x
/// @param {real} y
/// @param {real} object  Instance or object ID.
function place_meeting_rounded(argument0, argument1, argument2) {
	return place_meeting(round(argument0),round(argument1),argument2);


}
