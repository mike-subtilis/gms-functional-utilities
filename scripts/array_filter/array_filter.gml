function array_filter(sourceArray, testFunction, testParam) {
	var filteredArray = [];
	var filterIndex = 0;
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (testFunction(sourceArray[i], testParam)) {
			filteredArray[filterIndex++] = sourceArray[i];
		}
	}
	return filteredArray;
}
