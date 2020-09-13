/// @description scr_setOptionVariableStrings, points to variables for option menu.
function scr_setOptionVariableStrings() {

	optionVariableNameArray[1] = ": " + string(round(g.MusicVolume*10)); // MUSIC VOLUME 
	optionVariableNameArray[0] = ": " + string(round(g.SEVolume*10)); // SE VOLUME 


}
