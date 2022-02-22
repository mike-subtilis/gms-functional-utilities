function array_every(sourceArray, testFunction, testParam) {
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (!testFunction(sourceArray[i], testParam)) {
			return false;
		}
	}
	return true;
}
