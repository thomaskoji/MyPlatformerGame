///@arg frame
function animation_hit_frame(argument0) {
	var _frame = argument0;
	var _frameRange = image_speed * sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);

	return image_index >= _frame and image_index < _frame + _frameRange;


}
