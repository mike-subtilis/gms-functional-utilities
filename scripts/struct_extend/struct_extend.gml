function struct_extend() {
	var newStruct = {};

	function addToStruct(baseStruct, structToAdd) {
		var keys = variable_struct_get_names(structToAdd);
		for (var i = 0; i < array_length(keys); i++) {
			baseStruct[$ keys[i]] = structToAdd[$ keys[i]];
		}
	}

	for (var i = 0; i < argument_count; i++) {
		addToStruct(newStruct, argument[i]);
	}

	return newStruct;
}
