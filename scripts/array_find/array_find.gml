function array_find(sourceArray, testFunction, testParam) {
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (testFunction(sourceArray[i], testParam)) {
			return sourceArray[i];
		}
	}
	return undefined;
}
