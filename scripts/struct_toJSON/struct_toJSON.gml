function struct_toJSON(variable) {
	var structAsString = "{";
	var keys = variable_struct_get_names(variable);
	for (var i = 0; i < array_length(keys); i++) {
		var variableAsString = variable_toJSON(variable[$ keys[i]]);
		if (i == 0) {
			structAsString += "\"" + keys[i] + "\": " + variableAsString;
		} else {
			structAsString += ", \"" + keys[i] + "\": " + variableAsString;
		}
	}
	return structAsString + "}";
}