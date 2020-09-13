/// @description Adjust SE volume through menu
/// @param volumeChange
function scr_adjustMusicVolume() {
	var _change = argument[0];

	global.MusicVolume += _change;
	global.MusicVolume = clamp(global.MusicVolume, 0, 1);
	audio_emitter_gain(global.MusicEmitter, global.MusicVolume);
	scr_setOptionVariableStrings();


}
