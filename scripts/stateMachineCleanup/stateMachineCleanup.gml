function stateMachineCleanup() {
	if ds_exists(stateMap, ds_type_map) ds_map_destroy(stateMap);


}
