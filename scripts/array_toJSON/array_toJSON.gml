function array_toJSON(variable) {
	var arrayAsString = "[";
	for (var i = 0; i < array_length(variable); i++) {
		var variableAsString = variable_toJSON(variable[i]);
		if (i == 0) {
			arrayAsString += variableAsString;
		} else {
			arrayAsString += ", " + variableAsString;
		}
	}
	return arrayAsString + "]";
}
