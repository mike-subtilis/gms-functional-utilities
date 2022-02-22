function array_map(sourceArray, mapFunction, mapParam) {
	if (is_undefined(sourceArray)) {
		return [];
	}
	var mappedArray = array_create(array_length(sourceArray));
	for (var i = 0; i < array_length(sourceArray); i++) {
		mappedArray[i] = mapFunction(sourceArray[i], mapParam);
	}
	return mappedArray;
}
