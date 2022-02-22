function array_reduce(sourceArray, memoItemReduceFunction, initialMemo, reduceFunctionParam) {
	if (is_undefined(sourceArray)) {
		return initialMemo;
	}
	var finalValue = initialMemo;
	for (var i = 0; i < array_length(sourceArray); i++) {
		finalValue = memoItemReduceFunction(finalValue, sourceArray[i], reduceFunctionParam);
	}
	return finalValue;
}
