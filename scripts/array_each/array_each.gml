function array_each(sourceArray, applyFunction, applyFunctionParam) {
	for (var i = 0; i < array_length(sourceArray); i++) {
		applyFunction(sourceArray[i], applyFunctionParam);
	}
}
