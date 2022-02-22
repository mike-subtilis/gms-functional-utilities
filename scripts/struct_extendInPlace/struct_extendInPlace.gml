function struct_extendInPlace(baseStruct) {
	function addToStruct(structToAddTo, structToAddFrom) {
		var keys = variable_struct_get_names(structToAddFrom);
		for (var i = 0; i < array_length(keys); i++) {
			structToAddTo[$ keys[i]] = structToAddFrom[$ keys[i]];
		}
	}

	for (var i = 0; i < argument_count; i++) {
		addToStruct(baseStruct, argument[i]);
	}

	return baseStruct;
}
