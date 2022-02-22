function array_contains(sourceArray, value) {
	for (var i = 0; i < array_length(sourceArray); i++) {
		if (sourceArray[i] == value) {
			return true;
		}
	}
	return false;
}
