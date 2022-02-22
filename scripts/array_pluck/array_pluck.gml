function array_pluck(structArray, field) {
	if (is_undefined(structArray)) {
		return [];
	}
	if (!is_array(structArray)) {
		throw ("array_pluck expected an array but found a " + typeof(structArray));
	}
	var fieldArray = array_create(array_length(structArray));
	for (var i = 0; i < array_length(structArray); i++) {
		fieldArray[i] = structArray[i][$ field];
	}
	return fieldArray;
}
