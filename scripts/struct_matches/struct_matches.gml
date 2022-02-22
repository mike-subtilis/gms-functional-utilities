function struct_matches(actual, expectedMatch) {
	var expectedKeys = variable_struct_get_names(expectedMatch);
	for (var i = 0; i < array_length(expectedKeys); i++) {
		var valueResult = variable_deepEquals(actual[$ expectedKeys[i]], expectedMatch[$ expectedKeys[i]]);
		if (!valueResult) {
			return false;
		}
	}
	return true;
}
