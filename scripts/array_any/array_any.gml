function array_any(sourceArray, testFunction, testParam) {
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (testFunction(sourceArray[i], testParam)) {
			return true;
		}
	}
	return false;
}
